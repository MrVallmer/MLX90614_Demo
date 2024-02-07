/* ************************************************************************** */
/** Driver for MLX90614 temperature sensor

  @Company
     Gatewers

  @File Name
    i2c_smb.h

  @Description
    Set all define, struct and variable for the driver.

 **/
/* ************************************************************************** */

#ifndef I2C_SMB_H    // Guards against multiple inclusion
#define I2C_SMB_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif

/// @brief EEPROM table.
// Define the transfer status ...
typedef enum
{
    I2C_SMB_TRANSFER_STATUS_IN_PROGRESS,
    I2C_SMB_TRANSFER_STATUS_SUCCESS,
    I2C_SMB_TRANSFER_STATUS_ERROR,
    I2C_SMB_TRANSFER_STATUS_IDLE,

} I2C_SMB_TRANSFER_STATUS;


/* ************************************************************************** */
/// SMB API methods
/* ************************************************************************** */
extern void I2C_SMBBegin (void);
extern bool I2C_SMBWrite(uint16_t sa, uint8_t *wdata, uint8_t wlength);
extern bool I2C_SMBRead(uint16_t sa, uint8_t *rdata, uint8_t rlength);
extern bool I2C_SMBWriteRead(uint16_t sa, uint8_t *wdata, uint8_t wlength, uint8_t *rdata, uint8_t rlength);

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif
