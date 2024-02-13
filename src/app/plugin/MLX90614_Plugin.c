/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "MLX90614_Plugin.h"

// General Definitions
#define EMPTY_VALUE             0xFFFF

// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************

static mlx90614_plugin_data_t plugin_data;

/// @Brief In pooling state, start the watching window
static MLX90614_PLUGIN_STATE MLX90614_Plugin_StartWatchingWindow (void) {
    
    if (plugin_data.stop_object_measure == 0) {
        
        // Update starting measure
        plugin_data.start_object_measure = plugin_data.tobj; 
        
        // Update starting time
        if (!CLOCK_get_time(&plugin_data.watching_start_time)) {
            plugin_data.error_code = 0xFF;
            return MLX90614_PLUGIN_STATE_ERROR;
        }
        
        // Update mean measure value
        plugin_data.mean_object_measure = plugin_data.tobj;
        
    } else {
        // Copy value from stop point
        plugin_data.start_object_measure = plugin_data.stop_object_measure;  
        plugin_data.watching_start_time = plugin_data.watching_stop_time;
        
        // Update mean measure value
        plugin_data.mean_object_measure = plugin_data.stop_object_measure;
        plugin_data.mean_object_measure += (plugin_data.tobj - plugin_data.mean_object_measure) / (plugin_data.watching_cycle_number + 1);
    }
                    
    // Increment counter and continue ...
    plugin_data.watching_cycle_number++;                    
    vTaskDelay(plugin_data.pool_cycle_time_ms / portTICK_PERIOD_MS); 
    return MLX90614_PLUGIN_STATE_POOL_SENSOR;
}

/// @Brief In pooling state, continue the watching window
static MLX90614_PLUGIN_STATE MLX90614_Plugin_WatchingWindow (void) {
    
    // Update mean measure value
    plugin_data.mean_object_measure += (plugin_data.tobj - plugin_data.mean_object_measure) / (plugin_data.watching_cycle_number + 1);
                    
    // Increment counter and continue ...
    plugin_data.watching_cycle_number++;                    
    vTaskDelay(plugin_data.pool_cycle_time_ms / portTICK_PERIOD_MS); 
    return MLX90614_PLUGIN_STATE_POOL_SENSOR;
}

/// @Brief In pooling state, continue the watching window
static MLX90614_PLUGIN_STATE MLX90614_Plugin_StopWatchingWindow (void) {
    
    // Update stoping time
    if (!CLOCK_get_time(&plugin_data.watching_stop_time)) {
        plugin_data.error_code = 0xFF;
        return MLX90614_PLUGIN_STATE_ERROR;
    }
                    
    // Update mean measure value
    plugin_data.mean_object_measure += (plugin_data.tobj - plugin_data.mean_object_measure) / (plugin_data.watching_cycle_number + 1);
    
    // Update stoping measure
    plugin_data.stop_object_measure = plugin_data.tobj;
                    
    // Send message with value ...
    return MLX90614_PLUGIN_STATE_SEND_MESSAGE;
}

/// @Brief Reset the plugin
static void MLX90614_Plugin_Reset (void) {
    
    plugin_data.error_code = 0;
    plugin_data.thermal_relay_alarm = 0;
    plugin_data.thermal_relay_alarm = 0;
    plugin_data.start_object_measure = 0;
    plugin_data.stop_object_measure = 0;
    plugin_data.mean_object_measure = 0;
    plugin_data.watching_cycle_number = 0;    
    plugin_data.watching_start_time.hour = 0;
    plugin_data.watching_start_time.minute = 0;
    plugin_data.watching_start_time.second = 0;
    plugin_data.watching_start_time.tts = 0;
    plugin_data.watching_stop_time.hour = 0;
    plugin_data.watching_stop_time.minute = 0;
    plugin_data.watching_stop_time.second = 0;
    plugin_data.watching_stop_time.tts = 0;
}

