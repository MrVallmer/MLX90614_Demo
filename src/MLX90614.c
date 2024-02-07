/* ************************************************************************** */
/** Driver for MLX90614 temperature sensor

  @Company
    Gatewers

  @File Name
    MLX90632.c

  @Description
    See header file.
 */
/* ************************************************************************** */

#include "MLX90614.h"

/* ************************************************************************** */
/// TODO: General Definitions and default value
/* ************************************************************************** */

// General Definitions
#define POWER_DOWN              0
#define POWER_UP                1
#define DFT_PWR_PIN             GPIO_PIN_RA7                // Disable power intitialization
#define DFT_TNIT_TIMEOUT_MS     840                         // Initialization timeout (depend on configuration setting time)
#define DFT_SMB_TIMEOUT_MS      27                          // Used for read and write operation (SMB)
#define DFT_SLAVE_ADDRESS       0x5A
#define DFT_IIR_SETTING         MLX90614_IIR_57             // Default setting (IIR = [57%] 7) 
#define DFT_FIR_SETTING         MLX90614_FIR_128            // Default setting (FIR = [128] 4)    
#define DFT_IR_SENSOR_SETTING   MLX90614_IR_SENSOR_SINGLE   // Dual IR sensor
#define DFT_EMISSIVITY          0.90                        // Emissivity  dec2hex[ round( 65535 x ?) ]
#define EMPTY_VALUE             0xFFFF

/* ************************************************************************** */
/// TODO: SMB mode Definitions
/* ************************************************************************** */

#define SMB_PEC_POLYNOMIAL                 0x0107            // Polynomial for pec verification
#define SMB_CMD_RAM_ACCESS                 0x00              // SMB command for RAM access
#define SMB_CMD_EEPROM_ACCESS              0x20              // SMB command for EEPROM access
#define SMB_CMD_REG_MASK                   0x1F              // SMB mask for register to use for RAM, EEPROM command access
#define CMD_FLAG_READ                      0xF1              // SMB command to read FLAG
#define CMD_ENTER_SLEEP                    0xFF              // SMB command to enter in sleep mode

/* ************************************************************************** */
/// TODO: Register address for RAM table (SMB mode)
/* ************************************************************************** */

#define SMB_RAM_IRCH1_REG_ADDR             0x04 
#define SMB_RAM_IRCH2_REG_ADDR             0x05 
#define SMB_RAM_TA_REG_ADDR                0x06 
#define SMB_RAM_TOBJ1_REG_ADDR             0x07 
#define SMB_RAM_TOBJ2_REG_ADDR             0x08 

/* ************************************************************************** */
/// TODO: Register address for EEPROM table (SMB mode)
/* ************************************************************************** */
#define SMB_EEPROM_TO_MAX_REG_ADDR         0x00
#define SMB_EEPROM_TO_MIN_REG_ADDR         0x01
#define SMB_EEPROM_PWMCTRL_REG_ADDR        0x02
#define SMB_EEPROM_TA_RANGE_REG_ADDR       0x03
#define SMB_EEPROM_EMISSIVITY_REG_ADDR     0x04
#define SMB_EEPROM_CFG_REG_ADDR            0x05
#define SMB_EEPROM_SA_REG_ADDR             0x0E
#define SMB_EEPROM_ID_N1_REG_ADDR          0x1C
#define SMB_EEPROM_ID_N2_REG_ADDR          0x1D
#define SMB_EEPROM_ID_N3_REG_ADDR          0x1E
#define SMB_EEPROM_ID_N4_REG_ADDR          0x1F

/* ************************************************************************** */
/// TODO: Table initialization
/* ************************************************************************** */

mlx90614_eeprom_table_t mlx90614_eeprom_table;
mlx90614_ram_table_t mlx90614_ram_table;
mlx90614_config_t mlx90614_config;

/* ************************************************************************** */
/// TODO: Local Methods
/* ************************************************************************** */

void MLX90614_powerup (void);
void MLX90614_powerdown (void);
void MLX90614_init (mlx90614_config_t *config);
void MLX90614_dft_config (void);
void MLX90614_config(mlx90614_config_t *config);
void MLX90614_Delay (uint32_t ms);

bool SMB_read (uint8_t *wdata, uint8_t wlength, uint8_t *rdata, uint8_t rlength);
bool SMB_write (uint8_t *wdata, uint8_t wlength);

uint8_t MLX90614_SMBpec(uint8_t* data, size_t length);
bool MLX90614_SMBcommand (uint8_t command);
bool MLX90614_SMBread (uint8_t command, uint16_t* value);
bool MLX90614_SMBwrite (uint8_t command, uint16_t value);
bool MLX90614_SMBread_EEPROM (uint8_t reg_addr, uint16_t* value);
bool MLX90614_SMBread_RAM (uint8_t reg_addr, uint16_t* value);
bool MLX90614_SMBwrite_EEPROM (uint8_t reg_addr, uint16_t value);
bool MLX90614_SMBdumpEE (void);
bool MLX90614_SMBdumpRAM (void);

bool MLX90614_SMB_Set_ConfigRegister (uint16_t mask, int shift, uint16_t value);
bool MLX90614_SMB_Set_FIR (uint16_t value);
bool MLX90614_SMB_Set_IIR (uint16_t value);
bool MLX90614_SMB_Set_IR_Sensor (uint16_t value);
bool MLX90614_SMB_Set_Emissivity (float value);

/* ************************************************************************** */
/// TODO: BASIC driver methods to manage power and module initialization
/* ************************************************************************** */

/// @Brief standard delay
void MLX90614_Delay (uint32_t ms)
{
    SYS_TIME_HANDLE timer = SYS_TIME_HANDLE_INVALID;

    if (SYS_TIME_DelayMS(ms, &timer) != SYS_TIME_SUCCESS)
    {
        LOG_print_critical(MLX90614_LOG, "delay %u failed", ms);
    }
    else if(SYS_TIME_DelayIsComplete(timer) != true)
    {          
        while (SYS_TIME_DelayIsComplete(timer) == false);
    }
}

/// @brief Power up the MLX90614 module (only if defined)
void MLX90614_powerup (void) {

    // Check if power module is configured
    if (mlx90614_config.pwr_pin != 0xFF) {
        // Set power to high level
        LOG_print_debug(MLX90614_LOG, "power up");
        GPIO_PinWrite(mlx90614_config.pwr_pin, POWER_UP);
    }

    // Wait setting time to be on safe side
    MLX90614_Delay(mlx90614_config.init_timeout_ms);
}

/// @brief Power down the MLX90614 module (only if defined)
void MLX90614_powerdown (void) {

    // Check if power module is configured
    if (mlx90614_config.pwr_pin != 0xFF) {
        // Set power to high level
        LOG_print_debug(MLX90614_LOG, "power down");
        GPIO_PinWrite(mlx90614_config.pwr_pin, POWER_DOWN);
    }

    // Wait setting time to be on safe side
    MLX90614_Delay(mlx90614_config.init_timeout_ms);
}

/// @brief Initialization of the MLX90614 driver
void MLX90614_init (mlx90614_config_t* config)
{
    // Initialize configuration with default values
    if (config == NULL)
        MLX90614_dft_config();
    else
        MLX90614_config(config);

    // Initialize EEPROM memory table with default empty value
    for (int i = 0; i < 32; i++)
        mlx90614_eeprom_table.value[0] = EMPTY_VALUE;

    // Initialize RAM memory table with default empty value
    for (int i = 0; i < 32; i++)
        mlx90614_ram_table.value[0] = EMPTY_VALUE;  

    // Power Up
    MLX90614_powerup();
}

/// @brief Load the default configuration (only if empty)
void MLX90614_dft_config (void) {

    LOG_print_debug(MLX90614_LOG, "load default configuration");
    mlx90614_config.pwr_pin = DFT_PWR_PIN;
    mlx90614_config.init_timeout_ms = DFT_TNIT_TIMEOUT_MS;
    mlx90614_config.write_timeout_ms = DFT_SMB_TIMEOUT_MS;
    mlx90614_config.read_timeout_ms = DFT_SMB_TIMEOUT_MS;
    mlx90614_config.slave_address = DFT_SLAVE_ADDRESS;
    mlx90614_config.fir_setting = DFT_FIR_SETTING;
    mlx90614_config.iir_setting = DFT_IIR_SETTING;
    mlx90614_config.ir_sensor_setting = DFT_IR_SENSOR_SETTING;
    mlx90614_config.emissivity = DFT_EMISSIVITY;
}

/// @brief Load the user configuration.
/// @param config user configuration.
void MLX90614_config(mlx90614_config_t *config) {

    LOG_print_debug(MLX90614_LOG, "load user configuration");
    mlx90614_config.pwr_pin = config->pwr_pin;
    mlx90614_config.slave_address = config->slave_address & 0x7F;
    mlx90614_config.read_timeout_ms = config->read_timeout_ms;
    mlx90614_config.write_timeout_ms = config->write_timeout_ms;
    mlx90614_config.iir_setting = config->iir_setting & 0x07;
    mlx90614_config.fir_setting = config->fir_setting & 0x07;
    mlx90614_config.init_timeout_ms = config->init_timeout_ms;
    mlx90614_config.ir_sensor_setting = config->ir_sensor_setting;
    mlx90614_config.emissivity = config->emissivity;
}

/* ************************************************************************** */
/// TODO: BASIC driver methods to manage i2c interface
/* ************************************************************************** */

/// @brief Read sensor register
bool SMB_read (uint8_t *wdata, uint8_t wlength, uint8_t *rdata, uint8_t rlength)
{
    // Send the I2C command to read the register
    bool bValid = I2C_SMBWriteRead((uint16_t) mlx90614_config.slave_address, wdata, wlength, rdata, rlength);
    
    // Wait ...   
    MLX90614_Delay(mlx90614_config.read_timeout_ms);

    return bValid;
}

/// @brief Write sensor register
bool SMB_write (uint8_t *wdata, uint8_t wlength)
{
    // Send the I2C command to write the register
    bool bValid = I2C_SMBWrite((uint16_t) mlx90614_config.slave_address, wdata, wlength); 
    
    // Wait ...   
    MLX90614_Delay(mlx90614_config.write_timeout_ms);
    
    return bValid;
}

/* ************************************************************************** */
/// TODO: BASIC driver methods to manage SMB communication
/* ************************************************************************** */

/// @brief Evaluate the pec of a message buffer
/// @param data message buffer
/// @param length length of the message buffer
/// @return pec of message buffer
uint8_t MLX90614_SMBpec(uint8_t* data, size_t length)
{
    uint8_t pec = 0;

    for (int i = 0; i < length; i++) {

        pec ^= data[i];

        for (int j = 8; j; --j) {
            if (pec & 0x80)
                pec = (((uint16_t)pec) << 1U) ^ SMB_PEC_POLYNOMIAL;
            else
                pec <<= 1;
        }
    }

    return pec;
}

/// @brief Send command
/// @param command to write
/// @return execution state of the action
bool MLX90614_SMBcommand (uint8_t command) {

    // Initialize the buffer for writing process
    uint8_t buffer[3] = {
        ((uint8_t) mlx90614_config.slave_address) << 1U,
        command,
        0       
    };

    uint8_t *pec = &buffer[2];    

    // Evaluate the pec verification code
    *pec = MLX90614_SMBpec(buffer, 2);

    // Write data
    if (!SMB_write(&buffer[1], 2))
        LOG_print_error(MLX90614_LOG, "command operation failed");
    
    LOG_print_debug(MLX90614_LOG, "command operation SA=%d, CMD=%d", 
        mlx90614_config.slave_address, buffer[1]);
    
    return true;
}

/// @brief Write a value of to register
/// @param command module (EEPROM or RAM) and address of register to write
/// @param value value write to register
/// @return execution state of the action
bool MLX90614_SMBwrite (uint8_t command, uint16_t value) {

    // Initialize the buffer for writing process
    uint8_t buffer[5] = {
        ((uint8_t) mlx90614_config.slave_address) << 1U,
        command,
        0,
        0,
        0        
    };

    uint8_t *lsb = &buffer[2];
    uint8_t *msb = &buffer[3];
    uint8_t *pec = &buffer[4];    

    // Set value inside buffer
    *lsb = (uint8_t)((value & 0x00FF) >> 0U);
    *msb = (uint8_t)((value & 0xFF00) >> 8U);

    // Evaluate the pec verification code
    *pec = MLX90614_SMBpec(buffer, 4);

    // Write data
    if (!SMB_write(&buffer[1], 4))
        LOG_print_error(MLX90614_LOG, "write operation failed");
    
    LOG_print_debug(MLX90614_LOG, "SMB write SA=%d, CMD=%d, LSB=%d, MSB=%d, PEC=%d", 
            mlx90614_config.slave_address, buffer[1], buffer[2], buffer[3], buffer[4]);
    
    return true;
}

/// @brief Read the value of a register
/// @param command module (EEPROM or RAM) and address of register to read
/// @param value value read from register
/// @return execution state of the action
bool MLX90614_SMBread (uint8_t command, uint16_t* value) 
{

    // Initialize the buffer for reading process
    uint8_t buffer[6] = {
        ((uint8_t) mlx90614_config.slave_address) << 1U,
        command,
        (((uint8_t) mlx90614_config.slave_address) << 1U) + 1U,
        0,
        0,
        0        
    };

    if (SMB_read(&buffer[1], 1, &buffer[3], 3)) {

        uint8_t *lsb = &buffer[3];
        uint8_t *msb = &buffer[4];
        uint8_t *pec = &buffer[5];

        // Set value
        *value = (((uint16_t)*msb) << 8U) | (((uint16_t)*lsb));

        // Check pec
        if (MLX90614_SMBpec(buffer, 5) == *pec) {
            LOG_print_debug(MLX90614_LOG, "SMB read SA=%d, CMD=%d, LSB=%d, MSB=%d, PEC=%d", 
                mlx90614_config.slave_address, buffer[1], buffer[3], buffer[4], buffer[5]); 
            return true;
        }            
        
        LOG_print_error(MLX90614_LOG, "read operation failed [PEC]");
    }    

    LOG_print_error(MLX90614_LOG, "read operation failed");
    return false;
}

/// @brief Write a value of to register
/// @param reg_addr address of register to write
/// @param value value write to register
/// @return execution state of the action
bool MLX90614_SMBwrite_EEPROM (uint8_t reg_addr, uint16_t value)
{

    uint8_t command = (reg_addr & SMB_CMD_REG_MASK) | SMB_CMD_EEPROM_ACCESS;

    return MLX90614_SMBwrite(command, value);
}

/// @brief Read the value of a register on the EEPROM
/// @param register address of register to read
/// @param value value read from register
/// @return execution state of the action
bool MLX90614_SMBread_EEPROM (uint8_t reg_addr, uint16_t* value)
{

    uint8_t command = (reg_addr & SMB_CMD_REG_MASK) | SMB_CMD_EEPROM_ACCESS;

    return MLX90614_SMBread(command, value);
}

/// @brief Read the value of a register on the RAM
/// @param register address of register to read
/// @param value value read from register
/// @return execution state of the action
bool MLX90614_SMBread_RAM (uint8_t reg_addr, uint16_t* value)
{

    uint8_t command = (reg_addr & SMB_CMD_REG_MASK) | SMB_CMD_RAM_ACCESS;

    return MLX90614_SMBread(command, value);
}

/// @brief Read the RAM
/// @return execution state of the action
bool MLX90614_SMBdumpRAM (void) {

    for (int i = 0; i < 32; i++)
        if (!MLX90614_SMBread_RAM (i, &mlx90614_ram_table.value[i])) {
            mlx90614_ram_table.value[i] = EMPTY_VALUE;      
            return false;
        }

    return true;
}

