/* ************************************************************************** */
/** Driver for MLX90614 temperature sensor

  @Company
    Gatewers

  @File Name
    i2c_drv.c

  @Description
    See header file.
 */
/* ************************************************************************** */

#include "I2C_DRV.h"

/* ************************************************************************** */
/// TODO: General Definitions and default value
/* ************************************************************************** */

// Define the transfer status ...
typedef enum
{
    I2C_DRV_TRANSFER_STATUS_IN_PROGRESS,
    I2C_DRV_TRANSFER_STATUS_SUCCESS,
    I2C_DRV_TRANSFER_STATUS_ERROR,
    I2C_DRV_TRANSFER_STATUS_IDLE,

} I2C_DRV_TRANSFER_STATUS;

// @brief Initialization of the transfer status
static I2C_DRV_TRANSFER_STATUS transfer_status = I2C_DRV_TRANSFER_STATUS_IDLE;
// @brief Initialization of Semaphore to handle async operations
static SemaphoreHandle_t xSemaphore = NULL;

/* ************************************************************************** */
/// TODO: Local Methods
/* ************************************************************************** */

static void I2C_DRV_Callback (uintptr_t context );

/* ************************************************************************** */
/// TODO: BASIC driver methods to manage module initialization
/* ************************************************************************** */

/// @brief I2C Driver Callback
void I2C_DRV_Callback(uintptr_t context )
{
    I2C_DRV_TRANSFER_STATUS* transfer_status = (I2C_DRV_TRANSFER_STATUS*)context;

    if(SERCOM2_I2C_ErrorGet() == SERCOM_I2C_ERROR_NONE)
    {
        if (transfer_status)
            *transfer_status = I2C_DRV_TRANSFER_STATUS_SUCCESS;
    }
    else
    {
        if (transfer_status)
            *transfer_status = I2C_DRV_TRANSFER_STATUS_ERROR;
    }
}

/* ************************************************************************** */
/// TODO: API methods
/* ************************************************************************** */

/// @brief Start driver operations
bool I2C_DRV_Start (void) {
    
    /* Register the TWIHS Callback with transfer status as context */
    SERCOM2_I2C_CallbackRegister( I2C_DRV_Callback, (uintptr_t)&transfer_status );
    
    /* Create the semaphore to guard a shared resource.  As we are using
    the semaphore for mutual exclusion we create a mutex semaphore
    rather than a binary semaphore. */
    xSemaphore = xSemaphoreCreateMutex();
    
    if( xSemaphore == NULL )
        return false;
}

/// @brief Write-Read operation on I2C bus
bool I2C_DRV_WriteRead (uint16_t sa, uint8_t *wdata, uint8_t wlength, uint8_t *rdata, uint8_t rlength) {
  
    /* See if we can obtain the semaphore.  If the semaphore is not available wait to see if it becomes free. */
    if( xSemaphoreTake( xSemaphore, ( TickType_t ) (I2C_DRV_TIMEOUT_MS / portTICK_PERIOD_MS) ) == pdTRUE )
    {
        /* We were able to obtain the semaphore and can now access the shared resource. */

        // Initialize the transfer status
        transfer_status = I2C_DRV_TRANSFER_STATUS_IN_PROGRESS;  
        // Send the I2C command to read the register
        bool bValid = SERCOM2_I2C_WriteRead(sa, wdata, wlength, rdata, rlength);

        // Wait Bus free ...    
        int timeout_counter_step = 0;
        while(transfer_status == I2C_DRV_TRANSFER_STATUS_IN_PROGRESS) {

            vTaskDelay(I2C_DRV_TIMEOUT_STEP_MS / portTICK_PERIOD_MS);
            timeout_counter_step++;        
            if (timeout_counter_step*I2C_DRV_TIMEOUT_STEP_MS > I2C_DRV_TIMEOUT_MS) {
                LOG_print_error(I2C_SMB_LOG, "write-read operation timeout expired");
                return false;
            }                
        }

        // Capture possible error coming from I2C
        if (transfer_status != I2C_DRV_TRANSFER_STATUS_SUCCESS) {            
            LOG_print_error(I2C_SMB_LOG, "write-read operation transfer status invalid. Transfer code: %d", transfer_status);
            return false;   
        }                    

        /* We have finished accessing the shared resource.  Release the semaphore. */
        xSemaphoreGive( xSemaphore );
            
        return bValid;
    }
    
    LOG_print_error(I2C_SMB_LOG, "driver resource access timeout expired");
    return false;
}

