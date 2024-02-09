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
// Semaphore creation
SemaphoreHandle_t xSemaphore = NULL;

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
bool I2C_SMBBegin (void) {
    
    /* Register the TWIHS Callback with transfer status as context */
    SERCOM2_I2C_CallbackRegister( I2C_SMBCallback, (uintptr_t)&transfer_status );
    
    /* Create the semaphore to guard a shared resource.  As we are using
    the semaphore for mutual exclusion we create a mutex semaphore
    rather than a binary semaphore. */
    xSemaphore = xSemaphoreCreateMutex();
    
    if( xSemaphore == NULL )
        return false;
}

/// @brief Write and Read operation
bool I2C_SMBWriteRead (uint16_t sa, uint8_t *wdata, uint8_t wlength, uint8_t *rdata, uint8_t rlength) {
  
    /* See if we can obtain the semaphore.  If the semaphore is not
    available wait 10 ticks to see if it becomes free. */
    if( xSemaphoreTake( xSemaphore, ( TickType_t ) (I2C_SMB_TIMEOUT_MS / portTICK_PERIOD_MS) ) == pdTRUE )
    {
        /* We were able to obtain the semaphore and can now access the
        shared resource. */

        // Initialize the transfer status
        transfer_status = I2C_SMB_TRANSFER_STATUS_IN_PROGRESS;  
        // Send the I2C command to read the register
        bool bValid = SERCOM2_I2C_WriteRead(sa, wdata, wlength, rdata, rlength);

        // Wait Bus free ...    
        int timeout_counter_step = 0;
        while(transfer_status == I2C_SMB_TRANSFER_STATUS_IN_PROGRESS) {

            vTaskDelay(I2C_SMB_STEP_MS / portTICK_PERIOD_MS);
            timeout_counter_step++;        
            if (timeout_counter_step*I2C_SMB_STEP_MS > I2C_SMB_TIMEOUT_MS) {
                LOG_print_error(I2C_SMB_LOG, "transmit timeout expired");
                return false;
            }                
        }

        // Capture possible error coming from I2C
        if (transfer_status == I2C_SMB_TRANSFER_STATUS_ERROR) {            
            LOG_print_error(I2C_SMB_LOG, "transfer status %d", transfer_status);
            return false;   
        }                    

        /* We have finished accessing the shared resource.  Release the
        semaphore. */
        xSemaphoreGive( xSemaphore );
            
        return bValid;
    }
    
    LOG_print_error(I2C_SMB_LOG, "concurrent access");
    return false;
}

/// @brief Write operation
bool I2C_SMBWrite (uint16_t sa, uint8_t *wdata, uint8_t wlength)
{
    
    /* See if we can obtain the semaphore.  If the semaphore is not
    available wait 10 ticks to see if it becomes free. */
    if( xSemaphoreTake( xSemaphore, ( TickType_t ) (I2C_SMB_TIMEOUT_MS / portTICK_PERIOD_MS) ) == pdTRUE )
    {
        /* We were able to obtain the semaphore and can now access the
        shared resource. */

        // Initialize the transfer status
        transfer_status = I2C_SMB_TRANSFER_STATUS_IN_PROGRESS;  
        // Send the I2C command to read the register
        bool bValid = SERCOM2_I2C_Write(sa, wdata, wlength);

        // Wait Bus free ...    
        int timeout_counter_step = 0;
        while(transfer_status == I2C_SMB_TRANSFER_STATUS_IN_PROGRESS) {

            vTaskDelay(I2C_SMB_STEP_MS / portTICK_PERIOD_MS);
            timeout_counter_step++;        
            if (timeout_counter_step*I2C_SMB_STEP_MS > I2C_SMB_TIMEOUT_MS) {
                LOG_print_error(I2C_SMB_LOG, "transmit timeout expired");
                return false;
            }                
        }

        // Capture possible error coming from I2C
        if (transfer_status == I2C_SMB_TRANSFER_STATUS_ERROR) {            
            LOG_print_error(I2C_SMB_LOG, "transfer status %d", transfer_status);
            return false;   
        }                    

        /* We have finished accessing the shared resource.  Release the
        semaphore. */
        xSemaphoreGive( xSemaphore );
            
        return bValid;
    }
    
    LOG_print_error(I2C_SMB_LOG, "concurrent access");
    return false;
}

/// @brief Read operation
bool I2C_SMBRead (uint16_t sa, uint8_t *rdata, uint8_t rlength)
{
    
    /* See if we can obtain the semaphore.  If the semaphore is not
    available wait 10 ticks to see if it becomes free. */
    if( xSemaphoreTake( xSemaphore, ( TickType_t ) (I2C_SMB_TIMEOUT_MS / portTICK_PERIOD_MS) ) == pdTRUE )
    {
        /* We were able to obtain the semaphore and can now access the
        shared resource. */

        // Initialize the transfer status
        transfer_status = I2C_SMB_TRANSFER_STATUS_IN_PROGRESS;  
        // Send the I2C command to read the register
        bool bValid = SERCOM2_I2C_Read(sa, rdata, rlength);

        // Wait Bus free ...    
        int timeout_counter_step = 0;
        while(transfer_status == I2C_SMB_TRANSFER_STATUS_IN_PROGRESS) {

            vTaskDelay(I2C_SMB_STEP_MS / portTICK_PERIOD_MS);
            timeout_counter_step++;        
            if (timeout_counter_step*I2C_SMB_STEP_MS > I2C_SMB_TIMEOUT_MS) {
                LOG_print_error(I2C_SMB_LOG, "transmit timeout expired");
                return false;
            }                
        }

        // Capture possible error coming from I2C
        if (transfer_status == I2C_SMB_TRANSFER_STATUS_ERROR) {            
            LOG_print_error(I2C_SMB_LOG, "transfer status %d", transfer_status);
            return false;   
        }                    

        /* We have finished accessing the shared resource.  Release the
        semaphore. */
        xSemaphoreGive( xSemaphore );
            
        return bValid;
    }
    
    LOG_print_error(I2C_SMB_LOG, "concurrent access");
    return false;
}

