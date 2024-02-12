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

#include "log.h"
#include "MLX90614_DRV.h"


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
/* If Object temperature exceeed the threshold value added to ambient temperature trig an alarm */    
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



    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
