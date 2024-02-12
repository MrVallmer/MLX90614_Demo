/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    mlx90614_plugin.h

  @Summary
    Plugin for ingestion of datas extracted from MLX90614.

 */
/* ************************************************************************** */

#ifndef _MLX90614_PLUGIN_H    /* Guard against multiple inclusion */
#define _MLX90614_PLUGIN_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "configuration.h"

#include "app/service/log.h"
#include "app/driver/MLX90614_DRV.h"


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif


    /* ************************************************************************** */
    /* ************************************************************************** */
    /* Section: Constants                                                         */
    /* ************************************************************************** */
    /* ************************************************************************** */

    /*  A brief description of a section can be given directly below the section
        banner.
     */


    /* ************************************************************************** */
    /** Descriptive Constant Name

      @Summary
        Brief one-line summary of the constant.
    
      @Description
        Full description, explaining the purpose and usage of the constant.
        <p>
        Additional description in consecutive paragraphs separated by HTML 
        paragraph breaks, as necessary.
        <p>
        Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.
    
      @Remarks
        Any additional remarks
     */
#define EXAMPLE_CONSTANT 0


    // *****************************************************************************
    // *****************************************************************************
    // Section: Data Types
    // *****************************************************************************
    // *****************************************************************************

/* Plugin states

  Summary:
    Application states enumeration
*/

typedef enum
{
    /* Application's state machine's initial state. */
    MLX90614_PLUGIN_STATE_INIT,                                 // Initialization of sensor driver
    MLX90614_PLUGIN_STATE_POOL_SENSOR,                          // To get datas using sensor driver
    MLX90614_PLUGIN_STATE_SEND_MESSAGE,                         // Send the sensor data to parent task
    MLX90614_PLUGIN_STATE_ERROR,                                // To manage error and restart the plugin
    /* TODO: Define states used by the application state machine. */

} MLX90614_PLUGIN_STATE;

/* Plugin Data

  Summary:
    Holds plugin data
 */

typedef struct
{    
/* The plugin's current state */
    int state;    
/* If Object temperature exceed the threshold value added to ambient temperature trig an alarm */    
    float threshold;                                           
/* Pooling cycle time */       
    int pool_cycle_time;
/* Watching window. Number of cycle that define the observation window */ 
    int watching_cycle_number;
/* Starting measure in the watching window  */        
    float start_object_measure;
/* Ending measure in the watching window  */    
    float stop_object_measure;
/* Mean measure value in the watching window  */    
    float mean_object_measure;
/* Starting time of watching window  */    
    float watching_start_time;
/* Ending time of watching window  */ 
    float watching_stop_time;
/* Driver configuration */     
    mlx90614_drv_config_t driver_config;

} mlx90614_plugin_data_t;

// Default configuration values
#define MLX90614_PWR_PIN                 GPIO_PIN_RA7                            // Disable power intitialization
#define MLX90614_INIT_TIMEOUT_MS         840                                     // Initialization timeout (depend on configuration setting time)
#define MLX90614_SMB_TIMEOUT_MS          27                                      // Used for read and write operation (SMB)
#define MLX90614_SLAVE_ADDRESS           0x5A

// CONFIG_REISTER1
#define MLX90614_IIR_SETTING             MLX90614_DRV_IIR_100                    // Default setting (IIR = [100%]) 
#define MLX90614_FIR_SETTING             MLX90614_DRV_FIR_128                    // Default setting (FIR = [1024])  
#define MLX90614_IR_SENSOR_SETTING       MLX90614_DRV_IR_SENSOR_SINGLE           // Single IR sensor
#define MLX90614_REPEAT_SENSOR_TEST      false                                   // Repeat sensor test "OFF"
#define MLX90614_T_CHANNEL               MLX90614_DRV_TOBJ1_TOBJ2                // Set Tobj1, Tobj2 on PWM communication
#define MLX90614_KS_SIGN                 false                                   // Negative sign of Ks
#define MLX90614_GAIN                    MLX90614_DRV_GAIN_12_5                  // Default setting (GAIN = [12,5])  
#define MLX90614_KT2_SIGN                true                                    // Positive sign of Kt2
#define MLX90614_SENSOR_TEST             false                                   // Disable sensor test

// EMISSIVITY
#define MLX90614_EMISSIVITY                   0.70                                    // Emissivity  dec2hex[ round( 65535 x E) ]

// PWMCTRL
#define MLX90614_PWM_MODE                MLX90614_DRV_PWM_MODE_SINGLE            // PWM in single mode
#define MLX90614_EN_PWM                  false                                   // Disable PWM
#define MLX90614_PPODB                   MLX90614_DRV_PPODB_OPEN_DRAIN           // SDA pin configured as Open Drain (PPODB)
#define MLX90614_TRPWMB                  MLX90614_DRV_TRPWMB_PWM_MODE_SELECTED   // PWM mode selected (TRPWMB)
#define MLX90614_PWM_REPETITION          0                                       // PWM repetition number 0
#define MLX90614_PWM_PERIOD              1                                       // PWM period 1.024 ms

// Temperature range
#define MLX90614_TO_MAX                  250                                     // Max T object range ((T + 273,15) * 100), used in PWM mode 
#define MLX90614_TO_MIN                  -20                                     // Min T object range ((T + 273,15) * 100), used in PWM mode 
#define MLX90614_TA_MAX                  250                                     // Mac T ambient range ((T + 38,2) * 1,5625), used in PWM mode 
#define MLX90614_TA_MIN                  -20                                     // Min T ambinet range ((T + 38,2) * 1,5625), used in PWM mode 

// *****************************************************************************
// Section: Plugin Initialization and State Machine Functions
// *****************************************************************************

void MLX90614_Plugin_Initialize ( mlx90614_drv_config_t *_driver_config );
void MLX90614_Plugin_Tasks( void );

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
