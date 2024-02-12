/* ************************************************************************** */
/** 

  @Company
    Gatewers

  @File Name
    log.c

  @Summary
    See header file.

  @Description
    See header file.
 */
/* ************************************************************************** */

#include "clock.h"

/* ************************************************************************** */
/// TODO: General Definitions and default value
/* ************************************************************************** */

// @brief Initialize local value for time synchronization
static uint32_t sys_time_ms_offset = 0;
// @brief Initialization of Semaphore to handle async operations
static SemaphoreHandle_t xSemaphore = NULL;

/* ************************************************************************** */
/// TODO: BASIC methods to manage module
/* ************************************************************************** */

/// @brief Print on stdio the timestamp
bool CLOCK_print_time (void) {
    
    clock_utc_time_t utc_time = {0, 0, 0, 0};
    
    if (CLOCK_get_time(&utc_time))  
        return printf("<%02u:%02u:%02u.%03u>", utc_time.hour, utc_time.minute, utc_time.second, utc_time.tts) > 0;
    
    return false;
}

/// @brief Get timestamp
bool CLOCK_get_time (clock_utc_time_t *utc_time) {
    
    if (xSemaphore == NULL)
    {
        /* Create the semaphore to guard a shared resource.  As we are using
        the semaphore for mutual exclusion we create a mutex semaphore
        rather than a binary semaphore. */
        xSemaphore = xSemaphoreCreateMutex();
        
        if (xSemaphore == NULL)
            return false;
    }
    
    if( xSemaphoreTake( xSemaphore, ( TickType_t ) (CLOCK_TIMEOUT_MS / portTICK_PERIOD_MS) ) == pdTRUE )
    {
        uint32_t count = SYS_TIME_CounterGet();
        uint32_t ms    = SYS_TIME_CountToMS(count) + sys_time_ms_offset;

        utc_time->hour = ms / (1000 * 60 * 60);
        utc_time->minute = (ms / (1000 * 60)) % 60;
        utc_time->second = (ms / 1000) % 60;
        utc_time->tts = ms % 1000;
        
        /* We have finished accessing the shared resource.  Release the semaphore. */
        xSemaphoreGive( xSemaphore );
        return true;
    }
    
    return false;
}

/// @brief Increment the stack.
/// @return true if operation is correctly executed.
void CLOCK_sync_time (void) {
    

}