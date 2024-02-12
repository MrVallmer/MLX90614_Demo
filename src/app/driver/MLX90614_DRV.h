/* ************************************************************************** */
/** Driver for MLX90614 temperature sensor

  @Company
     Gatewers

  @File Name
    MLX90614_DRV.h

  @Description
    Set all define, struct and variable for the driver.

  @UserCase: Read measurements from MLX90614
     - begin driver: MLX90614_SMBStart()
     - loop and print measurement: MLX90614_SMBGetTa(...), MLX90614_SMBGetT0bj1(...), MLX90614_SMBGetT0bj2(...), 
                                   MLX90614_SMBGetIRch1(...), MLX90614_SMBGetIRch2(...)
  @ErrorCode: 
     - 0: ERROR_NONE;
     - 1: ERROR_EPPROM_READ; 
     - 2: ERROR_RAM_READ;
     - 4: ERROR_EEPROM_WRITE;
     - 8: ERROR_TEMPERATURE_INVALID;
 **/
/* ************************************************************************** */

#ifndef MLX90614_DRV_H    // Guards against multiple inclusion
#define MLX90614_DRV_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "config/LVLEU05/peripheral/gpio/plib_gpio.h"
#include "app/driver/I2C_DRV.h"
#include "app/service/log.h"
#include "FreeRTOS.h"
#include "task.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif
    
/// @brief Error code operational code    
#define MLX90614_DRV_ERROR_NONE                     0
#define MLX90614_DRV_ERROR_EPPROM_READ              1
#define MLX90614_DRV_ERROR_RAM_READ                 2
#define MLX90614_DRV_ERROR_EEPROM_WRITE             4
#define MLX90614_DRV_ERROR_TEMPERATURE_INVALID      8
    
/// @brief FIR settings.
typedef enum {
    MLX90614_DRV_FIR_8,
    MLX90614_DRV_FIR_16,
    MLX90614_DRV_FIR_32,
    MLX90614_DRV_FIR_64,
    MLX90614_DRV_FIR_128,
    MLX90614_DRV_FIR_256,
    MLX90614_DRV_FIR_512,
    MLX90614_DRV_FIR_1024,    
} mlx90614_drv_fir_setting_t;

/// @brief IIR settings.
typedef enum {
    MLX90614_DRV_IIR_50,
    MLX90614_DRV_IIR_25,
    MLX90614_DRV_IIR_17,
    MLX90614_DRV_IIR_13,
    MLX90614_DRV_IIR_100,
    MLX90614_DRV_IIR_80,
    MLX90614_DRV_IIR_67,
    MLX90614_DRV_IIR_57,    
} mlx90614_drv_iir_setting_t;

/// @brief IR settings.
typedef enum {
    MLX90614_DRV_IR_SENSOR_SINGLE,
    MLX90614_DRV_IR_SENSOR_DUAL   
} mlx90614_drv_ir_sensor_setting_t;

/// @brief Temperature channel settings.
typedef enum {
    MLX90614_DRV_TA_TOBJ1,
    MLX90614_DRV_TA_OBJ2,
    MLX90614_DRV_TOBJ2,
    MLX90614_DRV_TOBJ1_TOBJ2
} mlx90614_drv_t_channel_t;

/// @brief Gain settings.
typedef enum {
    MLX90614_DRV_GAIN_1,
    MLX90614_DRV_GAIN_3,
    MLX90614_DRV_GAIN_6,
    MLX90614_DRV_GAIN_12_5,
    MLX90614_DRV_GAIN_25,
    MLX90614_DRV_GAIN_50,
    MLX90614_DRV_GAIN_100,
    MLX90614_DRV_GAIN_200,
} mlx90614_drv_gain_t;

/// @brief Pwm mode settings.
typedef enum {
    MLX90614_DRV_PWM_MODE_EXTENDED,
    MLX90614_DRV_PWM_MODE_SINGLE,
} mlx90614_drv_pwm_mode_t;

/// @brief SDA pin mode settings.
typedef enum {
    MLX90614_DRV_PPODB_OPEN_DRAIN,
    MLX90614_DRV_PPODB_PUSH_PULL,
} mlx90614_drv_ppodb_t;

/// @brief Function mode settings.
typedef enum {
    MLX90614_DRV_TRPWMB_PWM_MODE_SELECTED,
    MLX90614_DRV_TRPWMB_THERMAL_MODE_SELECTED,
} mlx90614_drv_trpwmb_t;

/// @brief configuration parameters.
typedef union {
    typedef struct {
        uint16_t pwr_pin;
        uint16_t init_timeout_ms;
        uint16_t write_timeout_ms;
        uint16_t read_timeout_ms;
        uint16_t slave_address;
        uint16_t fir_setting;
        uint16_t iir_setting;
        uint16_t ir_sensor_setting;
        uint16_t emissivity;    
        uint16_t repeat_sensor_test;   
        uint16_t t_channel;
        uint16_t ks_sign;
        uint16_t gain;
        uint16_t kt2_sign;
        uint16_t sensor_test;    
        uint16_t pwm_mode;
        uint16_t en_pwm;
        uint16_t ppodb;
        uint16_t trpwmb;
        uint16_t pwm_repetition;
        uint16_t pwm_period;    
        uint16_t to_max;
        uint16_t to_min;
        uint16_t ta_max;
        uint16_t ta_min;    
    };
    uint16_t value[25];
} mlx90614_drv_config_t;

/* ************************************************************************** */
/// API methods
/* ************************************************************************** */
extern void MLX90614_DRV_Stop (void);

/* ************************************************************************** */
/// API methods for SMBus
/* ************************************************************************** */
extern uint8_t MLX90614_DRV_SMB_Start (mlx90614_drv_config_t* config);
extern uint8_t MLX90614_DRV_SMB_GetTa (float *ta);
extern uint8_t MLX90614_DRV_SMB_GetT0bj1 (float *tobj);
extern uint8_t MLX90614_DRV_SMB_GetT0bj2 (float *tobj);
extern uint8_t MLX90614_DRV_SMB_GetIRch1 (uint16_t *ir_data);
extern uint8_t MLX90614_DRV_SMB_GetIRch2 (uint16_t *ir_data);
extern uint64_t MLX90614_DRV_SMB_GetID (void);

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif
