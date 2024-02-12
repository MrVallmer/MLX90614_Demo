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

static mlx90614_plugin_data_t data;

/// @Brief Initialize the plugin
void MLX90614_Plugin_Initialize ( mlx90614_drv_config_t *_driver_config )
{
    /* Load driver configuration. (if defined) */
    if (_driver_config != NULL) {
        
        memcpy(&data.driver_config, _driver_config, sizeof(_driver_config)); 
        
        // If parameter are empty use default value
        if (data.driver_config.pwr_pin == EMPTY_VALUE)
            data.driver_config.pwr_pin = GPIO_PIN_RA7;                                  // Use 0xFF value to disable power initialization
        if (data.driver_config.init_timeout_ms == EMPTY_VALUE)
            data.driver_config.init_timeout_ms = 840;                                   // Initialization timeout (depend on configuration setting time p.16)
        if (data.driver_config.write_timeout_ms == EMPTY_VALUE)
            data.driver_config.write_timeout_ms = 10;                                   // Used for read and write operation (p.17)
        if (data.driver_config.read_timeout_ms == EMPTY_VALUE)
            data.driver_config.read_timeout_ms = 10;                                    // Used for read and write operation (p.17)
        if (data.driver_config.slave_address == EMPTY_VALUE)
            data.driver_config.slave_address = 0x5A;                                    // Default slave address
        if (data.driver_config.fir_setting == EMPTY_VALUE)
            data.driver_config.fir_setting = MLX90614_DRV_IIR_100;                      // See table 9 for possible configuration
        if (data.driver_config.iir_setting == EMPTY_VALUE)
            data.driver_config.iir_setting = MLX90614_DRV_FIR_128;                      // See table 9 for possible configuration
        if (data.driver_config.ir_sensor_setting == EMPTY_VALUE)
            data.driver_config.ir_sensor_setting = MLX90614_DRV_IR_SENSOR_SINGLE;       // Measure only one object
        if (data.driver_config.emissivity == EMPTY_VALUE)
            data.driver_config.emissivity = 70;                                         // Emissivity equals to 0.70
        if (data.driver_config.repeat_sensor_test == EMPTY_VALUE)
            data.driver_config.repeat_sensor_test = 0;                                  // Not change to maintain factory calibration
        if (data.driver_config.t_channel == EMPTY_VALUE)
            data.driver_config.t_channel = MLX90614_DRV_TOBJ1_TOBJ2;                    // Used only in PWM mode
        if (data.driver_config.ks_sign == EMPTY_VALUE)
            data.driver_config.ks_sign = 0;                                             // Not change to maintain factory calibration
        if (data.driver_config.gain == EMPTY_VALUE)
            data.driver_config.gain = MLX90614_DRV_GAIN_12_5;                           // Not change to maintain factory calibration
        if (data.driver_config.kt2_sign == EMPTY_VALUE)
            data.driver_config.kt2_sign = 1;                                            // Not change to maintain factory calibration
        if (data.driver_config.sensor_test == EMPTY_VALUE)
            data.driver_config.sensor_test = 0;                                         // Not change to maintain factory calibration
        if (data.driver_config.pwm_mode == EMPTY_VALUE)
            data.driver_config.pwm_mode = MLX90614_DRV_PWM_MODE_SINGLE;                 // Used only in PWM mode
        if (data.driver_config.en_pwm == EMPTY_VALUE)
            data.driver_config.en_pwm = 0;                                              // Enable PWM mode
        if (data.driver_config.ppodb == EMPTY_VALUE)
            data.driver_config.ppodb = MLX90614_DRV_PPODB_OPEN_DRAIN;                   // Used only in PWM mode
        if (data.driver_config.trpwmb == EMPTY_VALUE)
            data.driver_config.trpwmb = MLX90614_DRV_TRPWMB_PWM_MODE_SELECTED;          // Enable thermal relay in PWM mode
        if (data.driver_config.pwm_repetition == EMPTY_VALUE)
            data.driver_config.pwm_repetition = 0;                                      // Used only in PWM mode
        if (data.driver_config.pwm_period == EMPTY_VALUE)
            data.driver_config.pwm_period = 1;                                          // Used only in PWM mode
        if (data.driver_config.to_max == EMPTY_VALUE)
            data.driver_config.to_max = 373;                                            // Used only in PWM mode
        if (data.driver_config.to_min == EMPTY_VALUE)   
            data.driver_config.to_min = 273;                                            // Used only in PWM mode
        if (data.driver_config.ta_max == EMPTY_VALUE)
            data.driver_config.ta_max = 120;                                            // Used only in PWM mode
        if (data.driver_config.ta_min == EMPTY_VALUE)
            data.driver_config.ta_min = 0;                                              // Used only in PWM mode
    }
    
    
  
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */



/*******************************************************************************
 End of File
 */
