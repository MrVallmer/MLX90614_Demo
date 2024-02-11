/* ************************************************************************** */
/** Driver for MLX90614 temperature sensor

  @Company
     Gatewers

  @File Name
    i2c_drv.h

  @Description
    Set all define, struct and variable for the driver.

 **/
/* ************************************************************************** */

#ifndef I2C_DRV_H    // Guards against multiple inclusion
#define I2C_DRV_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.h"
#include "log.h"
#include "FreeRTOS.h"
#include "task.h"
#include "third_party/rtos/FreeRTOS/Source/include/semphr.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif

/// @brief EEPROM table.
#define I2C_DRV_TIMEOUT_MS          100
#define I2C_DRV_TIMEOUT_STEP_MS     5

/* ************************************************************************** */
/// API methods
/* ************************************************************************** */
extern bool I2C_DRV_Start (void);
extern bool I2C_DRV_Write(uint16_t sa, uint8_t *wdata, uint8_t wlength);
extern bool I2C_DRV_Read(uint16_t sa, uint8_t *rdata, uint8_t rlength);
extern bool I2C_DRV_WriteRead(uint16_t sa, uint8_t *wdata, uint8_t wlength, uint8_t *rdata, uint8_t rlength);

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif
