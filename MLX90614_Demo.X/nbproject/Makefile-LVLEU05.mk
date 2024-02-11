#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-LVLEU05.mk)" "nbproject/Makefile-local-LVLEU05.mk"
include nbproject/Makefile-local-LVLEU05.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=LVLEU05
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/LVLEU05/osal/osal_freertos.c ../src/config/LVLEU05/peripheral/clk/plib_clk.c ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c ../src/config/LVLEU05/peripheral/tc/plib_tc0.c ../src/config/LVLEU05/stdio/xc32_monitor.c ../src/config/LVLEU05/system/cache/sys_cache.c ../src/config/LVLEU05/system/int/src/sys_int.c ../src/config/LVLEU05/system/time/src/sys_time.c ../src/config/LVLEU05/exceptions.c ../src/config/LVLEU05/libc_syscalls.c ../src/config/LVLEU05/startup_xc32.c ../src/config/LVLEU05/interrupts.c ../src/config/LVLEU05/initialization.c ../src/config/LVLEU05/tasks.c ../src/config/LVLEU05/freertos_hooks.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/main.c ../src/app.c ../src/log.c ../src/MLX90614_DRV.c ../src/I2C_DRV.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1580911642/osal_freertos.o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ${OBJECTDIR}/_ext/346275119/sys_int.o ${OBJECTDIR}/_ext/454437993/sys_time.o ${OBJECTDIR}/_ext/891923492/exceptions.o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ${OBJECTDIR}/_ext/891923492/interrupts.o ${OBJECTDIR}/_ext/891923492/initialization.o ${OBJECTDIR}/_ext/891923492/tasks.o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/log.o ${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o ${OBJECTDIR}/_ext/1360937237/I2C_DRV.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d ${OBJECTDIR}/_ext/1475227814/plib_clk.o.d ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d ${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d ${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d ${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d ${OBJECTDIR}/_ext/1589946285/sys_cache.o.d ${OBJECTDIR}/_ext/346275119/sys_int.o.d ${OBJECTDIR}/_ext/454437993/sys_time.o.d ${OBJECTDIR}/_ext/891923492/exceptions.o.d ${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d ${OBJECTDIR}/_ext/891923492/startup_xc32.o.d ${OBJECTDIR}/_ext/891923492/interrupts.o.d ${OBJECTDIR}/_ext/891923492/initialization.o.d ${OBJECTDIR}/_ext/891923492/tasks.o.d ${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d ${OBJECTDIR}/_ext/246609638/port.o.d ${OBJECTDIR}/_ext/1665200909/heap_1.o.d ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d ${OBJECTDIR}/_ext/404212886/queue.o.d ${OBJECTDIR}/_ext/404212886/timers.o.d ${OBJECTDIR}/_ext/404212886/croutine.o.d ${OBJECTDIR}/_ext/404212886/event_groups.o.d ${OBJECTDIR}/_ext/404212886/list.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/log.o.d ${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o.d ${OBJECTDIR}/_ext/1360937237/I2C_DRV.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1580911642/osal_freertos.o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ${OBJECTDIR}/_ext/346275119/sys_int.o ${OBJECTDIR}/_ext/454437993/sys_time.o ${OBJECTDIR}/_ext/891923492/exceptions.o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ${OBJECTDIR}/_ext/891923492/interrupts.o ${OBJECTDIR}/_ext/891923492/initialization.o ${OBJECTDIR}/_ext/891923492/tasks.o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/log.o ${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o ${OBJECTDIR}/_ext/1360937237/I2C_DRV.o

# Source Files
SOURCEFILES=../src/config/LVLEU05/osal/osal_freertos.c ../src/config/LVLEU05/peripheral/clk/plib_clk.c ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c ../src/config/LVLEU05/peripheral/tc/plib_tc0.c ../src/config/LVLEU05/stdio/xc32_monitor.c ../src/config/LVLEU05/system/cache/sys_cache.c ../src/config/LVLEU05/system/int/src/sys_int.c ../src/config/LVLEU05/system/time/src/sys_time.c ../src/config/LVLEU05/exceptions.c ../src/config/LVLEU05/libc_syscalls.c ../src/config/LVLEU05/startup_xc32.c ../src/config/LVLEU05/interrupts.c ../src/config/LVLEU05/initialization.c ../src/config/LVLEU05/tasks.c ../src/config/LVLEU05/freertos_hooks.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/main.c ../src/app.c ../src/log.c ../src/MLX90614_DRV.c ../src/I2C_DRV.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-LVLEU05.mk ${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=WBZ451
MP_LINKER_FILE_OPTION=,--script="..\src\config\LVLEU05\WBZ451.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1580911642/osal_freertos.o: ../src/config/LVLEU05/osal/osal_freertos.c  .generated_files/flags/LVLEU05/89d56b085ea386b0faf5db6bd407bec111ce2eb8 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1580911642" 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1580911642/osal_freertos.o ../src/config/LVLEU05/osal/osal_freertos.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1475227814/plib_clk.o: ../src/config/LVLEU05/peripheral/clk/plib_clk.c  .generated_files/flags/LVLEU05/3c5186e9f9e8dbe1fe1aa16511dd28ec0a0e349e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1475227814" 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1475227814/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ../src/config/LVLEU05/peripheral/clk/plib_clk.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512578834/plib_cmcc.o: ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/LVLEU05/b452a50c700c8f3ad92dd1031e4490a9258655d .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512578834" 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512701079/plib_gpio.o: ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c  .generated_files/flags/LVLEU05/2bcd824dfa96e8661f9ebf52ef902e742318508e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512701079" 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512915370/plib_nvic.o: ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c  .generated_files/flags/LVLEU05/744b1cb2d73f85b8788568af07a8d919c52675f7 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512915370" 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o: ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  .generated_files/flags/LVLEU05/fe94eca4e519c4b601caeda96691c626e10629fe .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/566442893" 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o: ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c  .generated_files/flags/LVLEU05/19c00e5af49fdef743b793fc2bedeaa78312736a .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1949253983" 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d" -o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1710155465/plib_tc0.o: ../src/config/LVLEU05/peripheral/tc/plib_tc0.c  .generated_files/flags/LVLEU05/2a669a6cdf191ec84928895018b1567fde41a302 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1710155465" 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ../src/config/LVLEU05/peripheral/tc/plib_tc0.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1767347422/xc32_monitor.o: ../src/config/LVLEU05/stdio/xc32_monitor.c  .generated_files/flags/LVLEU05/430cfc57c0fae4d04424602f604f15c0ffed8da .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1767347422" 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ../src/config/LVLEU05/stdio/xc32_monitor.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1589946285/sys_cache.o: ../src/config/LVLEU05/system/cache/sys_cache.c  .generated_files/flags/LVLEU05/6d5200926c79ab0171f5b352ac98b0a6cfa50f38 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1589946285" 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1589946285/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ../src/config/LVLEU05/system/cache/sys_cache.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346275119/sys_int.o: ../src/config/LVLEU05/system/int/src/sys_int.c  .generated_files/flags/LVLEU05/feae62c1ab5d258f5638d38e92d31d2463a28576 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346275119" 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/346275119/sys_int.o.d" -o ${OBJECTDIR}/_ext/346275119/sys_int.o ../src/config/LVLEU05/system/int/src/sys_int.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/454437993/sys_time.o: ../src/config/LVLEU05/system/time/src/sys_time.c  .generated_files/flags/LVLEU05/e00c5c32883e42c76e2260cd87fb0036db74a731 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/454437993" 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/454437993/sys_time.o.d" -o ${OBJECTDIR}/_ext/454437993/sys_time.o ../src/config/LVLEU05/system/time/src/sys_time.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/exceptions.o: ../src/config/LVLEU05/exceptions.c  .generated_files/flags/LVLEU05/840de02bb5abd4996a9fab9ca8a976c95fb2d3d2 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/exceptions.o.d" -o ${OBJECTDIR}/_ext/891923492/exceptions.o ../src/config/LVLEU05/exceptions.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/libc_syscalls.o: ../src/config/LVLEU05/libc_syscalls.c  .generated_files/flags/LVLEU05/952f52945ceb52ca8c0533e4b9a6a22fcf9d991e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ../src/config/LVLEU05/libc_syscalls.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/startup_xc32.o: ../src/config/LVLEU05/startup_xc32.c  .generated_files/flags/LVLEU05/889c5efe3239ea24aa3af0954471a583403cc725 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ../src/config/LVLEU05/startup_xc32.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/interrupts.o: ../src/config/LVLEU05/interrupts.c  .generated_files/flags/LVLEU05/dea0daef358a9155963371b7aebe8b3460eca07a .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/interrupts.o.d" -o ${OBJECTDIR}/_ext/891923492/interrupts.o ../src/config/LVLEU05/interrupts.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/initialization.o: ../src/config/LVLEU05/initialization.c  .generated_files/flags/LVLEU05/e2890e863c25b919c672559dc22354a21245f88f .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/initialization.o.d" -o ${OBJECTDIR}/_ext/891923492/initialization.o ../src/config/LVLEU05/initialization.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/tasks.o: ../src/config/LVLEU05/tasks.c  .generated_files/flags/LVLEU05/c1452d22eca639f28307af1db5b57760d35999e4 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/tasks.o.d" -o ${OBJECTDIR}/_ext/891923492/tasks.o ../src/config/LVLEU05/tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/freertos_hooks.o: ../src/config/LVLEU05/freertos_hooks.c  .generated_files/flags/LVLEU05/10f066508573e859dbf6b92b0f823de4ae05070e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ../src/config/LVLEU05/freertos_hooks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/LVLEU05/eeea9b83dabda4ca4dfafe25066ccf1093aa4c41 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/LVLEU05/e9bc006a049802ea810ef28463cee8e2384a85e2 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/LVLEU05/998141b2ca667f2da6674dcaa68afc121aac2636 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/LVLEU05/e08d22560968aea34c9cc5be83fcfba839b85e81 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/LVLEU05/b6a2aba5c2d4bd384dfd4052d92644a8a14aa30e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/LVLEU05/43a7472fab0d11c3469e5f2ea57f02b70e8d910d .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/LVLEU05/eea6e9b54064c5d6efdba0094d391aa04707f0a1 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/LVLEU05/940d231ee2ced20447f253c6a562b6799af42b17 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/LVLEU05/640c19018f7c4b7db21e8e8ae762c84f171e0280 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/LVLEU05/ba78319cc0b5753dea5ad1282e8308f0ae999e8a .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/LVLEU05/bc3a3f55d8cd258f31c8d2b9ede9f7b510886092 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/log.o: ../src/log.c  .generated_files/flags/LVLEU05/a235712e85c0309ae85a00f8f05ee317c7e73e1 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/log.o.d" -o ${OBJECTDIR}/_ext/1360937237/log.o ../src/log.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o: ../src/MLX90614_DRV.c  .generated_files/flags/LVLEU05/e3ff024f6bf488ca9468ef4c81513cc22d1b3174 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o.d" -o ${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o ../src/MLX90614_DRV.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/I2C_DRV.o: ../src/I2C_DRV.c  .generated_files/flags/LVLEU05/61fe79dc1b49b9a505b4d5b8202cd34788e15107 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/I2C_DRV.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/I2C_DRV.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/I2C_DRV.o.d" -o ${OBJECTDIR}/_ext/1360937237/I2C_DRV.o ../src/I2C_DRV.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1580911642/osal_freertos.o: ../src/config/LVLEU05/osal/osal_freertos.c  .generated_files/flags/LVLEU05/67c0833c614dd3e066b8fca885a1d86d81ba8b91 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1580911642" 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1580911642/osal_freertos.o ../src/config/LVLEU05/osal/osal_freertos.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1475227814/plib_clk.o: ../src/config/LVLEU05/peripheral/clk/plib_clk.c  .generated_files/flags/LVLEU05/a7140fe7b4f1844b7ba72568ebebea85477e79fa .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1475227814" 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1475227814/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ../src/config/LVLEU05/peripheral/clk/plib_clk.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512578834/plib_cmcc.o: ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/LVLEU05/b3994ef4957d6f1b2aaf2facfebcb7774fcfbb82 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512578834" 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512701079/plib_gpio.o: ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c  .generated_files/flags/LVLEU05/2017f0569aa5c319eb2f30cd503306634562d435 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512701079" 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512915370/plib_nvic.o: ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c  .generated_files/flags/LVLEU05/2b09db116a5f78c9862379cb07e4a96b672e6366 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512915370" 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o: ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  .generated_files/flags/LVLEU05/7e97ee390f07d60a1f9a78b2f689434bbb9d5144 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/566442893" 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o: ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c  .generated_files/flags/LVLEU05/1e075af076a4aff71e6521e9b1f2176af43ba579 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1949253983" 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d" -o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1710155465/plib_tc0.o: ../src/config/LVLEU05/peripheral/tc/plib_tc0.c  .generated_files/flags/LVLEU05/446cb3cb2ae1b25834203b35a60167ab47c89536 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1710155465" 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ../src/config/LVLEU05/peripheral/tc/plib_tc0.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1767347422/xc32_monitor.o: ../src/config/LVLEU05/stdio/xc32_monitor.c  .generated_files/flags/LVLEU05/45f1be06040b01574836fb63f8100690146ae9c0 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1767347422" 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ../src/config/LVLEU05/stdio/xc32_monitor.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1589946285/sys_cache.o: ../src/config/LVLEU05/system/cache/sys_cache.c  .generated_files/flags/LVLEU05/346335ce3154578caed9dfaa1d142f262592a19 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1589946285" 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1589946285/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ../src/config/LVLEU05/system/cache/sys_cache.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346275119/sys_int.o: ../src/config/LVLEU05/system/int/src/sys_int.c  .generated_files/flags/LVLEU05/2103b5b89ff30a2613a5b00f5dfd405953c8ee5c .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346275119" 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/346275119/sys_int.o.d" -o ${OBJECTDIR}/_ext/346275119/sys_int.o ../src/config/LVLEU05/system/int/src/sys_int.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/454437993/sys_time.o: ../src/config/LVLEU05/system/time/src/sys_time.c  .generated_files/flags/LVLEU05/2730751a88c66c1466666167fc69e19aa6a67fc3 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/454437993" 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/454437993/sys_time.o.d" -o ${OBJECTDIR}/_ext/454437993/sys_time.o ../src/config/LVLEU05/system/time/src/sys_time.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/exceptions.o: ../src/config/LVLEU05/exceptions.c  .generated_files/flags/LVLEU05/3cb68774cd4e226c4eb80e44e64ed176bcd71c64 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/exceptions.o.d" -o ${OBJECTDIR}/_ext/891923492/exceptions.o ../src/config/LVLEU05/exceptions.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/libc_syscalls.o: ../src/config/LVLEU05/libc_syscalls.c  .generated_files/flags/LVLEU05/f357e129263bccf7cf489eff6c43ba48ce4d766 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ../src/config/LVLEU05/libc_syscalls.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/startup_xc32.o: ../src/config/LVLEU05/startup_xc32.c  .generated_files/flags/LVLEU05/404beeccfe777f51e9ceff21e66e2572f0c35b36 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ../src/config/LVLEU05/startup_xc32.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/interrupts.o: ../src/config/LVLEU05/interrupts.c  .generated_files/flags/LVLEU05/6be33df456e9705bb549faf9235375cba120a11e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/interrupts.o.d" -o ${OBJECTDIR}/_ext/891923492/interrupts.o ../src/config/LVLEU05/interrupts.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/initialization.o: ../src/config/LVLEU05/initialization.c  .generated_files/flags/LVLEU05/2bd36bbaf0dd4d4076f3dae1616189c9742d449e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/initialization.o.d" -o ${OBJECTDIR}/_ext/891923492/initialization.o ../src/config/LVLEU05/initialization.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/tasks.o: ../src/config/LVLEU05/tasks.c  .generated_files/flags/LVLEU05/b072f590cf552cd2419cc37cf02f9cd033cbccec .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/tasks.o.d" -o ${OBJECTDIR}/_ext/891923492/tasks.o ../src/config/LVLEU05/tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/freertos_hooks.o: ../src/config/LVLEU05/freertos_hooks.c  .generated_files/flags/LVLEU05/ca15f28abced6f45d8b81190f7cb08ff5fce4911 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ../src/config/LVLEU05/freertos_hooks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/LVLEU05/87103fb002f5d41080b4a85039576bedeffdd56d .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/LVLEU05/d8fe21e9d45450812ab93d080ac7f112713726e1 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/LVLEU05/d8a149e7982f2f0d7bd659d95151f59c8601e112 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/LVLEU05/6155ed27861ed7b76c9f0772c52ecb73d98158ac .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/LVLEU05/3226a91f8f7acd9ac64e93949c810ada21fdd1e4 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/LVLEU05/30c1d5917ac102429cd8dcae2d56625d4f5060c5 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/LVLEU05/3654745c1f82e31cdf330ade48ce6cd787eaf125 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/LVLEU05/6b890be929fc3dcb47e9a995e597d2a10e2ccbc5 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/LVLEU05/7af2dcf366862d4107c85486e87f0b7369bd67fe .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/LVLEU05/7767f6e6b0de77c9527cddb5bc22aafc0bbee65b .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/LVLEU05/6ae8621035d8060a7fee7242e9c9d33c6a38728b .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/log.o: ../src/log.c  .generated_files/flags/LVLEU05/8e0d29cd60cb19b516611d6717a674e3f42b88be .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/log.o.d" -o ${OBJECTDIR}/_ext/1360937237/log.o ../src/log.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o: ../src/MLX90614_DRV.c  .generated_files/flags/LVLEU05/9ea6bb6ebaf8e9d8325c1d39223d3dcc56e918a0 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o.d" -o ${OBJECTDIR}/_ext/1360937237/MLX90614_DRV.o ../src/MLX90614_DRV.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/I2C_DRV.o: ../src/I2C_DRV.c  .generated_files/flags/LVLEU05/50e08a0c77bc1e631be5b8f17eaf4c7a1d565195 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/I2C_DRV.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/I2C_DRV.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/I2C_DRV.o.d" -o ${OBJECTDIR}/_ext/1360937237/I2C_DRV.o ../src/I2C_DRV.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../src/PIC32CX1012BZ250_oaq_2nd_gen.a ../src/PIC32CX1012BZ250_zmod4xxx_cleaning.a  ../src/config/LVLEU05/WBZ451.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\src\PIC32CX1012BZ250_oaq_2nd_gen.a ..\src\PIC32CX1012BZ250_zmod4xxx_cleaning.a      -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	
else
${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../src/PIC32CX1012BZ250_oaq_2nd_gen.a ../src/PIC32CX1012BZ250_zmod4xxx_cleaning.a ../src/config/LVLEU05/WBZ451.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\src\PIC32CX1012BZ250_oaq_2nd_gen.a ..\src\PIC32CX1012BZ250_zmod4xxx_cleaning.a      -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
