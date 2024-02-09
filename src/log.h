/* ************************************************************************** */
/** Descriptive File Name

  @Company
     Gatewers

  @File Name
    MLX90614h

  @Summary
    header file for MLX90614.

  @Description
    set all define, struct and variable for the driver.

  @UserCase: Read measurements from MLX90614
     - set configuration (optional): MLX90614_clear_config(), 
                                     MLX90614_config_pinout(...), MLX90614_config_i2c(...), MLX90614_config_filter(...)
     - begin driver: MLX90614_SMBbegin()
     - loop and print measurement: MLX90614_SMB_GetTa(...), MLX90614_SMB_GetT0bj1(...), MLX90614_SMB_GetT0bj2(...), 
                                   MLX90614_SMB_GetIRch1(...), MLX90614_SMB_GetIRch2(...)
  @ErrorCode: 
     - 0: ERROR_NONE;
     - 1: ERROR_EPPROM_READ; 
     - 2: ERROR_RAM_READ;
     - 4: ERROR_EEPROM_WRITE;
     - 8: ERROR_TEMPERATURE_INVALID;
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

#include "config/LVLEU05/system/time/sys_time.h"

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

#define SYSTEM_LOG          1 
#define I2C_SMB_LOG         2
#define MLX90614_LOG        10



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

#endif
