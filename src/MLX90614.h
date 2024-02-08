/* ************************************************************************** */
/** Driver for MLX90614 temperature sensor

  @Company
     Gatewers

  @File Name
    MLX90614.h

  @Description
    Set all define, struct and variable for the driver.

  @UserCase: Read measurements from MLX90614
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

#ifndef MLX90614_H    // Guards against multiple inclusion
#define MLX90614_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "config/LVLEU05/system/time/sys_time.h"
#include "config/LVLEU05/peripheral/gpio/plib_gpio.h"
#include "i2c_smb.h"
#include "log.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif
    
/// @brief Error code operational code 
#define MLX90614_LOG_LEVEL      LOG_INFO_LEVEL

/// @brief Error code operational code    
#define MLX90614_ERROR_NONE                     0
#define MLX90614_ERROR_EPPROM_READ              1
#define MLX90614_ERROR_RAM_READ                 2
#define MLX90614_ERROR_EEPROM_WRITE             4
#define MLX90614_ERROR_TEMPERATURE_INVALID      8
    
/// @brief FIR settings.
typedef enum {
    MLX90614_FIR_8,
    MLX90614_FIR_16,
    MLX90614_FIR_32,
    MLX90614_FIR_64,
    MLX90614_FIR_128,
    MLX90614_FIR_256,
    MLX90614_FIR_512,
    MLX90614_FIR_1024,    
} mlx90614_fir_setting_t;

/// @brief IIR settings.
typedef enum {
    MLX90614_IIR_50,
    MLX90614_IIR_25,
    MLX90614_IIR_17,
    MLX90614_IIR_13,
    MLX90614_IIR_100,
    MLX90614_IIR_80,
    MLX90614_IIR_67,
    MLX90614_IIR_57,    
} mlx90614_iir_setting_t;

/// @brief IR settings.
typedef enum {
    MLX90614_IR_SENSOR_SINGLE,
    MLX90614_IR_SENSOR_DUAL   
} mlx90614_ir_sensor_setting_t;

/// @brief configuration parameters.
typedef struct mlx90614_config_t {
    int pwr_pin;
    int init_timeout_ms;
    int write_timeout_ms;
    int read_timeout_ms;
    int slave_address;
    int fir_setting;
    int iir_setting;
    int ir_sensor_setting;
    float emissivity;
} mlx90614_config_t;

/* ************************************************************************** */
/// SMB API methods
/* ************************************************************************** */
extern uint8_t MLX90614_SMBStart (mlx90614_config_t* config);
extern void MLX90614_Stop (void);
extern uint8_t MLX90614_SMBGetTa (float *ta);
extern uint8_t MLX90614_SMBGetT0bj1 (float *tobj);
extern uint8_t MLX90614_SMBGetT0bj2 (float *tobj);
extern uint8_t MLX90614_SMBGetIRch1 (uint16_t *ir_data);
extern uint8_t MLX90614_SMBGetIRch2 (uint16_t *ir_data);
extern uint64_t MLX90614_SMBGetID (void);

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif
