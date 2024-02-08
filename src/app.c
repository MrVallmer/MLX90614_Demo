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

#include "app.h"

#include <string.h>
#include "configuration.h"
#include "definitions.h"


// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

APP_DATA appData;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_IDLE;
    appData.timeout = 2000;
    appData.ta = 0;
    appData.tobj1 = 0;
    appData.tobj2 = 0;
    appData.ir1 = 0;
    appData.ir2 = 0;
    
    // TODO: User configuration to test for MLX90614
    appData.mlx90614_config.pwr_pin = GPIO_PIN_RA7;
    appData.mlx90614_config.init_timeout_ms = 1000;
    appData.mlx90614_config.write_timeout_ms = 25;
    appData.mlx90614_config.read_timeout_ms = 25;
    appData.mlx90614_config.slave_address = 0x5A;
    appData.mlx90614_config.fir_setting = MLX90614_FIR_128;
    appData.mlx90614_config.iir_setting = MLX90614_IIR_100;
    appData.mlx90614_config.ir_sensor_setting = MLX90614_IR_SENSOR_SINGLE;
    appData.mlx90614_config.emissivity = 0.95;
    
    // Initialize logger
    LOG_initialize (true);  
    
    // Initialize application
    appData.state = APP_STATE_INIT;
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{    

    /* Check the application's current state. */
    switch ( appData.state )
    {
        
        case APP_STATE_INIT:
        {
            // Set LED status
            GPIO_LED_BLUE_Clear(); GPIO_LED_RED_Set(); GPIO_LED_GREEN_Set();
            
            LOG_print_info(SYSTEM_LOG, "System initialization (I2C, MLX90614) ...");
            I2C_SMBBegin();
            appData.error_code = MLX90614_SMBStart(&appData.mlx90614_config);
            
            if (appData.error_code > 0)
                appData.state = APP_STATE_ERROR;
            else
                appData.state = APP_STATE_IDLE;
            
            break;
        }
        
        case APP_STATE_IDLE:
        {
            // Set LED status
            GPIO_LED_RED_Clear(); GPIO_LED_GREEN_Clear(); GPIO_LED_BLUE_Set();                       
            
            vTaskDelay(appData.timeout / portTICK_PERIOD_MS);
            appData.state = APP_STATE_READ; 
            break;
        }

        case APP_STATE_READ:   
        {
            // Set LED status
            GPIO_LED_BLUE_Clear(); GPIO_LED_RED_Clear(); GPIO_LED_GREEN_Set();   
            
            appData.error_code |= MLX90614_SMBGetTa(&appData.ta);
            appData.error_code |= MLX90614_SMBGetT0bj1(&appData.tobj1);
            appData.error_code |= MLX90614_SMBGetT0bj2(&appData.tobj2);
            appData.error_code |= MLX90614_SMBGetIRch1(&appData.ir1);
            appData.error_code |= MLX90614_SMBGetIRch2(&appData.ir2);
            
            if (appData.error_code == 0)
                appData.state = APP_STATE_IDLE; 
            else
                appData.state = APP_STATE_ERROR;            
            break;
        }
        
        case APP_STATE_ERROR:  
        {
            // Set LED status
            GPIO_LED_GREEN_Clear(); GPIO_LED_BLUE_Clear(); GPIO_LED_RED_Set();
            
            LOG_print_error(SYSTEM_LOG, "code=%d, wait and restart ...", appData.error_code);
            vTaskDelay(appData.timeout / portTICK_PERIOD_MS);
            
            // Stop driver and reset error code
            MLX90614_Stop();
            appData.error_code = 0;
            appData.state = APP_STATE_INIT; 
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
