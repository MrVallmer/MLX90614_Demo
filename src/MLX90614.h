/* ************************************************************************** */
/** Driver for MLX90614 temperature sensor

  @Company
     Gatewers

  @File Name
    MLX90614.h

  @Description
    Set all define, struct and variable for the driver.

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

/// @brief EEPROM table.
typedef union {

    struct {
        uint16_t to_max; // customer dependent object temperatures range max value
        uint16_t to_min; // customer dependent object temperatures range min value
        uint16_t pwmctrl; // Control bits for configuring the PWM/SDA pin
        uint16_t ta_range; // customer dependent ambient temperatures range
        uint16_t emissivity; // Object emissivity (factory default 1.0 = 0xFFFF)
        uint16_t config_register; // ConfigRegister1 consists of control bits for configuring the analog and digital parts
        uint16_t melexis_reserved_1[8];
        uint16_t smb_address; // Slave address of sensor module (SMBus)
        uint16_t melexis_reserved_2[13];
        uint16_t id_number[4];
    };
    uint16_t value[32];
} mlx90614_eeprom_table_t;

/// @brief RAM table.
typedef union {

    struct {
        uint16_t melexis_reserved_1[4];
        uint16_t ir_ch_1; // Infra-red measure channel 1
        uint16_t ir_ch_2; // Infra-red measure channel 2
        uint16_t t_a; // Ambient temperature
        uint16_t t_obj1; // Object temperature channel 1
        uint16_t t_obj2; // Object temperature channel 2
        uint16_t melexis_reserved_2[23];
    };
    uint16_t value[32];
} mlx90614_ram_table_t;

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
extern uint8_t MLX90614_SMBBegin(mlx90614_config_t* config);
extern uint8_t MLX90614_SMBGetTa(float *ta);
extern uint8_t MLX90614_SMBGetT0bj1(float *tobj);
extern uint8_t MLX90614_SMBGetT0bj2(float *tobj);
extern uint8_t MLX90614_SMBGetIRch1(uint16_t *ir_data);
extern uint8_t MLX90614_SMBGetIRch2(uint16_t *ir_data);

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif
