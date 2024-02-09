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
#define EMPTY_VALUE             0xFFFF

// Default configuration values
#define DFT_PWR_PIN             GPIO_PIN_RA7                // Disable power intitialization
#define DFT_TNIT_TIMEOUT_MS     840                         // Initialization timeout (depend on configuration setting time)
#define DFT_SMB_TIMEOUT_MS      27                          // Used for read and write operation (SMB)
#define DFT_SLAVE_ADDRESS       0x5A
#define DFT_IIR_SETTING         MLX90614_IIR_57             // Default setting (IIR = [57%] 7) 
#define DFT_FIR_SETTING         MLX90614_FIR_128            // Default setting (FIR = [128] 4)    
#define DFT_IR_SENSOR_SETTING   MLX90614_IR_SENSOR_SINGLE   // Dual IR sensor
#define DFT_EMISSIVITY          0.90                        // Emissivity  dec2hex[ round( 65535 x ?) ]

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
/// TODO: Table Definition and initialization
/* ************************************************************************** */

/// @brief Define EEPROM table.
typedef union {

    struct {
        uint16_t to_max; 					// customer dependent object temperatures range max value
        uint16_t to_min; 					// customer dependent object temperatures range min value
        uint16_t pwmctrl; 					// Control bits for configuring the PWM/SDA pin
        uint16_t ta_range; 					// customer dependent ambient temperatures range
        uint16_t emissivity; 				// Object emissivity (factory default 1.0 = 0xFFFF)
        uint16_t config_register; 			// ConfigRegister1 consists of control bits for configuring the analog and digital parts
        uint16_t melexis_reserved_1[8];
        uint16_t smb_address; 				// Slave address of sensor module (SMBus)
        uint16_t melexis_reserved_2[13];
        uint16_t id_number[4];				// id number
    };
    uint16_t value[32];
} mlx90614_eeprom_table_t;

/// @brief Define RAM table.
typedef union {

    struct {
        uint16_t melexis_reserved_1[4];
        uint16_t ir_ch_1; 					// Infra-red measure channel 1
        uint16_t ir_ch_2; 					// Infra-red measure channel 2
        uint16_t t_a; 						// Ambient temperature
        uint16_t t_obj1; 					// Object temperature channel 1
        uint16_t t_obj2; 					// Object temperature channel 2
        uint16_t melexis_reserved_2[23];
    };
    uint16_t value[32];
} mlx90614_ram_table_t;

// Initialization of EEPROM, RAm and configuration
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
bool MLX90614_SMB_Set_Register (uint16_t value, uint8_t address, uint16_t *p_eeprom_table);
bool MLX90614_SMB_Set_ConfigRegister (uint16_t mask, int shift, uint16_t value);
bool MLX90614_SMB_Set_FIR (uint16_t value);
bool MLX90614_SMB_Set_IIR (uint16_t value);
bool MLX90614_SMB_Set_IR_Sensor (uint16_t value);
bool MLX90614_SMB_Set_Repeat_Sensor_test (uint16_t value);
bool MLX90614_SMB_Set_PWM_channel_selection (uint16_t value);
bool MLX90614_SMB_Set_Ks_sign (uint16_t value);
bool MLX90614_SMB_Set_Gain (uint16_t value);
bool MLX90614_SMB_Set_Kt2_sign (uint16_t value);
bool MLX90614_SMB_Set_Enable_sensor_test (uint16_t value);
bool MLX90614_SMB_Set_Emissivity (float value);
bool MLX90614_SMB_Set_Slave_Address (uint16_t value);
bool MLX90614_SMB_Set_TO_max (uint16_t value);
bool MLX90614_SMB_Set_TO_min (uint16_t value);
bool MLX90614_SMB_Set_TA_max (uint16_t value);
bool MLX90614_SMB_Set_TA_min (uint16_t value);
bool MLX90614_SMB_Set_PWMConfigRegister (uint16_t mask, int shift, uint16_t value);
bool MLX90614_SMB_Set_PWM_mode (uint16_t value);
bool MLX90614_SMB_Set_PWM_enable (uint16_t value);
bool MLX90614_SMB_Set_SDA_pin_conf (uint16_t value);
bool MLX90614_SMB_Set_ThermalRelay (uint16_t value);
bool MLX90614_SMB_Set_PWMrepetition (uint16_t value);
bool MLX90614_SMB_Set_PWMperiod (uint16_t value);

/* ************************************************************************** */
/// TODO: BASIC driver methods to manage driver power and initialization
/* ************************************************************************** */

/// @brief Power up the driver (only if defined the pwr pin)
void MLX90614_powerup (void) {

    // Check if power module is configured
    if (mlx90614_config.pwr_pin != 0xFF) {
        // Set power to high level
        LOG_print_debug(MLX90614_LOG, "power up");
        GPIO_PinWrite(mlx90614_config.pwr_pin, POWER_UP);
    }

    // Wait setting time to be on safe side
    vTaskDelay(mlx90614_config.init_timeout_ms / portTICK_PERIOD_MS);
}

/// @brief Power down the driver (only if defined the pwr pin)
void MLX90614_powerdown (void) {

    // Check if power module is configured
    if (mlx90614_config.pwr_pin != 0xFF) {
        // Set power to high level
        LOG_print_debug(MLX90614_LOG, "power down");
        GPIO_PinWrite(mlx90614_config.pwr_pin, POWER_DOWN);
    }

    // Wait setting time to be on safe side
    vTaskDelay(mlx90614_config.init_timeout_ms / portTICK_PERIOD_MS);
}

/// @brief Initialization of the driver
void MLX90614_init (mlx90614_config_t* config) {
	
    // Initialize configuration ...
    if (config == NULL)
        MLX90614_dft_config();
    else
        MLX90614_config(config);

    // Initialize EEPROM memory table with default empty value
    for (int i = 0; i < 32; i++)
        mlx90614_eeprom_table.value[i] = EMPTY_VALUE;

    // Initialize RAM memory table with default empty value
    for (int i = 0; i < 32; i++)
        mlx90614_ram_table.value[i] = EMPTY_VALUE;  

    // Power Up
    MLX90614_powerup();
    LOG_print_info(MLX90614_LOG, "init driver");
}

/// @brief Load the default configuration
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
void MLX90614_config (mlx90614_config_t *config) {

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

/// @brief Read register
bool SMB_read (uint8_t *wdata, uint8_t wlength, uint8_t *rdata, uint8_t rlength) {
	
    // Send the I2C command to read the register
    bool bValid = I2C_SMBWriteRead((uint16_t) mlx90614_config.slave_address, wdata, wlength, rdata, rlength);
    
    // Wait ...   
    vTaskDelay(mlx90614_config.read_timeout_ms / portTICK_PERIOD_MS);

    return bValid;
}

/// @brief Write register
bool SMB_write (uint8_t *wdata, uint8_t wlength) {
	
    // Send the I2C command to write the register
    bool bValid = I2C_SMBWrite((uint16_t) mlx90614_config.slave_address, wdata, wlength); 
    
    // Wait ...   
    vTaskDelay(mlx90614_config.write_timeout_ms / portTICK_PERIOD_MS);
    
    return bValid;
}

/* ************************************************************************** */
/// TODO: BASIC driver methods to manage SMB communication
/* ************************************************************************** */

/// @brief Evaluate the pec of a message buffer
uint8_t MLX90614_SMBpec(uint8_t* data, size_t length) {
    
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

/// @brief Send command to the sensor
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

/// @brief Write a value to a register of the sensor
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

/// @brief Read a value on a register of the sensor
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

/// @brief Write a value to a register of the sensor EEPROM
bool MLX90614_SMBwrite_EEPROM (uint8_t reg_addr, uint16_t value) {
	
    uint8_t command = (reg_addr & SMB_CMD_REG_MASK) | SMB_CMD_EEPROM_ACCESS;
    return MLX90614_SMBwrite(command, value);
}
/// @brief Read a value on a register of the sensor EEPROM
bool MLX90614_SMBread_EEPROM (uint8_t reg_addr, uint16_t* value) {
	
    uint8_t command = (reg_addr & SMB_CMD_REG_MASK) | SMB_CMD_EEPROM_ACCESS;
    return MLX90614_SMBread(command, value);
}

/// @brief Read a value on a register of the sensor RAM
bool MLX90614_SMBread_RAM (uint8_t reg_addr, uint16_t* value) {

    uint8_t command = (reg_addr & SMB_CMD_REG_MASK) | SMB_CMD_RAM_ACCESS;
    return MLX90614_SMBread(command, value);
}

/// @brief Dump the RAM content
bool MLX90614_SMBdumpRAM (void) {

    for (int i = 0; i < 32; i++)
        if (!MLX90614_SMBread_RAM(i, &mlx90614_ram_table.value[i])) {
            mlx90614_ram_table.value[i] = EMPTY_VALUE;      
            return false;
        }

    return true;
}

/// @brief Dump the EEPROM content
bool MLX90614_SMBdumpEE (void) {

    for (int i = 0; i < 32; i++)
        if (!MLX90614_SMBread_EEPROM(i, &mlx90614_eeprom_table.value[i])) {
            mlx90614_eeprom_table.value[i] = EMPTY_VALUE;      
            return false;
        }

    return true;
}

/* ************************************************************************** */
/// TODO: Basic driver methods to manage configuration on the EEPROM (SMB mode)
/* ************************************************************************** */

/// @brief Write the EEPROM register
bool MLX90614_SMB_Set_Register (uint16_t value, uint8_t address, uint16_t *p_eeprom_table) {
        
    // Erase, write, readback, and check the set operation
    if (MLX90614_SMBwrite_EEPROM(address, 0x0000))
		if (MLX90614_SMBwrite_EEPROM(address, value))
			if (MLX90614_SMBread_EEPROM(address, p_eeprom_table))
				if (*p_eeprom_table == value)
					return true;
				else
					LOG_print_error(MLX90614_LOG, "set eeprom register failed, value=%d, addr=%d", value, address);
				
    *p_eeprom_table = EMPTY_VALUE;
    return false;
}

/// @brief Write the EEPROM configuration register using mask and shift value
bool MLX90614_SMB_Set_ConfigRegister (uint16_t mask, int shift, uint16_t value) {
        
    uint16_t data = mlx90614_eeprom_table.config_register & mask;
    data = data | (value << shift);
	
    return MLX90614_SMB_Set_Register(data, SMB_EEPROM_CFG_REG_ADDR, &mlx90614_eeprom_table.config_register);
}

/// @brief Set the FIR value in EEPROM configuration register.
bool MLX90614_SMB_Set_FIR (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x0700) >> 8;
    value = value & 0x07;

    // Compare old configuration with new configuration
    if (old_value != value)
        if (MLX90614_SMB_Set_ConfigRegister(0xF8FF, 8, value))  {
            LOG_print_info(MLX90614_LOG, "set fir with value %d", value);
        } else
            return false;
    
    return true;
}

/// @brief Set the IIR value in EEPROM configuration register.
bool MLX90614_SMB_Set_IIR (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x0007) >> 0;
    value = value & 0x07;
    
    // Compare old configuration with new configuration
    if (old_value != value)
        if (MLX90614_SMB_Set_ConfigRegister(0xFFF8, 0, value)) {
            LOG_print_info(MLX90614_LOG, "set iir with value %d", value);
        } else
            return false;

    return true;
}

/// @brief Set the IR sensor value in EEPROM configuration register.
bool MLX90614_SMB_Set_IR_Sensor (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x0040) >> 6;
    value = value & 0x01;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_ConfigRegister(0xFFBF, 6, value)) {
            LOG_print_info(MLX90614_LOG, "set ir_sensor with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the Repeat sensor test value in EEPROM configuration register.
bool MLX90614_SMB_Set_Repeat_Sensor_test (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x0008) >> 3;
    value = value & 0x01;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_ConfigRegister(0xFFF7, 3, value)) {
            LOG_print_info(MLX90614_LOG, "set repeat_sensor_test with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the PWM channel selection value in EEPROM configuration register.
bool MLX90614_SMB_Set_PWM_channel_selection (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x0030) >> 4;
    value = value & 0x03;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_ConfigRegister(0xFFCF, 4, value)) {
            LOG_print_info(MLX90614_LOG, "set pwm channel selection with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the Ks sign value in EEPROM configuration register.
bool MLX90614_SMB_Set_Ks_sign (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x0080) >> 7;
    value = value & 0x01;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_ConfigRegister(0xFF7F, 7, value)) {
            LOG_print_info(MLX90614_LOG, "set ks sign with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the gain value in EEPROM configuration register.
bool MLX90614_SMB_Set_Gain (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x3800) >> 11;
    value = value & 0x07;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_ConfigRegister(0xC7FF, 11, value)) {
            LOG_print_info(MLX90614_LOG, "set gain with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the Kt2 sign value in EEPROM configuration register.
bool MLX90614_SMB_Set_Kt2_sign (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x4000) >> 14;
    value = value & 0x01;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_ConfigRegister(0xBFFF, 14, value)) {
            LOG_print_info(MLX90614_LOG, "set kt2 sign with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the enable sensor test value in EEPROM configuration register.
bool MLX90614_SMB_Set_Enable_sensor_test (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.config_register & 0x8000) >> 15;
    value = value & 0x01;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_ConfigRegister(0x7FFF, 15, value)) {
            LOG_print_info(MLX90614_LOG, "set the enable sensor test with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Write the EEPROM emissivity register
bool MLX90614_SMB_Set_Emissivity (float value) {
    
    // Check if value is inside the range 0,05 - 1
    if (value > 1)
        value = 1;
    if (value < 0.05)
        value = 0.05;
    
    // Convert value to uint format
    uint16_t emissivity = (uint16_t) (65535 * value + 0.5);
    
    if (mlx90614_eeprom_table.emissivity == emissivity) 
        return true;
    
    if (MLX90614_SMBcommand(0x60))
        if (MLX90614_SMB_Set_Register(emissivity, SMB_EEPROM_EMISSIVITY_REG_ADDR, &mlx90614_eeprom_table.emissivity))
            if (MLX90614_SMB_Set_Register(mlx90614_eeprom_table.melexis_reserved_2[0], 0x0F, &mlx90614_eeprom_table.melexis_reserved_2[0]))
                if (MLX90614_SMBcommand(0x61)) {
                    LOG_print_info(MLX90614_LOG, "set emissivity with value %f", value);
                    return true;
                }
	
    LOG_print_error(MLX90614_LOG, "set emissivity with value %f failed", value);
    return false;
}

/// @brief Write the EEPROM slave address register
bool MLX90614_SMB_Set_Slave_Address (uint16_t value) {
    
    if (mlx90614_eeprom_table.smb_address == value) 
        return true;
    
    if (!MLX90614_SMB_Set_Register(value, SMB_EEPROM_SA_REG_ADDR, &mlx90614_eeprom_table.smb_address)){
        LOG_print_error(MLX90614_LOG, "set slave address with value %d failed", value);
        return false;
    }

    LOG_print_info(MLX90614_LOG, "set slave address with value %d", value);
    return true;
}

/// @brief Write the EEPROM TO max register
bool MLX90614_SMB_Set_TO_max (uint16_t value) {
    
    if (mlx90614_eeprom_table.to_max == value) 
        return true;
	
    if (!MLX90614_SMB_Set_Register(value, SMB_EEPROM_TO_MAX_REG_ADDR, &mlx90614_eeprom_table.to_max)){
        LOG_print_error(MLX90614_LOG, "set to_max with value %d failed", value);
        return false;
    } 

    LOG_print_info(MLX90614_LOG, "set to_max with value %d", value);
    return true;
}

/// @brief Write the EEPROM TO min register
bool MLX90614_SMB_Set_TO_min (uint16_t value) {
    
    if (mlx90614_eeprom_table.to_min == value) 
        return true;
    
    if (!MLX90614_SMB_Set_Register(value, SMB_EEPROM_TO_MIN_REG_ADDR, &mlx90614_eeprom_table.to_min)){
        LOG_print_error(MLX90614_LOG, "set to_min with value %d failed", value);
        return false;
    } 
    LOG_print_info(MLX90614_LOG, "set to_min with value %d", value);
    return true;
}

/// @brief Write the EEPROM TO max register
bool MLX90614_SMB_Set_TA_max (uint16_t value) {
	
    value = value & 0x00FF;
	uint16_t data = mlx90614_eeprom_table.ta_range & 0x00FF;
    data = data | ((value & 0x00FF) << 8);
    
    if (mlx90614_eeprom_table.ta_range == data) 
        return true;
	
    if (!MLX90614_SMB_Set_Register(data, SMB_EEPROM_TA_RANGE_REG_ADDR, &mlx90614_eeprom_table.ta_range)){
        LOG_print_error(MLX90614_LOG, "set ta_max with value %d failed", value);
        return false;
    } 

    LOG_print_info(MLX90614_LOG, "set ta_max with value %d", value);
    return true;
}

/// @brief Write the EEPROM TO min register
bool MLX90614_SMB_Set_TA_min (uint16_t value) {
    
    value = value & 0x00FF;
	uint16_t data = mlx90614_eeprom_table.ta_range & 0xFF00;
    data = data | ((value & 0x00FF) << 0);
    
    if (mlx90614_eeprom_table.ta_range == data) 
        return true;
	
    if (!MLX90614_SMB_Set_Register(data, SMB_EEPROM_TA_RANGE_REG_ADDR, &mlx90614_eeprom_table.ta_range)){
        LOG_print_error(MLX90614_LOG, "set ta_min with value %d failed", value);
        return false;
    } 

    LOG_print_info(MLX90614_LOG, "set ta_min with value %d", value);
    return true;
}

/// @brief Write the EEPROM pwm configuration register using mask and shift value
bool MLX90614_SMB_Set_PWMConfigRegister (uint16_t mask, int shift, uint16_t value) {
        
    uint16_t data = mlx90614_eeprom_table.pwmctrl & mask;
    data = data | ((value & (~mask & 0xFFFF)) << shift);
	
    return MLX90614_SMB_Set_Register(data, SMB_EEPROM_PWMCTRL_REG_ADDR, &mlx90614_eeprom_table.pwmctrl);
}

/// @brief Set PWM mode value in EEPROM PWM configuration register.
bool MLX90614_SMB_Set_PWM_mode (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.pwmctrl & 0x0001) >> 0;
    value = value & 0x0001;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_PWMConfigRegister(0xFFFE, 0, value)) {
            LOG_print_info(MLX90614_LOG, "set the pwm mode with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the enable PWM value in EEPROM PWM configuration register.
bool MLX90614_SMB_Set_PWM_enable (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.pwmctrl & 0x0002) >> 1;
    value = value & 0x0001;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_PWMConfigRegister(0xFFFD, 1, value)) {
            LOG_print_info(MLX90614_LOG, "set the pwm enable with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set SDA pin configuration in EEPROM PWM configuration register.
bool MLX90614_SMB_Set_SDA_pin_conf (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.pwmctrl & 0x0004) >> 2;
    value = value & 0x0001;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_PWMConfigRegister(0xFFFB, 2, value)) {
            LOG_print_info(MLX90614_LOG, "set the sda pin configuration with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set Thermal Relay in EEPROM PWM configuration register.
bool MLX90614_SMB_Set_ThermalRelay (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.pwmctrl & 0x0008) >> 3;
    value = value & 0x0001;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_PWMConfigRegister(0xFFF7, 3, value)) {
            LOG_print_info(MLX90614_LOG, "set the thermal relay with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set PWM repetition in EEPROM PWM configuration register.
bool MLX90614_SMB_Set_PWMrepetition (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.pwmctrl & 0x01F0) >> 4;
    value = value & 0x001F;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_PWMConfigRegister(0xFE0F, 4, value)) {
            LOG_print_info(MLX90614_LOG, "set the pwm repetition with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set PWM period in EEPROM PWM configuration register.
bool MLX90614_SMB_Set_PWMperiod (uint16_t value) {
	
    uint16_t old_value = (mlx90614_eeprom_table.pwmctrl & 0xFE00) >> 9;
    value = value & 0x007F;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_SMB_Set_PWMConfigRegister(0x0100, 9, value)) {
            LOG_print_info(MLX90614_LOG, "set the pwm period with value %d", value);
        } else
            return false;
  
    return true;
}

/* ************************************************************************** */
/// TODO: SMB API driver methods
/* ************************************************************************** */

/// @brief Start driver operation with SMBus
/// @return error code
uint8_t MLX90614_SMBStart (mlx90614_config_t* config) {
	
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
    
    LOG_print_info(MLX90614_LOG, "start driver with SMB communication");
    return MLX90614_ERROR_NONE;
}

/// @brief Start driver operation
void MLX90614_Stop (void) {
	
    // Stop module
    MLX90614_powerdown();    
    LOG_print_info(MLX90614_LOG, "stop driver");
}

/// @brief Get the ambient temperature (Ta) from the sensor via SMBus.
/// @return error code
uint8_t MLX90614_SMBGetTa (float *ta) {
	
    // Read the RAM register for ambient temperature
    if (!MLX90614_SMBread_RAM(SMB_RAM_TA_REG_ADDR, &mlx90614_ram_table.t_a)) {
        mlx90614_ram_table.t_a = EMPTY_VALUE;      
        return MLX90614_ERROR_RAM_READ;
    }

    // Check that sign bit is positive (negative temperature not are possible)
    if (mlx90614_ram_table.t_a > 0x7FFF | mlx90614_ram_table.t_a  < 0x27AD)
        return MLX90614_ERROR_TEMPERATURE_INVALID;

    // Conversion in Celsius
    *ta = (float)mlx90614_ram_table.t_a * 0.02f - 273.15;
    LOG_print_info(MLX90614_LOG, "ambient temperature %f", *ta);
        
    return MLX90614_ERROR_NONE;
}  

/// @brief Get the object temperature (Tobj1) from the sensor via SMBus.
/// @return error code
uint8_t MLX90614_SMBGetT0bj1(float *tobj) {
	
    // Read the RAM register for ambient temperature
    if (!MLX90614_SMBread_RAM(SMB_RAM_TOBJ1_REG_ADDR, &mlx90614_ram_table.t_obj1)) {
        mlx90614_ram_table.t_obj1 = EMPTY_VALUE;      
        return MLX90614_ERROR_RAM_READ;
    }

    // Check that sign bit is positive (negative temperature not are possible)
    if (mlx90614_ram_table.t_obj1 > 0x7FFF | mlx90614_ram_table.t_obj1  < 0x27AD)
        return MLX90614_ERROR_TEMPERATURE_INVALID;

    // Conversion in Celsius
    *tobj = (float)mlx90614_ram_table.t_obj1 * 0.02f - 273.15;
    LOG_print_info(MLX90614_LOG, "object 1 temperature %f", *tobj);
        
    return MLX90614_ERROR_NONE;
} 

/// @brief Get the object temperature (Tobj2) from the sensor via SMBus.
/// @return error code
uint8_t MLX90614_SMBGetT0bj2 (float *tobj) {
	
    // Check if are working in single sensor mode
    if (((mlx90614_eeprom_table.config_register & 0x0040) >> 6) == 0) {
        *tobj = 0;
        return MLX90614_ERROR_NONE;
    }
    
    // Read the RAM register for ambient temperature
    if (!MLX90614_SMBread_RAM(SMB_RAM_TOBJ2_REG_ADDR, &mlx90614_ram_table.t_obj2)) {
        mlx90614_ram_table.t_obj2 = EMPTY_VALUE;      
        return MLX90614_ERROR_RAM_READ;
    }

    // Check that sign bit is positive (negative temperature not are possible)
    if (mlx90614_ram_table.t_obj2 > 0x7FFF | mlx90614_ram_table.t_obj2  < 0x27AD)
        return MLX90614_ERROR_TEMPERATURE_INVALID;

    // Conversion in Celsius
    *tobj = (float)mlx90614_ram_table.t_obj2 * 0.02f - 273.15;
    LOG_print_info(MLX90614_LOG, "object 2 temperature %f", *tobj);
        
    return MLX90614_ERROR_NONE;
} 

/// @brief Get the infrared data (IRch1) from the sensor via SMBus.
/// @return error code
uint8_t MLX90614_SMBGetIRch1 (uint16_t *ir_data) {
	
    // Read the RAM register for ambient temperature
    if (!MLX90614_SMBread_RAM(SMB_RAM_IRCH1_REG_ADDR, &mlx90614_ram_table.ir_ch_1)) {
        mlx90614_ram_table.ir_ch_1 = EMPTY_VALUE;      
        return MLX90614_ERROR_RAM_READ;
    }

    // Transfer value
    *ir_data = mlx90614_ram_table.ir_ch_1;
    LOG_print_info(MLX90614_LOG, "ir channel 1 temperature %d", *ir_data);
        
    return MLX90614_ERROR_NONE;
} 

/// @brief Get the infrared data (IRch2) from the sensor via SMBus.
/// @return error code
uint8_t MLX90614_SMBGetIRch2 (uint16_t *ir_data) {
    
    // Check if are working in single sensor mode
    if (((mlx90614_eeprom_table.config_register & 0x0040) >> 6) == 0) {
        *ir_data = 0;
        return MLX90614_ERROR_NONE;
    }
	
    // Read the RAM register for ambient temperature
    if (!MLX90614_SMBread_RAM(SMB_RAM_IRCH2_REG_ADDR, &mlx90614_ram_table.ir_ch_2)) {
        mlx90614_ram_table.ir_ch_2 = EMPTY_VALUE;      
        return MLX90614_ERROR_RAM_READ;
    }

    // Transfer value
    *ir_data = mlx90614_ram_table.ir_ch_2;
    LOG_print_info(MLX90614_LOG, "ir channel 2 temperature %d", *ir_data);
        
    return MLX90614_ERROR_NONE;
}

/// @brief Get ID number of the sensor via SMBus.
uint64_t MLX90614_SMBGetID (void) {
	
	uint64_t value = 0;
	for (int i = 0; i < 4; i++)
		value |= (uint64_t)(mlx90614_eeprom_table.id_number[i]) << (i * 8);
        
    return value;
}

