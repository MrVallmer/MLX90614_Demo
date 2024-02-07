/* ************************************************************************** */
/** Driver for AT24xx EEPROM

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

#include "log.h"

/* ************************************************************************** */
/// TODO: Initialize log level stack and enable module flag
/* ************************************************************************** */

log_module_level_t* log_level_stack = NULL;
size_t log_stack_size = 0;  // Numero di istanze nello stack
bool log_enable = false;


/* ************************************************************************** */
/// TODO: Local Methods
/* ************************************************************************** */
static bool LOG_increment_stack (void);
static void LOG_print_time (void);
static bool LOG_set_level(uint8_t tag, uint8_t level, const char *name);

/* ************************************************************************** */
/// TODO: BASIC methods to manage module
/* ************************************************************************** */

/// @brief Print on stdout the timestamp
static void LOG_print_time (void) {
    
    uint32_t count = SYS_TIME_CounterGet();
    uint32_t ms    = SYS_TIME_CountToMS(count);
    
    uint32_t hour = ms / (1000 * 60 * 60);
    uint32_t minute = (ms / (1000 * 60)) % 60;
    uint32_t second = (ms / 1000) % 60;
    uint32_t millisecond = ms % 1000;
    
    printf("<%02u:%02u:%02u.%03u> ", hour, minute, second, millisecond);
}

/// @brief Increment the stack.
/// @return true if operation is correctly executed.
static bool LOG_increment_stack (void) {
    
    log_stack_size++;
    log_level_stack = (log_module_level_t*)realloc(log_level_stack, log_stack_size * sizeof(log_module_level_t));
    
    return (log_level_stack == NULL) ? false : true;    
}

/// @brief Add a module to the stack.
/// @param tag tag of the module.
/// @param message filter for module.
/// @param name of the module printed.
/// @return true if operation is correctly executed.
static bool LOG_set_level(uint8_t tag, uint8_t level, const char *name) {
    
    if (!log_enable)
        return true;
    
    // Increment the stack size and add the new istance
    if(LOG_increment_stack()) {
        
        log_level_stack[log_stack_size - 1].tag = tag;
        log_level_stack[log_stack_size - 1].level = level;
        log_level_stack[log_stack_size - 1].name = strdup(name);
        
        return true;
    }
    
    return false;
}

/* ************************************************************************** */
/// TODO: API methods to manage module
/* ************************************************************************** */

/// @brief Initialize the logger module. 
/// @param can disable the module printout also if initialized.
void LOG_initialize (bool enable) {
    
    log_enable = enable;
    
    if (!log_enable)
        return;
    
    uint8_t ret_code = 0;
    ret_code |= LOG_set_level(SYSTEM_LOG, LOG_DEBUG_LEVEL, "SYSTEM");
    ret_code |= LOG_set_level(MLX90614_LOG, LOG_DEBUG_LEVEL, "MLX90614");
    ret_code |= LOG_set_level(I2C_SMB_LOG, LOG_DEBUG_LEVEL, "I2C_SMB");
    
    if (ret_code != 0)
        LOG_print_critical(0, "Log module initialization error");
}

/// @brief Enable printout. 
void LOG_enable (void) {
    log_enable = true;
}

/// @brief Disable printout. 
void LOG_disable (void) {
    log_enable = false;
}

/// @brief Print debug message. 
void LOG_print_debug (uint8_t tag, const char *format, ...) {
    
    if (!log_enable)
        return;
    
    va_list args;
    va_start(args, format);
    
    for (int i = 0; i < log_stack_size; i++)
        if (log_level_stack[i].tag == tag)
        {
            if (LOG_LEVEL <= LOG_DEBUG_LEVEL)
                if (log_level_stack[i].level <= LOG_DEBUG_LEVEL ) {

                    LOG_print_time();
                    printf("[%s] DEBUG: ", log_level_stack[i].name);
                    vprintf(format, args);
                    printf("\n\r");
                }            
        }
}

/// @brief Print info message. 
void LOG_print_info (uint8_t tag, const char *format, ...) {
    
    if (!log_enable)
        return;
    
    va_list args;
    va_start(args, format);
    
    for (int i = 0; i < log_stack_size; i++)
        if (log_level_stack[i].tag == tag)
        {
            if (LOG_LEVEL <= LOG_INFO_LEVEL)
                if (log_level_stack[i].level <= LOG_INFO_LEVEL ) {
                
                    LOG_print_time();
                    printf("[%s] INFO: ", log_level_stack[i].name);
                    vprintf(format, args);
                    printf("\n\r");
                }            
        }
}

/// @brief Print warning message. 
void LOG_print_warning (uint8_t tag, const char *format, ...) {
    
    if (!log_enable)
        return;
    
    va_list args;
    va_start(args, format);
    
    for (int i = 0; i < log_stack_size; i++)
        if (log_level_stack[i].tag == tag)
        {
            if (LOG_LEVEL <= LOG_WARNING_LEVEL)
                if (log_level_stack[i].level <= LOG_WARNING_LEVEL ) {
                
                    LOG_print_time();
                    printf("[%s] WARNING: ", log_level_stack[i].name);
                    vprintf(format, args);
                    printf("\n\r");
                }            
        }
}

/// @brief Print error message. 
void LOG_print_error (uint8_t tag, const char *format, ...) {
    
    if (!log_enable)
        return;
    
    va_list args;
    va_start(args, format);
    
    for (int i = 0; i < log_stack_size; i++)
        if (log_level_stack[i].tag == tag)
        {
            if (LOG_LEVEL <= LOG_ERROR_LEVEL)
                if (log_level_stack[i].level <= LOG_ERROR_LEVEL ) {
                
                    LOG_print_time();
                    printf("[%s] ERROR: ", log_level_stack[i].name);
                    vprintf(format, args);
                    printf("\n\r");
                }            
        }
}

/// @brief Print critical message. 
void LOG_print_critical (uint8_t tag, const char *format, ...) {
    
    if (!log_enable)
        return;
    
    va_list args;
    va_start(args, format);
    
    for (int i = 0; i < log_stack_size; i++)
        if (log_level_stack[i].tag == tag)
        {
            if (LOG_LEVEL <= LOG_CRITICAL_LEVEL)
                if (log_level_stack[i].level <= LOG_CRITICAL_LEVEL ) {
                
                    LOG_print_time();
                    printf("[%s] CRITICAL: ", log_level_stack[i].name);
                    vprintf(format, args);
                    printf("\n\r");
                }            
        }
}