/// @Brief Initialize the plugin
void MLX90614_Plugin_Initialize ( mlx90614_drv_config_t *_driver_config) {
    
    // Hardcode to remove
    plugin_data.threshold_on = 6;
    plugin_data.threshold_off = 4;
    plugin_data.pool_cycle_time_ms = 100;
    plugin_data.max_watching_cycle_number = 100;  
    
    /* Load driver configuration. (if defined) */
    if (_driver_config != NULL) {
        
        memcpy(&plugin_data.driver_config, _driver_config, sizeof(_driver_config)); 
        
        // If parameter are empty use default value
        if (plugin_data.driver_config.pwr_pin == EMPTY_VALUE)
            plugin_data.driver_config.pwr_pin = GPIO_PIN_RA7;                                  // Use 0xFF value to disable power initialization
        if (plugin_data.driver_config.init_timeout_ms == EMPTY_VALUE)
            plugin_data.driver_config.init_timeout_ms = 840;                                   // Initialization timeout (depend on configuration setting time p.16)
        if (plugin_data.driver_config.write_timeout_ms == EMPTY_VALUE)
            plugin_data.driver_config.write_timeout_ms = 10;                                   // Used for read and write operation (p.17)
        if (plugin_data.driver_config.read_timeout_ms == EMPTY_VALUE)
            plugin_data.driver_config.read_timeout_ms = 10;                                    // Used for read and write operation (p.17)
        if (plugin_data.driver_config.slave_address == EMPTY_VALUE)
            plugin_data.driver_config.slave_address = 0x5A;                                    // Default slave address
        if (plugin_data.driver_config.fir_setting == EMPTY_VALUE)
            plugin_data.driver_config.fir_setting = MLX90614_DRV_IIR_100;                      // See table 9 for possible configuration
        if (plugin_data.driver_config.iir_setting == EMPTY_VALUE)
            plugin_data.driver_config.iir_setting = MLX90614_DRV_FIR_128;                      // See table 9 for possible configuration
        if (plugin_data.driver_config.ir_sensor_setting == EMPTY_VALUE)
            plugin_data.driver_config.ir_sensor_setting = MLX90614_DRV_IR_SENSOR_SINGLE;       // Measure only one object
        if (plugin_data.driver_config.emissivity == EMPTY_VALUE)
            plugin_data.driver_config.emissivity = 70;                                         // Emissivity equals to 0.70
        if (plugin_data.driver_config.repeat_sensor_test == EMPTY_VALUE)
            plugin_data.driver_config.repeat_sensor_test = 0;                                  // Not change to maintain factory calibration
        if (plugin_data.driver_config.t_channel == EMPTY_VALUE)
            plugin_data.driver_config.t_channel = MLX90614_DRV_TOBJ1_TOBJ2;                    // Used only in PWM mode
        if (plugin_data.driver_config.ks_sign == EMPTY_VALUE)
            plugin_data.driver_config.ks_sign = 0;                                             // Not change to maintain factory calibration
        if (plugin_data.driver_config.gain == EMPTY_VALUE)
            plugin_data.driver_config.gain = MLX90614_DRV_GAIN_12_5;                           // Not change to maintain factory calibration
        if (plugin_data.driver_config.kt2_sign == EMPTY_VALUE)
            plugin_data.driver_config.kt2_sign = 1;                                            // Not change to maintain factory calibration
        if (plugin_data.driver_config.sensor_test == EMPTY_VALUE)
            plugin_data.driver_config.sensor_test = 0;                                         // Not change to maintain factory calibration
        if (plugin_data.driver_config.pwm_mode == EMPTY_VALUE)
            plugin_data.driver_config.pwm_mode = MLX90614_DRV_PWM_MODE_SINGLE;                 // Used only in PWM mode
        if (plugin_data.driver_config.en_pwm == EMPTY_VALUE)
            plugin_data.driver_config.en_pwm = 0;                                              // Enable PWM mode
        if (plugin_data.driver_config.ppodb == EMPTY_VALUE)
            plugin_data.driver_config.ppodb = MLX90614_DRV_PPODB_OPEN_DRAIN;                   // Used only in PWM mode
        if (plugin_data.driver_config.trpwmb == EMPTY_VALUE)
            plugin_data.driver_config.trpwmb = MLX90614_DRV_TRPWMB_PWM_MODE_SELECTED;          // Enable thermal relay in PWM mode
        if (plugin_data.driver_config.pwm_repetition == EMPTY_VALUE)
            plugin_data.driver_config.pwm_repetition = 0;                                      // Used only in PWM mode
        if (plugin_data.driver_config.pwm_period == EMPTY_VALUE)
            plugin_data.driver_config.pwm_period = 1;                                          // Used only in PWM mode
        if (plugin_data.driver_config.to_max == EMPTY_VALUE)
            plugin_data.driver_config.to_max = 373;                                            // Used only in PWM mode
        if (plugin_data.driver_config.to_min == EMPTY_VALUE)   
            plugin_data.driver_config.to_min = 273;                                            // Used only in PWM mode
        if (plugin_data.driver_config.ta_max == EMPTY_VALUE)
            plugin_data.driver_config.ta_max = 120;                                            // Used only in PWM mode
        if (plugin_data.driver_config.ta_min == EMPTY_VALUE)
            plugin_data.driver_config.ta_min = 0;                                              // Used only in PWM mode

    } else {
        // If parameter are empty use default value
        plugin_data.driver_config.pwr_pin = GPIO_PIN_RA7;                                  // Use 0xFF value to disable power initialization
        plugin_data.driver_config.init_timeout_ms = 840;                                   // Initialization timeout (depend on configuration setting time p.16)
        plugin_data.driver_config.write_timeout_ms = 10;                                   // Used for read and write operation (p.17)
        plugin_data.driver_config.read_timeout_ms = 10;                                    // Used for read and write operation (p.17)
        plugin_data.driver_config.slave_address = 0x5A;                                    // Default slave address
        plugin_data.driver_config.fir_setting = MLX90614_DRV_IIR_100;                      // See table 9 for possible configuration
        plugin_data.driver_config.iir_setting = MLX90614_DRV_FIR_128;                      // See table 9 for possible configuration
        plugin_data.driver_config.ir_sensor_setting = MLX90614_DRV_IR_SENSOR_SINGLE;       // Measure only one object
        plugin_data.driver_config.emissivity = 70;                                         // Emissivity equals to 0.70
        plugin_data.driver_config.repeat_sensor_test = 0;                                  // Not change to maintain factory calibration
        plugin_data.driver_config.t_channel = MLX90614_DRV_TOBJ1_TOBJ2;                    // Used only in PWM mode
        plugin_data.driver_config.ks_sign = 0;                                             // Not change to maintain factory calibration
        plugin_data.driver_config.gain = MLX90614_DRV_GAIN_12_5;                           // Not change to maintain factory calibration
        plugin_data.driver_config.kt2_sign = 1;                                            // Not change to maintain factory calibration
        plugin_data.driver_config.sensor_test = 0;                                         // Not change to maintain factory calibration
        plugin_data.driver_config.pwm_mode = MLX90614_DRV_PWM_MODE_SINGLE;                 // Used only in PWM mode
        plugin_data.driver_config.en_pwm = 0;                                              // Enable PWM mode
        plugin_data.driver_config.ppodb = MLX90614_DRV_PPODB_OPEN_DRAIN;                   // Used only in PWM mode
        plugin_data.driver_config.trpwmb = MLX90614_DRV_TRPWMB_PWM_MODE_SELECTED;          // Enable thermal relay in PWM mode
        plugin_data.driver_config.pwm_repetition = 0;                                      // Used only in PWM mode
        plugin_data.driver_config.pwm_period = 1;                                          // Used only in PWM mode
        plugin_data.driver_config.to_max = 373;                                            // Used only in PWM mode
        plugin_data.driver_config.to_min = 273;                                            // Used only in PWM mode
        plugin_data.driver_config.ta_max = 120;                                            // Used only in PWM mode
        plugin_data.driver_config.ta_min = 0;                                              // Used only in PWM mode
    }
    
    // Set plugin to init state
    plugin_data.state = MLX90614_PLUGIN_STATE_INIT;  
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void MLX90614_Plugin_Tasks ( void )
{    

    /* Check the application's current state. */
    switch ( plugin_data.state )
    {
        
        case MLX90614_PLUGIN_STATE_INIT:
        {
            LOG_print_info(MLX90614_PLUGIN_LOG, "Initialization");
  
            plugin_data.error_code |= MLX90614_DRV_SMB_Start( &plugin_data.driver_config );
            plugin_data.state = (plugin_data.error_code > 0) ? MLX90614_PLUGIN_STATE_ERROR : MLX90614_PLUGIN_STATE_POOL_SENSOR;
            
            // Reset the plugin
            MLX90614_Plugin_Reset(); 
            
            break;
        }
        
        case MLX90614_PLUGIN_STATE_POOL_SENSOR:   
        {
            // Read Object and Ambient tmeperature
            plugin_data.error_code |= MLX90614_DRV_SMB_GetTa(&plugin_data.ta);
            plugin_data.error_code |= MLX90614_DRV_SMB_GetT0bj1(&plugin_data.tobj);
            
            if (plugin_data.error_code == 0) {
                
                LOG_print_debug(MLX90614_PLUGIN_LOG, "Pooling MLX9614 sensor, TA = %f TOBJ = %f", plugin_data.ta, plugin_data.tobj);
                
                // Starting of a watching window?
                if (plugin_data.watching_cycle_number == 0)
                    plugin_data.state = MLX90614_Plugin_StartWatchingWindow();                    
                else if (plugin_data.watching_cycle_number < plugin_data.max_watching_cycle_number)
                    plugin_data.state = MLX90614_Plugin_WatchingWindow();
                
                // Assert possible error
                if (plugin_data.state == MLX90614_PLUGIN_STATE_ERROR)
                    break;
                    
                // Excced alarm threshold? Close watching window and set alarm
                if (plugin_data.tobj > plugin_data.ta + plugin_data.threshold_on) {
                    
                    // To prevent message bombing
                    if (!plugin_data.thermal_relay_alarm) {
                        // Set thermal alarm
                        plugin_data.thermal_relay_alarm = true;
                        // Close watching window
                        plugin_data.state = MLX90614_Plugin_StopWatchingWindow();
                        break;
                    }                    

                } else if (plugin_data.tobj < plugin_data.ta + plugin_data.threshold_off) {
                    plugin_data.thermal_relay_alarm = false;
                }
                
                // Watching window expired?
                if (plugin_data.watching_cycle_number >= plugin_data.max_watching_cycle_number) {
                    plugin_data.state = MLX90614_Plugin_StopWatchingWindow();
                }
                
                break;
            }
            
            plugin_data.state = MLX90614_PLUGIN_STATE_ERROR;
            break;
        }
        
        case MLX90614_PLUGIN_STATE_SEND_MESSAGE:
        {
            if (plugin_data.thermal_relay_alarm)
                LOG_print_info(MLX90614_PLUGIN_LOG, "Thermal relay alarm %d", plugin_data.thermal_relay_alarm);
            LOG_print_info(MLX90614_PLUGIN_LOG, "Watching window <%d:%d:%d.%d>T<%d:%d:%d.%d>: start %f, stop %f, mean %f", 
                    plugin_data.watching_start_time.hour,
                    plugin_data.watching_start_time.minute,
                    plugin_data.watching_start_time.second,
                    plugin_data.watching_start_time.tts,
                    plugin_data.watching_stop_time.hour,
                    plugin_data.watching_stop_time.minute,
                    plugin_data.watching_stop_time.second,
                    plugin_data.watching_stop_time.tts,
                    plugin_data.start_object_measure,
                    plugin_data.stop_object_measure,
                    plugin_data.mean_object_measure);
            
            // To implement message to parent task
            
            // Reset watching cycle number
            plugin_data.watching_cycle_number = 0;
            plugin_data.state = MLX90614_PLUGIN_STATE_POOL_SENSOR;
            vTaskDelay(plugin_data.pool_cycle_time_ms / portTICK_PERIOD_MS);
            break;
        }
        
        case MLX90614_PLUGIN_STATE_ERROR:  
        {
            LOG_print_error(MLX90614_PLUGIN_LOG, "code=%d, wait and restart", plugin_data.error_code);
            
            // To implement message to parent task
            
            // Stop driver and reset plugin
            MLX90614_DRV_Stop();  
            
            plugin_data.state = MLX90614_PLUGIN_STATE_INIT; 
            break;
        }
        
        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

/*******************************************************************************
 End of File
 */