/// @brief Write operation on I2C bus
bool I2C_DRV_Write (uint16_t sa, uint8_t *wdata, uint8_t wlength)
{
    /* See if we can obtain the semaphore.  If the semaphore is not available wait to see if it becomes free. */
    if( xSemaphoreTake( xSemaphore, ( TickType_t ) (I2C_DRV_TIMEOUT_MS / portTICK_PERIOD_MS) ) == pdTRUE )
    {
        /* We were able to obtain the semaphore and can now access the shared resource. */

        // Initialize the transfer status
        transfer_status = I2C_DRV_TRANSFER_STATUS_IN_PROGRESS;  
        // Send the I2C command to read the register
        bool bValid = SERCOM2_I2C_Write(sa, wdata, wlength);

        // Wait Bus free ...    
        int timeout_counter_step = 0;
        while(transfer_status == I2C_DRV_TRANSFER_STATUS_IN_PROGRESS) {

            vTaskDelay(I2C_DRV_TIMEOUT_STEP_MS / portTICK_PERIOD_MS);
            timeout_counter_step++;        
            if (timeout_counter_step*I2C_DRV_TIMEOUT_STEP_MS > I2C_DRV_TIMEOUT_MS) {
                LOG_print_error(I2C_SMB_LOG, "write operation timeout expired");
                return false;
            }                
        }

        // Capture possible error coming from I2C
        if (transfer_status != I2C_DRV_TRANSFER_STATUS_SUCCESS) {            
            LOG_print_error(I2C_SMB_LOG, "write operation transfer status invalid. Transfer code: %d", transfer_status);
            return false;   
        }                    

        /* We have finished accessing the shared resource.  Release the semaphore. */
        xSemaphoreGive( xSemaphore );
            
        return bValid;
    }
    
    LOG_print_error(I2C_SMB_LOG, "driver resource access timeout expired");
    return false;
}

/// @brief Read operation on I2C bus
bool I2C_DRV_Read (uint16_t sa, uint8_t *rdata, uint8_t rlength)
{
    /* See if we can obtain the semaphore.  If the semaphore is not available wait to see if it becomes free. */
    if( xSemaphoreTake( xSemaphore, ( TickType_t ) (I2C_DRV_TIMEOUT_MS / portTICK_PERIOD_MS) ) == pdTRUE )
    {
        /* We were able to obtain the semaphore and can now access the shared resource. */

        // Initialize the transfer status
        transfer_status = I2C_DRV_TRANSFER_STATUS_IN_PROGRESS;  
        // Send the I2C command to read the register
        bool bValid = SERCOM2_I2C_Read(sa, rdata, rlength);

        // Wait Bus free ...    
        int timeout_counter_step = 0;
        while(transfer_status == I2C_DRV_TRANSFER_STATUS_IN_PROGRESS) {

            vTaskDelay(I2C_DRV_TIMEOUT_STEP_MS / portTICK_PERIOD_MS);
            timeout_counter_step++;        
            if (timeout_counter_step*I2C_DRV_TIMEOUT_STEP_MS > I2C_DRV_TIMEOUT_MS) {
                LOG_print_error(I2C_SMB_LOG, "read operation timeout expired");
                return false;
            }                
        }

        // Capture possible error coming from I2C
        if (transfer_status != I2C_DRV_TRANSFER_STATUS_SUCCESS) {            
            LOG_print_error(I2C_SMB_LOG, "read operation transfer status invalid. Transfer code: %d", transfer_status);
            return false;   
        }                    

        /* We have finished accessing the shared resource.  Release the semaphore. */
        xSemaphoreGive( xSemaphore );
            
        return bValid;
    }
    
    LOG_print_error(I2C_SMB_LOG, "driver resource access timeout expired");
    return false;
}