/// @brief Read the EEPROM
/// @return execution state of the action
bool MLX90614_SMBdumpEE (void) {

    for (int i = 0; i < 32; i++)
        if (!MLX90614_SMBread_EEPROM (i, &mlx90614_eeprom_table.value[i])) {
            mlx90614_eeprom_table.value[i] = EMPTY_VALUE;      
            return false;
        }

    return true;
}

/* ************************************************************************** */
/// TODO: Basic driver methods to manage configuration (SMB mode)
/* ************************************************************************** */

/// @brief Write the configuration register using mask and shift value
/// @param mask length of the write operation
/// @param shift bit position for write
/// @param value value to write
/// @return execution state of the action
bool MLX90614_SMB_Set_ConfigRegister (uint16_t mask, int shift, uint16_t value) {
        
    uint16_t data = mlx90614_eeprom_table.config_register & mask;
    data = data | (value << shift);

    // Erase the cell
    if (!MLX90614_SMBwrite_EEPROM(SMB_EEPROM_CFG_REG_ADDR, 0x0000))
        return false;

    // Write the cell
    if (!MLX90614_SMBwrite_EEPROM(SMB_EEPROM_CFG_REG_ADDR, data))
        return false;

    // Read back value
    if (!MLX90614_SMBread_EEPROM (SMB_EEPROM_CFG_REG_ADDR, &mlx90614_eeprom_table.config_register)) {
        mlx90614_eeprom_table.config_register = EMPTY_VALUE;  
        return false;
    }
    
    // check if value has been written correctly
    if (mlx90614_eeprom_table.config_register != data){
        mlx90614_eeprom_table.config_register = EMPTY_VALUE;  
        LOG_print_error(MLX90614_LOG, "set config_register with value %d failed", value);
        return false;
    }

    return true;
}

/// @brief Write the configuration register using mask and shift value https://github.com/mistak1992/MLX90614_driver_for_esp_idf/tree/master
/// @param mask length of the write operation
/// @param shift bit position for write
/// @param value value to write
/// @return execution state of the action
bool MLX90614_SMB_Set_Emissivity (float value) {
    
    // Convert value to uint format
    uint16_t emissivity = (uint16_t) (65535 * value + 0.5);
    // Get reserved value as backup
    uint16_t reserved_backup = mlx90614_eeprom_table.melexis_reserved_2[0];
    
    // Send command 0x60 
    if (!MLX90614_SMBcommand(0x60))
        return false;
    
    // Erase the emissivity cell
    if (!MLX90614_SMBwrite_EEPROM(SMB_EEPROM_EMISSIVITY_REG_ADDR, 0x0000))
        return false;

    // Write the emissivity cell
    if (!MLX90614_SMBwrite_EEPROM(SMB_EEPROM_EMISSIVITY_REG_ADDR, emissivity))
        return false;
    
    // Erase the reserved cell 0x0F
    if (!MLX90614_SMBwrite_EEPROM(0x0F, 0x0000))
        return false;

    // Restore the reserved cell 0x0F
    if (!MLX90614_SMBwrite_EEPROM(0x0F, reserved_backup))
        return false;
    
    // Send command 0x61 
    if (!MLX90614_SMBcommand(0x61))
        return false;

    // Read back value
    if (!MLX90614_SMBread_EEPROM (SMB_EEPROM_EMISSIVITY_REG_ADDR, &mlx90614_eeprom_table.emissivity)) {
        mlx90614_eeprom_table.emissivity = EMPTY_VALUE;  
        return false;
    }
    
    // Read back value
    if (!MLX90614_SMBread_EEPROM (0x0F, &mlx90614_eeprom_table.melexis_reserved_2[0])) {
        mlx90614_eeprom_table.emissivity = EMPTY_VALUE;  
        return false;
    }

    // check if value has been written correctly
    if (mlx90614_eeprom_table.emissivity != emissivity || mlx90614_eeprom_table.melexis_reserved_2[0] != reserved_backup){
        mlx90614_eeprom_table.emissivity = EMPTY_VALUE;  
        LOG_print_error(MLX90614_LOG, "set emissivity with value %d failed", emissivity);
        return false;
    }    

    LOG_print_info(MLX90614_LOG, "set emissivity with value %d", emissivity);
    return true;
}

/// @brief Set the FIR value for the MLX90614 sensor via SMBus.
/// @param value The FIR value to set.
/// @return True if the operation was successful, false otherwise.
bool MLX90614_SMB_Set_FIR (uint16_t value)
{
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x0700) >> 8;

    // Compare old configuration with new configuration
    if (old_value != value)
        if (MLX90614_SMB_Set_ConfigRegister(0xF8FF, 8, value))
            LOG_print_info(MLX90614_LOG, "set fir with value %d", value);
        else
            return false;
    
    return true;
}

/// @brief Set the IIR value for the MLX90614 sensor via SMBus.
/// @param value The IIR value to set.
/// @return True if the operation was successful, false otherwise.
bool MLX90614_SMB_Set_IIR (uint16_t value)
{
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x0007) >> 0;
    
    // Compare old configuration with new configuration
    if (old_value != value)
        if (MLX90614_SMB_Set_ConfigRegister(0xFFF8, 0, value))
            LOG_print_info(MLX90614_LOG, "set iir with value %d", value);
        else
            return false;

    return true;
}

/// @brief Set the operating mode of the IR (Infrared) sensor for the MLX90614 sensor via SMBus.
/// @param value The mode value to set.
/// @return True if the operation was successful, false otherwise.
bool MLX90614_SMB_Set_IR_Sensor (uint16_t value)
{
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x0040) >> 6;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_ConfigRegister(0xFFBF, 6, value))
            LOG_print_info(MLX90614_LOG, "set ir_sensor with value %d", value);
        else
            return false;
  
    return true;
}

/* ************************************************************************** */
/// TODO: SMB API driver methods
/* ************************************************************************** */

/// @brief Begin operation of MLX90614 driver with SMBus
/// @return execution state of the action
uint8_t MLX90614_SMBBegin (mlx90614_config_t* config)
{
    bool bValid = true;
    
    // Initialize Driver and power for sensor
    MLX90614_init(config);    

    // Synchronize MLX90614 module with sensor module (dump RAM and EEPROM memory)
    if (!MLX90614_SMBdumpEE())
        return MLX90614_ERROR_EPPROM_READ;
    if (!MLX90614_SMBdumpRAM())
        return MLX90614_ERROR_RAM_READ;

    // Set configuration
    if (bValid) bValid = MLX90614_SMB_Set_FIR(mlx90614_config.fir_setting);
    if (bValid) bValid = MLX90614_SMB_Set_IIR(mlx90614_config.iir_setting);
    if (bValid) bValid = MLX90614_SMB_Set_IR_Sensor(mlx90614_config.ir_sensor_setting);
    if (bValid) bValid = MLX90614_SMB_Set_Emissivity(mlx90614_config.emissivity);
    
    if (!bValid)
        return MLX90614_ERROR_EEPROM_WRITE;

    // Restart module
    MLX90614_powerdown();
    MLX90614_powerup();
    
    LOG_print_info(MLX90614_LOG, "begin with SMB communication");
    return MLX90614_ERROR_NONE;
}

/// @brief Get the ambient temperature (Ta) from the MLX90614 sensor via SMBus.
/// @param ta Pointer to store the ambient temperature value.
/// @return True if the operation was successful, false otherwise.
uint8_t MLX90614_SMBGetTa(float *ta)
{
    // Read the RAM register for ambient temperature
    if (!MLX90614_SMBread_RAM (SMB_RAM_TA_REG_ADDR, &mlx90614_ram_table.t_a)) {
        mlx90614_ram_table.t_a = EMPTY_VALUE;      
        return MLX90614_ERROR_RAM_READ;
    }

    // Check that sign bit is positive (negative temperature not are possible)
    if (mlx90614_ram_table.t_a > 0x7FFF)
        return MLX90614_ERROR_TEMPERATURE_INVALID;

    // Conversion in Celsius
    *ta = (float)mlx90614_ram_table.t_a * 0.02f - 273.15;
    LOG_print_info(MLX90614_LOG, "ambient temperature %f", *ta);
        
    return MLX90614_ERROR_NONE;
}  

/// @brief Get the object temperature (Tobj1) from the MLX90614 sensor via SMBus.
/// @param tobj Pointer to store the object temperature value.
/// @return True if the operation was successful, false otherwise.
uint8_t MLX90614_SMBGetT0bj1(float *tobj)
{
    // Read the RAM register for ambient temperature
    if (!MLX90614_SMBread_RAM (SMB_RAM_TOBJ1_REG_ADDR, &mlx90614_ram_table.t_obj1)) {
        mlx90614_ram_table.t_obj1 = EMPTY_VALUE;      
        return MLX90614_ERROR_RAM_READ;
    }

    // Check that sign bit is positive (negative temperature not are possible)
    if (mlx90614_ram_table.t_obj1 > 0x7FFF)
        return MLX90614_ERROR_TEMPERATURE_INVALID;

    // Conversion in Celsius
    *tobj = (float)mlx90614_ram_table.t_obj1 * 0.02f - 273.15;
    LOG_print_info(MLX90614_LOG, "object 1 temperature %f", *tobj);
        
    return MLX90614_ERROR_NONE;
} 

/// @brief Get the object temperature (Tobj2) from the MLX90614 sensor via SMBus.
/// @param tobj Pointer to store the object temperature value.
/// @return True if the operation was successful, false otherwise.
uint8_t MLX90614_SMBGetT0bj2(float *tobj)
{
    // Read the RAM register for ambient temperature
    if (!MLX90614_SMBread_RAM (SMB_RAM_TOBJ2_REG_ADDR, &mlx90614_ram_table.t_obj2)) {
        mlx90614_ram_table.t_obj2 = EMPTY_VALUE;      
        return MLX90614_ERROR_RAM_READ;
    }

    // Check that sign bit is positive (negative temperature not are possible)
    if (mlx90614_ram_table.t_obj2 > 0x7FFF)
        return MLX90614_ERROR_TEMPERATURE_INVALID;

    // Conversion in Celsius
    *tobj = (float)mlx90614_ram_table.t_obj2 * 0.02f - 273.15;
    LOG_print_info(MLX90614_LOG, "object 2 temperature %f", *tobj);
        
    return MLX90614_ERROR_NONE;
} 

/// @brief Get the infrared data (IRch1) from the MLX90614 sensor via SMBus.
/// @param ir_data Pointer to store the infrared data value.
/// @return True if the operation was successful, false otherwise.
uint8_t MLX90614_SMBGetIRch1(uint16_t *ir_data)
{
    // Read the RAM register for ambient temperature
    if (!MLX90614_SMBread_RAM (SMB_RAM_IRCH1_REG_ADDR, &mlx90614_ram_table.ir_ch_1)) {
        mlx90614_ram_table.ir_ch_1 = EMPTY_VALUE;      
        return MLX90614_ERROR_RAM_READ;
    }

    // Transfer value
    *ir_data = mlx90614_ram_table.ir_ch_1;
    LOG_print_info(MLX90614_LOG, "ir channel 1 temperature %d", *ir_data);
        
    return MLX90614_ERROR_NONE;
} 

/// @brief Get the infrared data (IRch2) from the MLX90614 sensor via SMBus.
/// @param ir_data Pointer to store the infrared data value.
/// @return True if the operation was successful, false otherwise.
uint8_t MLX90614_SMBGetIRch2(uint16_t *ir_data)
{
    // Read the RAM register for ambient temperature
    if (!MLX90614_SMBread_RAM (SMB_RAM_IRCH2_REG_ADDR, &mlx90614_ram_table.ir_ch_2)) {
        mlx90614_ram_table.ir_ch_2 = EMPTY_VALUE;      
        return MLX90614_ERROR_RAM_READ;
    }

    // Transfer value
    *ir_data = mlx90614_ram_table.ir_ch_2;
    LOG_print_info(MLX90614_LOG, "ir channel 2 temperature %d", *ir_data);
        
    return MLX90614_ERROR_NONE;
}
