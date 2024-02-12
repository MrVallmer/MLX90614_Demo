/* ************************************************************************** */
/** Driver for MLX90614 temperature sensor

  @Company
    Gatewers

  @File Name
    MLX90632_DRV.c

  @Description
    See header file.
 */
/* ************************************************************************** */

#include "MLX90614_DRV.h"

/* ************************************************************************** */
/// TODO: General Definitions and default value
/* ************************************************************************** */

// General Definitions
#define POWER_DOWN              0
#define POWER_UP                1
#define EMPTY_VALUE             0xFFFF

// Default configuration values
#define DFT_PWR_PIN                 GPIO_PIN_RA7                            // Disable power intitialization
#define DFT_TNIT_TIMEOUT_MS         840                                     // Initialization timeout (depend on configuration setting time)
#define DFT_SMB_TIMEOUT_MS          27                                      // Used for read and write operation (SMB)
#define DFT_SLAVE_ADDRESS           0x5A
#define DFT_IIR_SETTING             MLX90614_DRV_IIR_57                     // Default setting (IIR = [57%] 7) 
#define DFT_FIR_SETTING             MLX90614_DRV_FIR_128                    // Default setting (FIR = [128] 4)    
#define DFT_IR_SENSOR_SETTING       MLX90614_DRV_IR_SENSOR_SINGLE           // Dual IR sensor
#define DFT_EMISSIVITY              0.90                                    // Emissivity  dec2hex[ round( 65535 x ?) ]
#define DFT_REPEAT_SENSOR_TEST      false                                   // Melexis reserved (change factory calibration))
#define DFT_T_CHANNEL               MLX90614_DRV_TA_TOBJ1                   // Set on PWM channels what temperature are available
#define DFT_KS_SIGN                 false                                   // Melexis reserved (change factory calibration)
#define DFT_GAIN                    MLX90614_DRV_GAIN_200                   // Melexis reserved (change factory calibration)
#define DFT_KT2_SIGN                false                                   // Melexis reserved (change factory calibration)
#define DFT_SENSOR_TEST             false                                   // Disable sensor test
#define DFT_PWM_MODE                MLX90614_DRV_PWM_MODE_SINGLE            // PWM in single mode
#define DFT_EN_PWM                  false                                   // Disable PWM
#define DFT_PPODB                   MLX90614_DRV_PPODB_OPEN_DRAIN           // SDA pin configuration (Open Drain or Push Pull)
#define DFT_TRPWMB                  MLX90614_DRV_TRPWMB_PWM_MODE_SELECTED   // Thermal relay selection (can be selected only if PWM is enable)
#define DFT_PWM_REPETITION          1                                       // Number of repetition for a data in pwm mode
#define DFT_PWM_PERIOD              1                                       // Setting for a repetition period
#define DFT_TO_MAX                  100                                     // Max T object range 100° = ((T + 273,15) * 100)
#define DFT_TO_MIN                  0                                       // Min T object range 0° = ((T + 273,15) * 100)
#define DFT_TA_MAX                  100                                     // Mac T ambient range 100° = ((T + 38,2) / 100)
#define DFT_TA_MIN                  0                                       // Min T ambinet range 100° = ((T + 38,2) / 100)

/* ************************************************************************** */
/// TODO: SMB mode Definitions
/* ************************************************************************** */

#define SMB_PEC_POLYNOMIAL                 0x0107            // Polynomial for pec verification
#define SMB_CMD_RAM_ACCESS                 0x00              // SMB command for RAM access
#define SMB_CMD_EEPROM_ACCESS              0x20              // SMB command for EEPROM access
#define SMB_CMD_REG_MASK                   0x1F              // SMB mask for register to use for RAM, EEPROM command access
#define SMB_CMD_FLAG_READ                  0xF1              // SMB command to read FLAG
#define SMB_CMD_ENTER_SLEEP                0xFF              // SMB command to enter in sleep mode

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
#define SMB_EEPROM_CONFIG_REGISTER_1_ADDR            0x05
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
        uint16_t config_register_1; 			// ConfigRegister1 consists of control bits for configuring the analog and digital parts
        uint16_t melexis_reserved_1[8];
        uint16_t smb_address; 				// Slave address of sensor module (SMBus)
        uint16_t melexis_reserved_2[13];
        uint16_t id_number[4];				// id number
    };
    uint16_t value[32];
} eeprom_table_t;

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
} ram_table_t;

// Initialization of EEPROM, RAm and configuration
eeprom_table_t eeprom_table;
ram_table_t ram_table;
mlx90614_drv_config_t config;

/* ************************************************************************** */
/// TODO: Local Methods
/* ************************************************************************** */

void    MLX90614_DRV_powerup (void);
void    MLX90614_DRV_powerdown (void);
void    MLX90614_DRV_init (mlx90614_drv_config_t *config);
void    MLX90614_DRV_dft_config (void);
void    MLX90614_DRV_config(mlx90614_drv_config_t *config);
uint8_t MLX90614_DRV_SMB_pec(uint8_t* data, size_t length);
bool    MLX90614_DRV_SMB_command (uint8_t command);
bool    MLX90614_DRV_SMB_read (uint8_t command, uint16_t* value);
bool    MLX90614_DRV_SMB_write (uint8_t command, uint16_t value);
bool    MLX90614_DRV_SMB_read_EEPROM (uint8_t reg_addr, uint16_t* value);
bool    MLX90614_DRV_SMB_read_RAM (uint8_t reg_addr, uint16_t* value);
bool    MLX90614_DRV_SMB_write_EEPROM (uint8_t reg_addr, uint16_t value);
bool    MLX90614_DRV_SMB_dumpEE (void);
bool    MLX90614_DRV_SMB_dumpRAM (void);
bool    MLX90614_DRV_SMB_Set_Register (uint16_t value, uint8_t address, uint16_t *p_eeprom_table);
bool    MLX90614_DRV_SMB_Set_ConfigRegister1 (uint16_t mask, int shift, uint16_t value);
bool    MLX90614_DRV_SMB_Set_FIR (uint16_t value);
bool    MLX90614_DRV_SMB_Set_IIR (uint16_t value);
bool    MLX90614_DRV_SMB_Set_IRsensor (uint16_t value);
bool    MLX90614_DRV_SMB_Set_RepeatSensorTest (bool value);
bool    MLX90614_DRV_SMB_Set_Tchannel (uint16_t value);
bool    MLX90614_DRV_SMB_Set_KsSign (uint16_t value);
bool    MLX90614_DRV_SMB_Set_Gain (uint16_t value);
bool    MLX90614_DRV_SMB_Set_Kt2Sign (bool value);
bool    MLX90614_DRV_SMB_Set_SensorTest (bool value);
bool    MLX90614_DRV_SMB_Set_Emissivity (float value);
bool    MLX90614_DRV_SMB_Set_SlaveAddress (uint16_t value);
bool    MLX90614_DRV_SMB_Set_TOmax (float value);
bool    MLX90614_DRV_SMB_Set_TOmin (float value);
bool    MLX90614_DRV_SMB_Set_TAmax (float value);
bool    MLX90614_DRV_SMB_Set_TAmin (float value);
bool    MLX90614_DRV_SMB_Set_PWMCTRL (uint16_t mask, int shift, uint16_t value);
bool    MLX90614_DRV_SMB_Set_PWM_mode (uint16_t value);
bool    MLX90614_DRV_SMB_Set_EN_PWM (bool value);
bool    MLX90614_DRV_SMB_Set_PPODB (uint16_t value);
bool    MLX90614_DRV_SMB_Set_TRPWMB (uint16_t value);
bool    MLX90614_DRV_SMB_Set_PWMrepetition (uint16_t value);
bool    MLX90614_DRV_SMB_Set_PWMperiod (uint16_t value);

/* ************************************************************************** */
/// TODO: BASIC driver methods to manage driver power and initialization
/* ************************************************************************** */

/// @brief Power up the driver (only if defined the pwr pin)
void MLX90614_DRV_powerup (void) {

    // Check if power module is configured
    if (config.pwr_pin != 0xFF) {
        // Set power to high level
        LOG_print_debug(MLX90614_DRV_LOG, "power up");
        GPIO_PinWrite(config.pwr_pin, POWER_UP);
    }

    // Wait setting time to be on safe side
    vTaskDelay(config.init_timeout_ms / portTICK_PERIOD_MS);
}

/// @brief Power down the driver (only if defined the pwr pin)
void MLX90614_DRV_powerdown (void) {

    // Check if power module is configured
    if (config.pwr_pin != 0xFF) {
        // Set power to high level
        LOG_print_debug(MLX90614_DRV_LOG, "power down");
        GPIO_PinWrite(config.pwr_pin, POWER_DOWN);
    }

    // Wait setting time to be on safe side
    vTaskDelay(config.init_timeout_ms / portTICK_PERIOD_MS);
}

/// @brief Initialization of the driver
void MLX90614_DRV_init (mlx90614_drv_config_t* config) {
	
    // Initialize configuration ...
    if (config == NULL)
        MLX90614_DRV_dft_config();
    else
        MLX90614_DRV_config(config);

    // Initialize EEPROM memory table with default empty value
    for (int i = 0; i < 32; i++)
        eeprom_table.value[i] = EMPTY_VALUE;

    // Initialize RAM memory table with default empty value
    for (int i = 0; i < 32; i++)
        ram_table.value[i] = EMPTY_VALUE;  

    // Power Up
    LOG_print_info(MLX90614_DRV_LOG, "initialization completed");
}

/// @brief Load the default configuration
void MLX90614_DRV_dft_config (void) {

    LOG_print_debug(MLX90614_DRV_LOG, "load default configuration");
    config.pwr_pin = DFT_PWR_PIN;
    config.init_timeout_ms = DFT_TNIT_TIMEOUT_MS; 
    config.write_timeout_ms = DFT_SMB_TIMEOUT_MS;
    config.read_timeout_ms = DFT_SMB_TIMEOUT_MS;
    config.slave_address = DFT_SLAVE_ADDRESS;
    config.fir_setting = DFT_FIR_SETTING;
    config.iir_setting = DFT_IIR_SETTING;
    config.ir_sensor_setting = DFT_IR_SENSOR_SETTING;
    config.emissivity = DFT_EMISSIVITY;    
    config.repeat_sensor_test = DFT_REPEAT_SENSOR_TEST;   
    config.t_channel = DFT_T_CHANNEL;
    config.ks_sign = DFT_KS_SIGN;
    config.gain = DFT_GAIN;
    config.kt2_sign = DFT_KT2_SIGN;
    config.sensor_test = DFT_SENSOR_TEST;    
    config.pwm_mode = DFT_PWM_MODE;
    config.en_pwm = DFT_EN_PWM;
    config.ppodb = DFT_PPODB;
    config.trpwmb = DFT_TRPWMB;
    config.pwm_repetition = DFT_PWM_REPETITION;
    config.pwm_period = DFT_PWM_MODE;    
    config.to_max = DFT_TO_MAX;
    config.to_min = DFT_TO_MIN;
    config.ta_max = DFT_TA_MAX;
    config.ta_min = DFT_TA_MIN;     
}

/// @brief Load the user configuration.
/// @param config user configuration.
void MLX90614_DRV_config (mlx90614_drv_config_t *_config) {

    LOG_print_debug(MLX90614_DRV_LOG, "load user configuration");
    config.pwr_pin = _config->pwr_pin;
    config.slave_address = _config->slave_address & 0x7F;
    config.read_timeout_ms = _config->read_timeout_ms;
    config.write_timeout_ms = _config->write_timeout_ms;
    config.iir_setting = _config->iir_setting & 0x07;
    config.fir_setting = _config->fir_setting & 0x07;
    config.init_timeout_ms = _config->init_timeout_ms;
    config.ir_sensor_setting = _config->ir_sensor_setting & 0x01;
    config.emissivity = _config->emissivity;    
    config.repeat_sensor_test = _config->repeat_sensor_test;   
    config.t_channel = _config->t_channel & 0x03;
    config.ks_sign = _config->ks_sign;
    config.gain = _config->gain & 0x07;
    config.kt2_sign = _config->kt2_sign;
    config.sensor_test = _config->sensor_test;    
    config.pwm_mode = _config->pwm_mode & 0x01;
    config.en_pwm = _config->en_pwm;
    config.ppodb = _config->ppodb & 0x01;
    config.trpwmb = _config->trpwmb & 0x01;
    config.pwm_repetition = _config->pwm_repetition & 0x1F;
    config.pwm_period = _config->pwm_period & 0x7F;    
    config.to_max = _config->to_max;
    config.to_min = _config->to_min;
    config.ta_max = _config->ta_max;
    config.ta_min = _config->ta_min;  
    
    // Check temperature range
    if (config.ta_max > 125)
        config.ta_max = 125;    
    if (config.ta_max < -38.2)
        config.ta_max = -38.2;
    
    // Check temperature range
    if (config.ta_min > 125)
        config.ta_min = 125;    
    if (config.ta_min < -38.2)
        config.ta_min = -38.2;
    
    // Check temperature range
    if (config.to_max > 382.2)
        config.to_max = 382.2;    
    if (config.to_max < -273.15)
        config.to_max = -273,15;
    
    // Check temperature range
    if (config.to_min > 382.2)
        config.to_min = 382.2;    
    if (config.to_min < -273.15)
        config.to_min = -273,15;    
}

/* ************************************************************************** */
/// TODO: BASIC driver methods to manage SMB communication
/* ************************************************************************** */

/// @brief Evaluate the pec of a message buffer
uint8_t MLX90614_DRV_SMB_pec(uint8_t* data, size_t length) {
    
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

/// @brief Send command to sensor using SMBus
bool MLX90614_DRV_SMB_command (uint8_t command) {

    // Initialize the buffer for writing process
    uint8_t buffer[3] = {
        ((uint8_t) config.slave_address) << 1U,
        command,
        0       
    };

    uint8_t *pec = &buffer[2];    

    // Evaluate the pec verification code
    *pec = MLX90614_DRV_SMB_pec(buffer, 2);

    // Write data
    bool bValid = I2C_DRV_Write((uint16_t) config.slave_address, &buffer[1], 2);
    
    // Wait ...   
    vTaskDelay(config.read_timeout_ms / portTICK_PERIOD_MS);
    
    if (bValid) {
        LOG_print_debug(MLX90614_DRV_LOG, "command operation SA=%d, CMD=%d",             
			config.slave_address, buffer[1]);        
    } else {
        LOG_print_error(MLX90614_DRV_LOG, "command operation failed");
    }
    
    return bValid;
}

/// @brief Write value on a sensor's register using SMBus
bool MLX90614_DRV_SMB_write (uint8_t command, uint16_t value) {

    // Initialize the buffer for writing process
    uint8_t buffer[5] = {
        ((uint8_t) config.slave_address) << 1U,
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
    *pec = MLX90614_DRV_SMB_pec(buffer, 4);

    // Write data    
    bool bValid = I2C_DRV_Write((uint16_t) config.slave_address, &buffer[1], 4);
    
    // Wait ...   
    vTaskDelay(config.read_timeout_ms / portTICK_PERIOD_MS);
    
    if (bValid) {
        LOG_print_debug(MLX90614_DRV_LOG, "SMB write SA=%d, CMD=%d, LSB=%d, MSB=%d, PEC=%d", 
            config.slave_address, buffer[1], buffer[2], buffer[3], buffer[4]);
    } else {
        LOG_print_error(MLX90614_DRV_LOG, "write operation failed");
    }
    
    return bValid;
}

/// @brief Read the value of a sensor's register using SMBus
bool MLX90614_DRV_SMB_read (uint8_t command, uint16_t* value) 
{

    // Initialize the buffer for reading process
    uint8_t buffer[6] = {
        ((uint8_t) config.slave_address) << 1U,
        command,
        (((uint8_t) config.slave_address) << 1U) + 1U,
        0,
        0,
        0        
    };
    
    bool bValid = I2C_DRV_WriteRead((uint16_t) config.slave_address, &buffer[1], 1, &buffer[3], 3);
    
    // Wait ...   
    vTaskDelay(config.read_timeout_ms / portTICK_PERIOD_MS);

    if (bValid) {

        uint8_t *lsb = &buffer[3];
        uint8_t *msb = &buffer[4];
        uint8_t *pec = &buffer[5];

        // Set value
        *value = (((uint16_t)*msb) << 8U) | (((uint16_t)*lsb));
        
        LOG_print_debug(MLX90614_DRV_LOG, "SMB read SA=%d, CMD=%d, LSB=%d, MSB=%d, PEC=%d", 
            config.slave_address, buffer[1], buffer[3], buffer[4], buffer[5]); 

        // Check pec
        if (MLX90614_DRV_SMB_pec(buffer, 5) == *pec) {
            LOG_print_debug(MLX90614_DRV_LOG, "read operation success [PEC]");
            return true;
        }            
       
        LOG_print_error(MLX90614_DRV_LOG, "read operation failed [PEC]");
    }    

    LOG_print_error(MLX90614_DRV_LOG, "read operation failed");
    return false;
}

/// @brief Write value on a EEPROM sensor's register using SMBus
bool MLX90614_DRV_SMB_write_EEPROM (uint8_t reg_addr, uint16_t value) {
	
    uint8_t command = (reg_addr & SMB_CMD_REG_MASK) | SMB_CMD_EEPROM_ACCESS;
    return MLX90614_DRV_SMB_write(command, value);
}
/// @brief Read the value of a EEPROM sensor's register using SMBus
bool MLX90614_DRV_SMB_read_EEPROM (uint8_t reg_addr, uint16_t* value) {
	
    uint8_t command = (reg_addr & SMB_CMD_REG_MASK) | SMB_CMD_EEPROM_ACCESS;
    return MLX90614_DRV_SMB_read(command, value);
}

/// @brief Read the value of a RAM sensor's register using SMBus
bool MLX90614_DRV_SMB_read_RAM (uint8_t reg_addr, uint16_t* value) {

    uint8_t command = (reg_addr & SMB_CMD_REG_MASK) | SMB_CMD_RAM_ACCESS;
    return MLX90614_DRV_SMB_read(command, value);
}

/// @brief Dump the RAM content
bool MLX90614_DRV_SMB_dumpRAM (void) {

    for (int i = 0; i < 32; i++)
        if (!MLX90614_DRV_SMB_read_RAM(i, &ram_table.value[i])) {
            ram_table.value[i] = EMPTY_VALUE;      
            return false;
        }

    return true;
}

/// @brief Dump the EEPROM content
bool MLX90614_DRV_SMB_dumpEE (void) {

    for (int i = 0; i < 32; i++)
        if (!MLX90614_DRV_SMB_read_EEPROM(i, &eeprom_table.value[i])) {
            eeprom_table.value[i] = EMPTY_VALUE;      
            return false;
        }

    return true;
}

/* ************************************************************************** */
/// TODO: Basic driver methods to manage configuration on the EEPROM (SMB mode)
/* ************************************************************************** */

/// @brief Implement procedure to write value on a EEPROM sensor's register using SMBus
bool MLX90614_DRV_SMB_Set_Register (uint16_t value, uint8_t address, uint16_t *p_eeprom_table) {
        
    // Erase, write, readback, and check the set operation
    if (MLX90614_DRV_SMB_write_EEPROM(address, 0x0000))
		if (MLX90614_DRV_SMB_write_EEPROM(address, value))
			if (MLX90614_DRV_SMB_read_EEPROM(address, p_eeprom_table))
				if (*p_eeprom_table == value)
					return true;
				else
					LOG_print_error(MLX90614_DRV_LOG, "set eeprom register failed, value=%d, addr=%d", value, address);
				
    *p_eeprom_table = EMPTY_VALUE;
    return false;
}

/// @brief Write the EEPROM Config Register1
bool MLX90614_DRV_SMB_Set_ConfigRegister1 (uint16_t mask, int shift, uint16_t value) {
        
    uint16_t data = eeprom_table.config_register_1 & mask;
    data = data | (value << shift);
	
    return MLX90614_DRV_SMB_Set_Register(data, SMB_EEPROM_CONFIG_REGISTER_1_ADDR, &eeprom_table.config_register_1);
}

/// @brief Set the FIR value in EEPROM Config Register1
bool MLX90614_DRV_SMB_Set_FIR (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.config_register_1 & 0x0700) >> 8;
    value = value & 0x07;

    // Compare old configuration with new configuration
    if (old_value != value)
        if (MLX90614_DRV_SMB_Set_ConfigRegister1(0xF8FF, 8, value))  {
            LOG_print_info(MLX90614_DRV_LOG, "set fir with value %d", value);
        } else
            return false;
    
    return true;
}

/// @brief Set the IIR value in EEPROM Config Register1
bool MLX90614_DRV_SMB_Set_IIR (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.config_register_1 & 0x0007) >> 0;
    value = value & 0x07;
    
    // Compare old configuration with new configuration
    if (old_value != value)
        if (MLX90614_DRV_SMB_Set_ConfigRegister1(0xFFF8, 0, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set iir with value %d", value);
        } else
            return false;

    return true;
}

/// @brief Set the IR sensor value in EEPROM in EEPROM Config Register1
bool MLX90614_DRV_SMB_Set_IRsensor (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.config_register_1 & 0x0040) >> 6;
    value = value & 0x01;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_ConfigRegister1(0xFFBF, 6, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set ir_sensor with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the Repeat sensor test value in EEPROM Config Register1
bool MLX90614_DRV_SMB_Set_RepeatSensorTest (bool enable) {
	
    uint16_t old_value = (eeprom_table.config_register_1 & 0x0008) >> 3;
    uint16_t value = (uint16_t)(enable);

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_ConfigRegister1(0xFFF7, 3, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set repeat_sensor_test with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the T channel value in EEPROM Config Register1
bool MLX90614_DRV_SMB_Set_Tchannel (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.config_register_1 & 0x0030) >> 4;
    value = value & 0x03;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_ConfigRegister1(0xFFCF, 4, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set T_channel with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the Ks sign value in EEPROM Config Register1
bool MLX90614_DRV_SMB_Set_KsSign (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.config_register_1 & 0x0080) >> 7;
    value = value & 0x01;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_ConfigRegister1(0xFF7F, 7, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set ks_sign with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the gain value in EEPROM Config Register1
bool MLX90614_DRV_SMB_Set_Gain (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.config_register_1 & 0x3800) >> 11;
    value = value & 0x07;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_ConfigRegister1(0xC7FF, 11, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set gain with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the Kt2 sign value in EEPROM Config Register1
bool MLX90614_DRV_SMB_Set_Kt2Sign (bool sign) {
	
    uint16_t old_value = (eeprom_table.config_register_1 & 0x4000) >> 14;
    uint16_t value = (uint16_t)(sign);

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_ConfigRegister1(0xBFFF, 14, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set kt2_sign with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the sensor test value in EEPROM Config Register1
bool MLX90614_DRV_SMB_Set_SensorTest (bool enable) {
	
    uint16_t old_value = (eeprom_table.config_register_1 & 0x8000) >> 15;
    uint16_t value = (uint16_t)(enable);

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_ConfigRegister1(0x7FFF, 15, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set the sensor_test with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Write the EEPROM emissivity register
bool MLX90614_DRV_SMB_Set_Emissivity (float value) {
    
    // Check if value is inside the range 0,05 - 1
    if (value > 1)
        value = 1;
    if (value < 0.05)
        value = 0.05;
    
    // Convert value to uint format
    uint16_t emissivity = (uint16_t) (65535 * value + 0.5);
    
    if (eeprom_table.emissivity == emissivity) 
        return true;
    
    if (MLX90614_DRV_SMB_command(0x60))
        if (MLX90614_DRV_SMB_Set_Register(emissivity, SMB_EEPROM_EMISSIVITY_REG_ADDR, &eeprom_table.emissivity))
            if (MLX90614_DRV_SMB_Set_Register(eeprom_table.melexis_reserved_2[0], 0x0F, &eeprom_table.melexis_reserved_2[0]))
                if (MLX90614_DRV_SMB_command(0x61)) {
                    LOG_print_info(MLX90614_DRV_LOG, "set emissivity with value %f", value);
                    return true;
                }
	
    LOG_print_error(MLX90614_DRV_LOG, "set emissivity with value %f failed", value);
    return false;
}

/// @brief Write the EEPROM slave address register
bool MLX90614_DRV_SMB_Set_SlaveAddress (uint16_t value) {
    
    if (eeprom_table.smb_address == value) 
        return true;
    
    if (!MLX90614_DRV_SMB_Set_Register(value, SMB_EEPROM_SA_REG_ADDR, &eeprom_table.smb_address)){
        LOG_print_error(MLX90614_DRV_LOG, "set slave_address with value %d failed", value);
        return false;
    }

    LOG_print_info(MLX90614_DRV_LOG, "set slave_address with value %d", value);
    return true;
}

/// @brief Write the EEPROM TO max register (tempearature in celsius) (-273,15 <> 382.2)
bool MLX90614_DRV_SMB_Set_TOmax (float temperature) {
    
    if (temperature > 382.2)
        temperature = 382.2;    
    if (temperature < -273.15)
        temperature = -273,15;
    
    uint16_t value = (uint16_t)((temperature + 273.15) * 100);
    
    if (eeprom_table.to_max == value) 
        return true;
	
    if (!MLX90614_DRV_SMB_Set_Register(value, SMB_EEPROM_TO_MAX_REG_ADDR, &eeprom_table.to_max)){
        LOG_print_error(MLX90614_DRV_LOG, "set to_max with value %d failed", value);
        return false;
    } 

    LOG_print_info(MLX90614_DRV_LOG, "set to_max with value %d", value);
    return true;
}

/// @brief Write the EEPROM TO min register (temperature in celsius) (-273,15 <> 382.2)
bool MLX90614_DRV_SMB_Set_TOmin (float temperature) {
    
    if (temperature > 382.2)
        temperature = 382.2;    
    if (temperature < -273.15)
        temperature = -273,15;
    
    uint16_t value = (uint16_t)((temperature + 273.15) * 100);
    
    if (eeprom_table.to_min == value) 
        return true;
    
    if (!MLX90614_DRV_SMB_Set_Register(value, SMB_EEPROM_TO_MIN_REG_ADDR, &eeprom_table.to_min)){
        LOG_print_error(MLX90614_DRV_LOG, "set to_min with value %d failed", value);
        return false;
    } 
    LOG_print_info(MLX90614_DRV_LOG, "set to_min with value %d", value);
    return true;
}

/// @brief Write the EEPROM TA max in TA range register (-38,2 <> 125)
bool MLX90614_DRV_SMB_Set_TAmax (float temperature) {
	
    if (temperature > 125)
        temperature = 125;    
    if (temperature < -38.2)
        temperature = -38.2;
    
    uint16_t value = (uint16_t)((temperature + 38.2) * 1.5625);
    
    value = value & 0x00FF;
	uint16_t data = eeprom_table.ta_range & 0x00FF;
    data = data | ((value & 0x00FF) << 8);
    
    if (eeprom_table.ta_range == data) 
        return true;
	
    if (!MLX90614_DRV_SMB_Set_Register(data, SMB_EEPROM_TA_RANGE_REG_ADDR, &eeprom_table.ta_range)){
        LOG_print_error(MLX90614_DRV_LOG, "set ta_max with value %d failed", value);
        return false;
    } 

    LOG_print_info(MLX90614_DRV_LOG, "set ta_max with value %d", value);
    return true;
}

/// @brief Write the EEPROM TA min in TA range register (-38,2 <> 125)
bool MLX90614_DRV_SMB_Set_TAmin (float temperature) {
	
    if (temperature > 125)
        temperature = 125;    
    if (temperature < -38.2)
        temperature = -38.2;
    
    uint16_t value = (uint16_t)((temperature + 38.2) * 1.5625);
    
    value = value & 0x00FF;
	uint16_t data = eeprom_table.ta_range & 0xFF00;
    data = data | ((value & 0x00FF) << 0);
    
    if (eeprom_table.ta_range == data) 
        return true;
	
    if (!MLX90614_DRV_SMB_Set_Register(data, SMB_EEPROM_TA_RANGE_REG_ADDR, &eeprom_table.ta_range)){
        LOG_print_error(MLX90614_DRV_LOG, "set ta_min with value %d failed", value);
        return false;
    } 

    LOG_print_info(MLX90614_DRV_LOG, "set ta_min with value %d", value);
    return true;
}

/// @brief Write the EEPROM PWMCTRL
bool MLX90614_DRV_SMB_Set_PWMCTRL (uint16_t mask, int shift, uint16_t value) {
        
    uint16_t data = eeprom_table.pwmctrl & mask;
    data = data | ((value & (~mask & 0xFFFF)) << shift);
	
    return MLX90614_DRV_SMB_Set_Register(data, SMB_EEPROM_PWMCTRL_REG_ADDR, &eeprom_table.pwmctrl);
}

/// @brief Set PWM mode value in EEPROM PWMCTRL
bool MLX90614_DRV_SMB_Set_PWM_mode (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.pwmctrl & 0x0001) >> 0;
    value = value & 0x0001;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_PWMCTRL(0xFFFE, 0, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set the pwm mode with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set the EN_PWM value in EEPROM PWMCTRL
bool MLX90614_DRV_SMB_Set_EN_PWM (bool enable) {
	
    uint16_t old_value = (eeprom_table.pwmctrl & 0x0002) >> 1;
    uint16_t value = (uint16_t)(enable);

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_PWMCTRL(0xFFFD, 1, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set EN_PWM with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set PPODB in EEPROM PWMCTRL
bool MLX90614_DRV_SMB_Set_PPODB (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.pwmctrl & 0x0004) >> 2;
    value = value & 0x0001;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_PWMCTRL(0xFFFB, 2, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set PPODB with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set TRPWMB in EEPROM PWM PWMCTRL
bool MLX90614_DRV_SMB_Set_TRPWMB (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.pwmctrl & 0x0008) >> 3;
    value = value & 0x0001;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_PWMCTRL(0xFFF7, 3, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set TRPWMB with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set PWM repetition in EEPROM PWM PWMCTRL
bool MLX90614_DRV_SMB_Set_PWMrepetition (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.pwmctrl & 0x01F0) >> 4;
    value = value & 0x001F;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_PWMCTRL(0xFE0F, 4, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set the pwm_repetition with value %d", value);
        } else
            return false;
  
    return true;
}

/// @brief Set PWM period in EEPROM PWM PWMCTRL
bool MLX90614_DRV_SMB_Set_PWMperiod (uint16_t value) {
	
    uint16_t old_value = (eeprom_table.pwmctrl & 0xFE00) >> 9;
    value = value & 0x007F;

    // Compare old configuration with new configuration
    if (old_value != value)    
        if (MLX90614_DRV_SMB_Set_PWMCTRL(0x0100, 9, value)) {
            LOG_print_info(MLX90614_DRV_LOG, "set the pwm_period with value %d", value);
        } else
            return false;
  
    return true;
}

/* ************************************************************************** */
/// TODO: API driver methods (SMBus)
/* ************************************************************************** */

/// @brief Start driver operation with SMBus
/// @return error code
uint8_t MLX90614_DRV_SMB_Start (mlx90614_drv_config_t* _config) {
	
    bool bValid = true;
    
    // Initialize Driver (power up)
    MLX90614_DRV_init(_config);    
    MLX90614_DRV_powerup();

    // Synchronize driver with internal MLX90614 memory (dump RAM and EEPROM memory)
    if (!MLX90614_DRV_SMB_dumpEE())
        return MLX90614_DRV_ERROR_EPPROM_READ;
    if (!MLX90614_DRV_SMB_dumpRAM())
        return MLX90614_DRV_ERROR_RAM_READ;

    // Update configuration 
    if (bValid) bValid = MLX90614_DRV_SMB_Set_FIR(config.fir_setting);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_IIR(config.iir_setting);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_IRsensor(config.ir_sensor_setting);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_RepeatSensorTest(config.repeat_sensor_test);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_Tchannel(config.t_channel);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_KsSign(config.ks_sign);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_Kt2Sign(config.kt2_sign);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_SensorTest(config.sensor_test);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_Gain(config.gain);    
    if (bValid) bValid = MLX90614_DRV_SMB_Set_PWM_mode(config.pwm_mode);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_EN_PWM(config.en_pwm);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_PPODB(config.ppodb);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_TRPWMB(config.trpwmb);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_PWMrepetition(config.pwm_repetition);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_PWMperiod(config.pwm_period);    
    if (bValid) bValid = MLX90614_DRV_SMB_Set_TOmax(config.to_max);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_TOmin(config.to_min);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_TAmax(config.ta_max);
    if (bValid) bValid = MLX90614_DRV_SMB_Set_TAmin(config.ta_min);    
    if (bValid) bValid = MLX90614_DRV_SMB_Set_Emissivity(config.emissivity);   
    
    if (!bValid)
        return MLX90614_DRV_ERROR_EEPROM_WRITE;

    // Restart module (power down and power up)
    MLX90614_DRV_powerdown();
    MLX90614_DRV_powerup();
    
    LOG_print_info(MLX90614_DRV_LOG, "start driver with SMB communication");
    return MLX90614_DRV_ERROR_NONE;
}

/// @brief Stop driver operation
void MLX90614_DRV_Stop (void) {
	
    // Stop module (power down)
    MLX90614_DRV_powerdown();    
    LOG_print_info(MLX90614_DRV_LOG, "stop driver");
}

/// @brief Get the ambient temperature (Ta) from the sensor via SMBus.
/// @return error code
uint8_t MLX90614_DRV_SMB_GetTa (float *ta) {
	
    // Read the RAM register for ambient temperature
    if (!MLX90614_DRV_SMB_read_RAM(SMB_RAM_TA_REG_ADDR, &ram_table.t_a)) {
        ram_table.t_a = EMPTY_VALUE;      
        return MLX90614_DRV_ERROR_RAM_READ;
    }

    // Check that sign bit is positive (negative temperature not are possible)
    if (ram_table.t_a > 0x7FFF | ram_table.t_a  < 0x27AD)
        return MLX90614_DRV_ERROR_TEMPERATURE_INVALID;

    // Conversion in Celsius
    *ta = (float)ram_table.t_a * 0.02f - 273.15;
    LOG_print_info(MLX90614_DRV_LOG, "ambient temperature %f", *ta);
        
    return MLX90614_DRV_ERROR_NONE;
}  

/// @brief Get the object temperature (Tobj1) from the sensor via SMBus.
/// @return error code
uint8_t MLX90614_DRV_SMB_GetT0bj1(float *tobj) {
	
    // Read the RAM register for ambient temperature
    if (!MLX90614_DRV_SMB_read_RAM(SMB_RAM_TOBJ1_REG_ADDR, &ram_table.t_obj1)) {
        ram_table.t_obj1 = EMPTY_VALUE;      
        return MLX90614_DRV_ERROR_RAM_READ;
    }

    // Check that sign bit is positive (negative temperature not are possible)
    if (ram_table.t_obj1 > 0x7FFF | ram_table.t_obj1  < 0x27AD)
        return MLX90614_DRV_ERROR_TEMPERATURE_INVALID;

    // Conversion in Celsius
    *tobj = (float)ram_table.t_obj1 * 0.02f - 273.15;
    LOG_print_info(MLX90614_DRV_LOG, "object 1 temperature %f", *tobj);
        
    return MLX90614_DRV_ERROR_NONE;
} 

/// @brief Get the object temperature (Tobj2) from the sensor via SMBus.
/// @return error code
uint8_t MLX90614_DRV_SMB_GetT0bj2 (float *tobj) {
	
    // Check if are working in single sensor mode
    if (((eeprom_table.config_register_1 & 0x0040) >> 6) == 0) {
        *tobj = 0;
        return MLX90614_DRV_ERROR_NONE;
    }
    
    // Read the RAM register for ambient temperature
    if (!MLX90614_DRV_SMB_read_RAM(SMB_RAM_TOBJ2_REG_ADDR, &ram_table.t_obj2)) {
        ram_table.t_obj2 = EMPTY_VALUE;      
        return MLX90614_DRV_ERROR_RAM_READ;
    }

    // Check that sign bit is positive (negative temperature not are possible)
    if (ram_table.t_obj2 > 0x7FFF | ram_table.t_obj2  < 0x27AD)
        return MLX90614_DRV_ERROR_TEMPERATURE_INVALID;

    // Conversion in Celsius
    *tobj = (float)ram_table.t_obj2 * 0.02f - 273.15;
    LOG_print_info(MLX90614_DRV_LOG, "object 2 temperature %f", *tobj);
        
    return MLX90614_DRV_ERROR_NONE;
} 

/// @brief Get the infrared data (IRch1) from the sensor via SMBus.
/// @return error code
uint8_t MLX90614_DRV_SMB_GetIRch1 (uint16_t *ir_data) {
	
    // Read the RAM register for ambient temperature
    if (!MLX90614_DRV_SMB_read_RAM(SMB_RAM_IRCH1_REG_ADDR, &ram_table.ir_ch_1)) {
        ram_table.ir_ch_1 = EMPTY_VALUE;      
        return MLX90614_DRV_ERROR_RAM_READ;
    }

    // Transfer value
    *ir_data = ram_table.ir_ch_1;
    LOG_print_info(MLX90614_DRV_LOG, "ir channel 1 temperature %d", *ir_data);
        
    return MLX90614_DRV_ERROR_NONE;
} 

/// @brief Get the infrared data (IRch2) from the sensor via SMBus.
/// @return error code
uint8_t MLX90614_DRV_SMB_GetIRch2 (uint16_t *ir_data) {
    
    // Check if are working in single sensor mode
    if (((eeprom_table.config_register_1 & 0x0040) >> 6) == 0) {
        *ir_data = 0;
        return MLX90614_DRV_ERROR_NONE;
    }
	
    // Read the RAM register for ambient temperature
    if (!MLX90614_DRV_SMB_read_RAM(SMB_RAM_IRCH2_REG_ADDR, &ram_table.ir_ch_2)) {
        ram_table.ir_ch_2 = EMPTY_VALUE;      
        return MLX90614_DRV_ERROR_RAM_READ;
    }

    // Transfer value
    *ir_data = ram_table.ir_ch_2;
    LOG_print_info(MLX90614_DRV_LOG, "ir channel 2 temperature %d", *ir_data);
        
    return MLX90614_DRV_ERROR_NONE;
}

/// @brief Get ID number of the sensor via SMBus.
uint64_t MLX90614_DRV_SMB_GetID (void) {
	
	uint64_t value = 0;
	for (int i = 0; i < 4; i++)
		value |= (uint64_t)(eeprom_table.id_number[i]) << (i * 8);
        
    return value;
}

