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
SOURCEFILES_QUOTED_IF_SPACED=../src/config/LVLEU05/osal/osal_freertos.c ../src/config/LVLEU05/peripheral/clk/plib_clk.c ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c ../src/config/LVLEU05/peripheral/eic/plib_eic.c ../src/config/LVLEU05/peripheral/evsys/plib_evsys.c ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c ../src/config/LVLEU05/peripheral/tc/plib_tc0.c ../src/config/LVLEU05/stdio/xc32_monitor.c ../src/config/LVLEU05/system/cache/sys_cache.c ../src/config/LVLEU05/system/int/src/sys_int.c ../src/config/LVLEU05/system/time/src/sys_time.c ../src/config/LVLEU05/exceptions.c ../src/config/LVLEU05/libc_syscalls.c ../src/config/LVLEU05/startup_xc32.c ../src/config/LVLEU05/interrupts.c ../src/config/LVLEU05/initialization.c ../src/config/LVLEU05/tasks.c ../src/config/LVLEU05/freertos_hooks.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/main.c ../src/app.c ../src/MLX90614.c ../src/log.c ../src/i2c_smb.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1580911642/osal_freertos.o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ${OBJECTDIR}/_ext/1475225993/plib_eic.o ${OBJECTDIR}/_ext/352565068/plib_evsys.o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ${OBJECTDIR}/_ext/346275119/sys_int.o ${OBJECTDIR}/_ext/454437993/sys_time.o ${OBJECTDIR}/_ext/891923492/exceptions.o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ${OBJECTDIR}/_ext/891923492/interrupts.o ${OBJECTDIR}/_ext/891923492/initialization.o ${OBJECTDIR}/_ext/891923492/tasks.o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/MLX90614.o ${OBJECTDIR}/_ext/1360937237/log.o ${OBJECTDIR}/_ext/1360937237/i2c_smb.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d ${OBJECTDIR}/_ext/1475227814/plib_clk.o.d ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d ${OBJECTDIR}/_ext/1475225993/plib_eic.o.d ${OBJECTDIR}/_ext/352565068/plib_evsys.o.d ${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d ${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d ${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d ${OBJECTDIR}/_ext/1589946285/sys_cache.o.d ${OBJECTDIR}/_ext/346275119/sys_int.o.d ${OBJECTDIR}/_ext/454437993/sys_time.o.d ${OBJECTDIR}/_ext/891923492/exceptions.o.d ${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d ${OBJECTDIR}/_ext/891923492/startup_xc32.o.d ${OBJECTDIR}/_ext/891923492/interrupts.o.d ${OBJECTDIR}/_ext/891923492/initialization.o.d ${OBJECTDIR}/_ext/891923492/tasks.o.d ${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d ${OBJECTDIR}/_ext/246609638/port.o.d ${OBJECTDIR}/_ext/1665200909/heap_1.o.d ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d ${OBJECTDIR}/_ext/404212886/queue.o.d ${OBJECTDIR}/_ext/404212886/timers.o.d ${OBJECTDIR}/_ext/404212886/croutine.o.d ${OBJECTDIR}/_ext/404212886/event_groups.o.d ${OBJECTDIR}/_ext/404212886/list.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/MLX90614.o.d ${OBJECTDIR}/_ext/1360937237/log.o.d ${OBJECTDIR}/_ext/1360937237/i2c_smb.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1580911642/osal_freertos.o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ${OBJECTDIR}/_ext/1475225993/plib_eic.o ${OBJECTDIR}/_ext/352565068/plib_evsys.o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ${OBJECTDIR}/_ext/346275119/sys_int.o ${OBJECTDIR}/_ext/454437993/sys_time.o ${OBJECTDIR}/_ext/891923492/exceptions.o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ${OBJECTDIR}/_ext/891923492/interrupts.o ${OBJECTDIR}/_ext/891923492/initialization.o ${OBJECTDIR}/_ext/891923492/tasks.o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/MLX90614.o ${OBJECTDIR}/_ext/1360937237/log.o ${OBJECTDIR}/_ext/1360937237/i2c_smb.o

# Source Files
SOURCEFILES=../src/config/LVLEU05/osal/osal_freertos.c ../src/config/LVLEU05/peripheral/clk/plib_clk.c ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c ../src/config/LVLEU05/peripheral/eic/plib_eic.c ../src/config/LVLEU05/peripheral/evsys/plib_evsys.c ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c ../src/config/LVLEU05/peripheral/tc/plib_tc0.c ../src/config/LVLEU05/stdio/xc32_monitor.c ../src/config/LVLEU05/system/cache/sys_cache.c ../src/config/LVLEU05/system/int/src/sys_int.c ../src/config/LVLEU05/system/time/src/sys_time.c ../src/config/LVLEU05/exceptions.c ../src/config/LVLEU05/libc_syscalls.c ../src/config/LVLEU05/startup_xc32.c ../src/config/LVLEU05/interrupts.c ../src/config/LVLEU05/initialization.c ../src/config/LVLEU05/tasks.c ../src/config/LVLEU05/freertos_hooks.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/main.c ../src/app.c ../src/MLX90614.c ../src/log.c ../src/i2c_smb.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core/Include"



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
${OBJECTDIR}/_ext/1580911642/osal_freertos.o: ../src/config/LVLEU05/osal/osal_freertos.c  .generated_files/flags/LVLEU05/ea77c3da371796df1cb78ba7d207bf203cbbd737 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1580911642" 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1580911642/osal_freertos.o ../src/config/LVLEU05/osal/osal_freertos.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1475227814/plib_clk.o: ../src/config/LVLEU05/peripheral/clk/plib_clk.c  .generated_files/flags/LVLEU05/6311eb2903a95b6bb98703938e6db57510498b63 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1475227814" 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1475227814/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ../src/config/LVLEU05/peripheral/clk/plib_clk.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512578834/plib_cmcc.o: ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/LVLEU05/7deddf98278df773540c54d45a23d7f70b8fb2d5 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512578834" 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1475225993/plib_eic.o: ../src/config/LVLEU05/peripheral/eic/plib_eic.c  .generated_files/flags/LVLEU05/59a8a4c23f643db6965f2aae3868702d0be6b1e4 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1475225993" 
	@${RM} ${OBJECTDIR}/_ext/1475225993/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1475225993/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1475225993/plib_eic.o.d" -o ${OBJECTDIR}/_ext/1475225993/plib_eic.o ../src/config/LVLEU05/peripheral/eic/plib_eic.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/352565068/plib_evsys.o: ../src/config/LVLEU05/peripheral/evsys/plib_evsys.c  .generated_files/flags/LVLEU05/c2cdc9670c0a9f5964a30b504db0903a38d67e53 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/352565068" 
	@${RM} ${OBJECTDIR}/_ext/352565068/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/352565068/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/352565068/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/352565068/plib_evsys.o ../src/config/LVLEU05/peripheral/evsys/plib_evsys.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512701079/plib_gpio.o: ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c  .generated_files/flags/LVLEU05/967cb61c5d565bca2f2e4126a95710c559b567b5 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512701079" 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512915370/plib_nvic.o: ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c  .generated_files/flags/LVLEU05/a940c02b54e307892a65a8f9f5d1cecf0c2270df .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512915370" 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o: ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  .generated_files/flags/LVLEU05/1274d3af9ec7eecbe19d04001ebccff2d61355e7 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/566442893" 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o: ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c  .generated_files/flags/LVLEU05/85f404d1cd7d9896418595aa53c0f7c13c712315 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1949253983" 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d" -o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1710155465/plib_tc0.o: ../src/config/LVLEU05/peripheral/tc/plib_tc0.c  .generated_files/flags/LVLEU05/165a092a33d8df0b004384f8d782b58987d627e4 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1710155465" 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ../src/config/LVLEU05/peripheral/tc/plib_tc0.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1767347422/xc32_monitor.o: ../src/config/LVLEU05/stdio/xc32_monitor.c  .generated_files/flags/LVLEU05/23d92bfd23dbf83202d6eb55741a3c69c7677e2b .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1767347422" 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ../src/config/LVLEU05/stdio/xc32_monitor.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1589946285/sys_cache.o: ../src/config/LVLEU05/system/cache/sys_cache.c  .generated_files/flags/LVLEU05/ab0e601403ea0fe6095f4b9871ceee13cd75cf33 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1589946285" 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1589946285/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ../src/config/LVLEU05/system/cache/sys_cache.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346275119/sys_int.o: ../src/config/LVLEU05/system/int/src/sys_int.c  .generated_files/flags/LVLEU05/f8128ddce4668b2e2e9f03c1eb1a99958abbfa3e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346275119" 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/346275119/sys_int.o.d" -o ${OBJECTDIR}/_ext/346275119/sys_int.o ../src/config/LVLEU05/system/int/src/sys_int.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/454437993/sys_time.o: ../src/config/LVLEU05/system/time/src/sys_time.c  .generated_files/flags/LVLEU05/f2d8071152057330dd490c18b8a378bb042a63d5 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/454437993" 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/454437993/sys_time.o.d" -o ${OBJECTDIR}/_ext/454437993/sys_time.o ../src/config/LVLEU05/system/time/src/sys_time.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/exceptions.o: ../src/config/LVLEU05/exceptions.c  .generated_files/flags/LVLEU05/3828f7b8dcf46c87546220e463f9df9fac972aea .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/exceptions.o.d" -o ${OBJECTDIR}/_ext/891923492/exceptions.o ../src/config/LVLEU05/exceptions.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/libc_syscalls.o: ../src/config/LVLEU05/libc_syscalls.c  .generated_files/flags/LVLEU05/a65080024ed08ef84ae537abf259f8b127ead66d .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ../src/config/LVLEU05/libc_syscalls.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/startup_xc32.o: ../src/config/LVLEU05/startup_xc32.c  .generated_files/flags/LVLEU05/409b6228b42d21a7cbed2f2c59ed7ff43f950a81 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ../src/config/LVLEU05/startup_xc32.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/interrupts.o: ../src/config/LVLEU05/interrupts.c  .generated_files/flags/LVLEU05/861285d498bbed9ab53b96b1a65dda4c53bf4168 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/interrupts.o.d" -o ${OBJECTDIR}/_ext/891923492/interrupts.o ../src/config/LVLEU05/interrupts.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/initialization.o: ../src/config/LVLEU05/initialization.c  .generated_files/flags/LVLEU05/d03ea54ccf3b94b3cbb3bf6098cf1e8c375e9ad4 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/initialization.o.d" -o ${OBJECTDIR}/_ext/891923492/initialization.o ../src/config/LVLEU05/initialization.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/tasks.o: ../src/config/LVLEU05/tasks.c  .generated_files/flags/LVLEU05/7922825b93eed31317be342f67de607e662992c9 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/tasks.o.d" -o ${OBJECTDIR}/_ext/891923492/tasks.o ../src/config/LVLEU05/tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/freertos_hooks.o: ../src/config/LVLEU05/freertos_hooks.c  .generated_files/flags/LVLEU05/a4b63f03dba1ab6e91a29b4dc6fdb931b397025a .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ../src/config/LVLEU05/freertos_hooks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/LVLEU05/312f432f9b24b734ec946d9e8e82885c679bba7d .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/LVLEU05/1340b40838c31640f335ad8e8db2a15a67ba980 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/LVLEU05/a7dab10a93d4021f1fa0affef4681b85443f5d89 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/LVLEU05/c4c0485c8c2295c4e4b888d50d2277d34fd84dae .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/LVLEU05/e0bf26d1e14c1f329ffd31cbaab574a64b7115dd .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/LVLEU05/b4bd27ee57d1b2ac9a341f383d1e110edc0be936 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/LVLEU05/8220dd4f621a73254bfa96269a21e8e11b720544 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/LVLEU05/97615581a2c0b7b4a213b36296802e3d684f5600 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/LVLEU05/2d687bc6914cdae0693c034e883b0ce687f3e21d .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/LVLEU05/433b979df4f50dfd725a1ac38b47cdd4aeaa984d .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/LVLEU05/5ddf0268665d09a4ef8e97bc5f07b7fb339aa501 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/MLX90614.o: ../src/MLX90614.c  .generated_files/flags/LVLEU05/3a52052390aeef75f8d4b7abce86c41278738194 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/MLX90614.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/MLX90614.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/MLX90614.o.d" -o ${OBJECTDIR}/_ext/1360937237/MLX90614.o ../src/MLX90614.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/log.o: ../src/log.c  .generated_files/flags/LVLEU05/fa596905cb572670c59febd042a52ca7a97bb618 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/log.o.d" -o ${OBJECTDIR}/_ext/1360937237/log.o ../src/log.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/i2c_smb.o: ../src/i2c_smb.c  .generated_files/flags/LVLEU05/e8ec3baa42cee14dc4b5061032c7ab8040cf117e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/i2c_smb.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/i2c_smb.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/i2c_smb.o.d" -o ${OBJECTDIR}/_ext/1360937237/i2c_smb.o ../src/i2c_smb.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1580911642/osal_freertos.o: ../src/config/LVLEU05/osal/osal_freertos.c  .generated_files/flags/LVLEU05/59abb01c32be51ee1175f7c6efa83cbf074cd6ad .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1580911642" 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1580911642/osal_freertos.o ../src/config/LVLEU05/osal/osal_freertos.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1475227814/plib_clk.o: ../src/config/LVLEU05/peripheral/clk/plib_clk.c  .generated_files/flags/LVLEU05/afc813aaf2f5505661a35d2613b7f8faf2026050 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1475227814" 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1475227814/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ../src/config/LVLEU05/peripheral/clk/plib_clk.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512578834/plib_cmcc.o: ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/LVLEU05/baccf02a8ea6788c2d496213b22b46c93470313a .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512578834" 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1475225993/plib_eic.o: ../src/config/LVLEU05/peripheral/eic/plib_eic.c  .generated_files/flags/LVLEU05/6169b90f1932ac281f12e02cb8391eb61bfd5a35 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1475225993" 
	@${RM} ${OBJECTDIR}/_ext/1475225993/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1475225993/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1475225993/plib_eic.o.d" -o ${OBJECTDIR}/_ext/1475225993/plib_eic.o ../src/config/LVLEU05/peripheral/eic/plib_eic.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/352565068/plib_evsys.o: ../src/config/LVLEU05/peripheral/evsys/plib_evsys.c  .generated_files/flags/LVLEU05/adf07889ef4bad6a9ed4a7e21f9800ab6bdbfc0f .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/352565068" 
	@${RM} ${OBJECTDIR}/_ext/352565068/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/352565068/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/352565068/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/352565068/plib_evsys.o ../src/config/LVLEU05/peripheral/evsys/plib_evsys.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512701079/plib_gpio.o: ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c  .generated_files/flags/LVLEU05/ba65b89b8dbfbb942a4b579b56c0331f06ba3ca .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512701079" 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512915370/plib_nvic.o: ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c  .generated_files/flags/LVLEU05/90a289ec413ea42d97b74879db171bc8ddbffe14 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512915370" 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o: ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  .generated_files/flags/LVLEU05/6e8e76e14c7a70da3c42a53b4c14509f2007a4cd .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/566442893" 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o: ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c  .generated_files/flags/LVLEU05/62803aa4764ff361dac3bb684a0f6083b9ba25ad .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1949253983" 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d" -o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1710155465/plib_tc0.o: ../src/config/LVLEU05/peripheral/tc/plib_tc0.c  .generated_files/flags/LVLEU05/bc33b7e5a9a1bc54ad0597e30f0fb3a54eb6948b .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1710155465" 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ../src/config/LVLEU05/peripheral/tc/plib_tc0.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1767347422/xc32_monitor.o: ../src/config/LVLEU05/stdio/xc32_monitor.c  .generated_files/flags/LVLEU05/7f626f57d7c43ea464227667a8312ca7fade9b99 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1767347422" 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ../src/config/LVLEU05/stdio/xc32_monitor.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1589946285/sys_cache.o: ../src/config/LVLEU05/system/cache/sys_cache.c  .generated_files/flags/LVLEU05/f61909ad30c0b58cddaacab39900ab2563603cd9 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1589946285" 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1589946285/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ../src/config/LVLEU05/system/cache/sys_cache.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346275119/sys_int.o: ../src/config/LVLEU05/system/int/src/sys_int.c  .generated_files/flags/LVLEU05/c6c5460c8eff8ab305ac3632849659285ef87ff8 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346275119" 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/346275119/sys_int.o.d" -o ${OBJECTDIR}/_ext/346275119/sys_int.o ../src/config/LVLEU05/system/int/src/sys_int.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/454437993/sys_time.o: ../src/config/LVLEU05/system/time/src/sys_time.c  .generated_files/flags/LVLEU05/5060514c871135301998edc80805103ec61cde2 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/454437993" 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/454437993/sys_time.o.d" -o ${OBJECTDIR}/_ext/454437993/sys_time.o ../src/config/LVLEU05/system/time/src/sys_time.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/exceptions.o: ../src/config/LVLEU05/exceptions.c  .generated_files/flags/LVLEU05/361535b3adb19078b198bc705af7744be81627d9 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/exceptions.o.d" -o ${OBJECTDIR}/_ext/891923492/exceptions.o ../src/config/LVLEU05/exceptions.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/libc_syscalls.o: ../src/config/LVLEU05/libc_syscalls.c  .generated_files/flags/LVLEU05/2f82547f95c9d4cd216ccc382add660bee9b697a .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ../src/config/LVLEU05/libc_syscalls.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/startup_xc32.o: ../src/config/LVLEU05/startup_xc32.c  .generated_files/flags/LVLEU05/9641cd952f725be07f041a5f75b52ebd4a221aa .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ../src/config/LVLEU05/startup_xc32.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/interrupts.o: ../src/config/LVLEU05/interrupts.c  .generated_files/flags/LVLEU05/359235e6bbb015a6875deca3d3880cf6225fdd37 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/interrupts.o.d" -o ${OBJECTDIR}/_ext/891923492/interrupts.o ../src/config/LVLEU05/interrupts.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/initialization.o: ../src/config/LVLEU05/initialization.c  .generated_files/flags/LVLEU05/f7fd78feb465416412e61f0839835e8bdeb71625 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/initialization.o.d" -o ${OBJECTDIR}/_ext/891923492/initialization.o ../src/config/LVLEU05/initialization.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/tasks.o: ../src/config/LVLEU05/tasks.c  .generated_files/flags/LVLEU05/fa48e5aabe0da81186ce4ac63696266f4f4452ae .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/tasks.o.d" -o ${OBJECTDIR}/_ext/891923492/tasks.o ../src/config/LVLEU05/tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/freertos_hooks.o: ../src/config/LVLEU05/freertos_hooks.c  .generated_files/flags/LVLEU05/3d062eb4994b3c219cbb3a40df10f3c08ba44dfd .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ../src/config/LVLEU05/freertos_hooks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/LVLEU05/dee6d9d1f1bea43bd2b2473ce73cf98e94452f01 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/LVLEU05/f515a363ff61bc63d973c1f6e38339a5aa5ea52 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/LVLEU05/1c8fa7de629986bcde37c1e3bd35dac2cca6c630 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/LVLEU05/f7bf827e42ade05eea4c726bdd1f4856dbd15d7b .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/LVLEU05/73d0763d78bb94560f986e0d1864ea6bdbcfdc4a .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/LVLEU05/fb490dd9fd5de68984df391a5fd8acf809d7142b .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/LVLEU05/a047c2bf0cc859f7a5f13bca22f9f91ef7693054 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/LVLEU05/53650eb5a47102aba5086e9bf62f70fbb297a899 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/LVLEU05/515d6b16ad949daaff1aa2fed2856bfb8059a880 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/LVLEU05/ba79a364c1ab97a6c58fbfcbc7ce37ad5447aec .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/LVLEU05/c9123c67446781ff51b2c96a913efe990924db1a .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/MLX90614.o: ../src/MLX90614.c  .generated_files/flags/LVLEU05/47803338d825961e83ae4e74c1b5018f351166d9 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/MLX90614.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/MLX90614.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/MLX90614.o.d" -o ${OBJECTDIR}/_ext/1360937237/MLX90614.o ../src/MLX90614.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/log.o: ../src/log.c  .generated_files/flags/LVLEU05/87110eb1a21bd1ce3c534b92ebae1a100f722db8 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/log.o.d" -o ${OBJECTDIR}/_ext/1360937237/log.o ../src/log.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/i2c_smb.o: ../src/i2c_smb.c  .generated_files/flags/LVLEU05/c6de2134f43fc4db08c3c1a3145047ced3511241 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/i2c_smb.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/i2c_smb.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/i2c_smb.o.d" -o ${OBJECTDIR}/_ext/1360937237/i2c_smb.o ../src/i2c_smb.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\src\PIC32CX1012BZ250_oaq_2nd_gen.a ..\src\PIC32CX1012BZ250_zmod4xxx_cleaning.a      -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/WBZ451"
	
else
${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../src/PIC32CX1012BZ250_oaq_2nd_gen.a ../src/PIC32CX1012BZ250_zmod4xxx_cleaning.a ../src/config/LVLEU05/WBZ451.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/MLX90614_Demo.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\src\PIC32CX1012BZ250_oaq_2nd_gen.a ..\src\PIC32CX1012BZ250_zmod4xxx_cleaning.a      -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/WBZ451"
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
