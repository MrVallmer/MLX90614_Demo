/* ************************************************************************** */
/**

  @Company
    Gatewers

  @File Name
    log.h

  @Summary
    Service to manage log messages.
 * 
**/
/* ************************************************************************** */

#ifndef LOG_H    // Guards against multiple inclusion
#define LOG_H

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>  
#include <stddef.h>
#include "clock.h"

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

// Definition of level for log
#define LOG_DEBUG_LEVEL        1 
#define LOG_INFO_LEVEL         2
#define LOG_WARNING_LEVEL      3
#define LOG_ERROR_LEVEL        4
#define LOG_CRITICAL_LEVEL     5

// Change the main log level as you want, it impact on all modules
#define LOG_LEVEL              LOG_DEBUG_LEVEL

typedef struct {
    uint8_t tag;
    uint8_t level;
    char *name;
} log_module_level_t;

/* ************************************************************************** */
/// LOG tags
/* ************************************************************************** */

#define SYSTEM_LOG              1 
#define I2C_DRV_LOG             2

#define MLX90614_DRV_LOG        20

#define MLX90614_PLUGIN_LOG     40


/* ************************************************************************** */
/// LOG API methods
/* ************************************************************************** */
extern void LOG_initialize (bool enable);
extern void LOG_enable (void);
extern void LOG_disable (void);
extern void LOG_modify_level (uint8_t tag, uint8_t level);
extern void LOG_print_debug (uint8_t tag, const char *format, ...);
extern void LOG_print_info (uint8_t tag, const char *format, ...);
extern void LOG_print_warning (uint8_t tag, const char *format, ...);
extern void LOG_print_error (uint8_t tag, const char *format, ...);
extern void LOG_print_critical (uint8_t tag, const char *format, ...);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif
