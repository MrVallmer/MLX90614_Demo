/* ************************************************************************** */
/** Driver for MLX90614 temperature sensor

  @Company
    Gatewers

  @File Name
    i2c_smb.c

  @Description
    See header file.
 */
/* ************************************************************************** */

#include "i2c_smb.h"

/* ************************************************************************** */
/// TODO: General Definitions and default value
/* ************************************************************************** */

// Initialize the transfer status to default state
I2C_SMB_TRANSFER_STATUS transfer_status = I2C_SMB_TRANSFER_STATUS_IDLE;

/* ************************************************************************** */
/// TODO: Local Methods
/* ************************************************************************** */

void I2C_SMBCallback (uintptr_t context );

/* ************************************************************************** */
/// TODO: BASIC driver methods to manage module initialization
/* ************************************************************************** */

/// @brief SMB_I2C Callback
void I2C_SMBCallback(uintptr_t context )
{
    I2C_SMB_TRANSFER_STATUS* transfer_status = (I2C_SMB_TRANSFER_STATUS*)context;

    if(SERCOM2_I2C_ErrorGet() == SERCOM_I2C_ERROR_NONE)
    {
        if (transfer_status)
            *transfer_status = I2C_SMB_TRANSFER_STATUS_SUCCESS;
    }
    else
    {
        if (transfer_status)
            *transfer_status = I2C_SMB_TRANSFER_STATUS_ERROR;
    }
}

/* ************************************************************************** */
/// TODO: SMB API driver methods
/* ************************************************************************** */

/// @brief Initialization of the MLX90614 driver
void I2C_SMBBegin (void)
{
    /* Register the TWIHS Callback with transfer status as context */
    SERCOM2_I2C_CallbackRegister( I2C_SMBCallback, (uintptr_t)&transfer_status );
}

/// @brief Write and Read operation
bool I2C_SMBWriteRead (uint16_t sa, uint8_t *wdata, uint8_t wlength, uint8_t *rdata, uint8_t rlength)
{
    // Initialize the transfer status
    transfer_status = I2C_SMB_TRANSFER_STATUS_IN_PROGRESS;  
    // Send the I2C command to read the register
    bool bValid = SERCOM2_I2C_WriteRead(sa, wdata, wlength, rdata, rlength);
    
    // Wait Bus free ...    
    while(transfer_status == I2C_SMB_TRANSFER_STATUS_IN_PROGRESS);
    
    // Capture possible error coming from I2C
    if (transfer_status == I2C_SMB_TRANSFER_STATUS_ERROR)
        return false;

    return bValid;
}

/// @brief Write operation
bool I2C_SMBWrite (uint16_t sa, uint8_t *wdata, uint8_t wlength)
{
    // Initialize the transfer status
    transfer_status = I2C_SMB_TRANSFER_STATUS_IN_PROGRESS;  
    // Send the I2C command to write the register
    bool bValid = SERCOM2_I2C_Write(sa, wdata, wlength); 
    
    // Wait Bus free ...    
    while(transfer_status == I2C_SMB_TRANSFER_STATUS_IN_PROGRESS);
    
    // Capture possible error coming from I2C
    if (transfer_status == I2C_SMB_TRANSFER_STATUS_ERROR)
        return false;
    
    return bValid;
}

/// @brief Read operation
bool I2C_SMBRead (uint16_t sa, uint8_t *rdata, uint8_t rlength)
{
    // Initialize the transfer status
    transfer_status = I2C_SMB_TRANSFER_STATUS_IN_PROGRESS;  
    // Send the I2C command to write the register
    bool bValid = SERCOM2_I2C_Read(sa, rdata, rlength); 
    
    // Wait Bus free ...    
    while(transfer_status == I2C_SMB_TRANSFER_STATUS_IN_PROGRESS);
    
    // Capture possible error coming from I2C
    if (transfer_status == I2C_SMB_TRANSFER_STATUS_ERROR)
        return false;
    
    return bValid;
}
