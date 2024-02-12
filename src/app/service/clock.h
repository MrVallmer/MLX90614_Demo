/* ************************************************************************** */
/** Descriptive File Name

  @Company
     Gatewers

  @File Name
    clock.h

  @Summary
    Service to keep track of time in UTC format.

 */
/* ************************************************************************** */

#ifndef _CLOCK_H    /* Guard against multiple inclusion */
#define _CLOCK_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>  
#include <stddef.h>

#include "config/LVLEU05/system/time/sys_time.h"

#include "FreeRTOS.h"
#include "task.h"
#include "third_party/rtos/FreeRTOS/Source/include/semphr.h"


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    // *****************************************************************************
    // Section: Data Types
    // *****************************************************************************

    /** Contain the time in UTC format */
    typedef struct clock_utc_time_t {
        int hour;
        int minute;
        int second;
        int tts;
    } clock_utc_time_t;
    
    /// @brief Timeout definitions.
    #define CLOCK_TIMEOUT_MS          100

    /* ************************************************************************** */
    /// CLOCK API methods
    /* ************************************************************************** */

extern bool CLOCK_print_time (void);
extern bool CLOCK_get_time (clock_utc_time_t *utc_time);
extern void CLOCK_sync_time (void);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif

/* *****************************************************************************
 End of File
 */
