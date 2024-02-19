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
SOURCEFILES_QUOTED_IF_SPACED=../src/app/driver/I2C_DRV.c ../src/app/driver/MLX90614_DRV.c ../src/app/plugin/MLX90614_Plugin.c ../src/app/service/log.c ../src/app/service/clock.c ../src/config/LVLEU05/osal/osal_freertos.c ../src/config/LVLEU05/peripheral/clk/plib_clk.c ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c ../src/config/LVLEU05/peripheral/tc/plib_tc0.c ../src/config/LVLEU05/stdio/xc32_monitor.c ../src/config/LVLEU05/system/cache/sys_cache.c ../src/config/LVLEU05/system/int/src/sys_int.c ../src/config/LVLEU05/system/time/src/sys_time.c ../src/config/LVLEU05/exceptions.c ../src/config/LVLEU05/libc_syscalls.c ../src/config/LVLEU05/startup_xc32.c ../src/config/LVLEU05/interrupts.c ../src/config/LVLEU05/initialization.c ../src/config/LVLEU05/tasks.c ../src/config/LVLEU05/freertos_hooks.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/main.c ../src/app.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/900200176/I2C_DRV.o ${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o ${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o ${OBJECTDIR}/_ext/2072612147/log.o ${OBJECTDIR}/_ext/2072612147/clock.o ${OBJECTDIR}/_ext/1580911642/osal_freertos.o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ${OBJECTDIR}/_ext/346275119/sys_int.o ${OBJECTDIR}/_ext/454437993/sys_time.o ${OBJECTDIR}/_ext/891923492/exceptions.o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ${OBJECTDIR}/_ext/891923492/interrupts.o ${OBJECTDIR}/_ext/891923492/initialization.o ${OBJECTDIR}/_ext/891923492/tasks.o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/900200176/I2C_DRV.o.d ${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o.d ${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o.d ${OBJECTDIR}/_ext/2072612147/log.o.d ${OBJECTDIR}/_ext/2072612147/clock.o.d ${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d ${OBJECTDIR}/_ext/1475227814/plib_clk.o.d ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d ${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d ${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d ${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d ${OBJECTDIR}/_ext/1589946285/sys_cache.o.d ${OBJECTDIR}/_ext/346275119/sys_int.o.d ${OBJECTDIR}/_ext/454437993/sys_time.o.d ${OBJECTDIR}/_ext/891923492/exceptions.o.d ${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d ${OBJECTDIR}/_ext/891923492/startup_xc32.o.d ${OBJECTDIR}/_ext/891923492/interrupts.o.d ${OBJECTDIR}/_ext/891923492/initialization.o.d ${OBJECTDIR}/_ext/891923492/tasks.o.d ${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d ${OBJECTDIR}/_ext/246609638/port.o.d ${OBJECTDIR}/_ext/1665200909/heap_1.o.d ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d ${OBJECTDIR}/_ext/404212886/queue.o.d ${OBJECTDIR}/_ext/404212886/timers.o.d ${OBJECTDIR}/_ext/404212886/croutine.o.d ${OBJECTDIR}/_ext/404212886/event_groups.o.d ${OBJECTDIR}/_ext/404212886/list.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/900200176/I2C_DRV.o ${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o ${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o ${OBJECTDIR}/_ext/2072612147/log.o ${OBJECTDIR}/_ext/2072612147/clock.o ${OBJECTDIR}/_ext/1580911642/osal_freertos.o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ${OBJECTDIR}/_ext/346275119/sys_int.o ${OBJECTDIR}/_ext/454437993/sys_time.o ${OBJECTDIR}/_ext/891923492/exceptions.o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ${OBJECTDIR}/_ext/891923492/interrupts.o ${OBJECTDIR}/_ext/891923492/initialization.o ${OBJECTDIR}/_ext/891923492/tasks.o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o

# Source Files
SOURCEFILES=../src/app/driver/I2C_DRV.c ../src/app/driver/MLX90614_DRV.c ../src/app/plugin/MLX90614_Plugin.c ../src/app/service/log.c ../src/app/service/clock.c ../src/config/LVLEU05/osal/osal_freertos.c ../src/config/LVLEU05/peripheral/clk/plib_clk.c ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c ../src/config/LVLEU05/peripheral/tc/plib_tc0.c ../src/config/LVLEU05/stdio/xc32_monitor.c ../src/config/LVLEU05/system/cache/sys_cache.c ../src/config/LVLEU05/system/int/src/sys_int.c ../src/config/LVLEU05/system/time/src/sys_time.c ../src/config/LVLEU05/exceptions.c ../src/config/LVLEU05/libc_syscalls.c ../src/config/LVLEU05/startup_xc32.c ../src/config/LVLEU05/interrupts.c ../src/config/LVLEU05/initialization.c ../src/config/LVLEU05/tasks.c ../src/config/LVLEU05/freertos_hooks.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/main.c ../src/app.c

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
${OBJECTDIR}/_ext/900200176/I2C_DRV.o: ../src/app/driver/I2C_DRV.c  .generated_files/flags/LVLEU05/ccdcdbabadd315e4901768d1ba329e15293ae6fd .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/900200176" 
	@${RM} ${OBJECTDIR}/_ext/900200176/I2C_DRV.o.d 
	@${RM} ${OBJECTDIR}/_ext/900200176/I2C_DRV.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/900200176/I2C_DRV.o.d" -o ${OBJECTDIR}/_ext/900200176/I2C_DRV.o ../src/app/driver/I2C_DRV.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o: ../src/app/driver/MLX90614_DRV.c  .generated_files/flags/LVLEU05/bcfcb6e56702f38b12cbc3d12729814491a4da9d .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/900200176" 
	@${RM} ${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o.d 
	@${RM} ${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o.d" -o ${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o ../src/app/driver/MLX90614_DRV.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o: ../src/app/plugin/MLX90614_Plugin.c  .generated_files/flags/LVLEU05/fe6863e198c40e869b8fdc3ceaf4cc15ad0dd86c .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/561848293" 
	@${RM} ${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o.d 
	@${RM} ${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o.d" -o ${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o ../src/app/plugin/MLX90614_Plugin.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2072612147/log.o: ../src/app/service/log.c  .generated_files/flags/LVLEU05/85289ff64e54411ba3ba95db2e79dd6efc569255 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2072612147" 
	@${RM} ${OBJECTDIR}/_ext/2072612147/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/2072612147/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/2072612147/log.o.d" -o ${OBJECTDIR}/_ext/2072612147/log.o ../src/app/service/log.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2072612147/clock.o: ../src/app/service/clock.c  .generated_files/flags/LVLEU05/6909083c6ecead6e797ac07b700c4e2d72b5d989 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2072612147" 
	@${RM} ${OBJECTDIR}/_ext/2072612147/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/2072612147/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/2072612147/clock.o.d" -o ${OBJECTDIR}/_ext/2072612147/clock.o ../src/app/service/clock.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1580911642/osal_freertos.o: ../src/config/LVLEU05/osal/osal_freertos.c  .generated_files/flags/LVLEU05/c11aa0cbfd4a7d5cc007c12bfacd643e2b062dbc .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1580911642" 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1580911642/osal_freertos.o ../src/config/LVLEU05/osal/osal_freertos.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1475227814/plib_clk.o: ../src/config/LVLEU05/peripheral/clk/plib_clk.c  .generated_files/flags/LVLEU05/22fc75cc12cb71b5ab998aa359c2b57de12d8873 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1475227814" 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1475227814/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ../src/config/LVLEU05/peripheral/clk/plib_clk.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512578834/plib_cmcc.o: ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/LVLEU05/3a3d8daaecdb6914707278f7b3720912d6128e0d .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512578834" 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512701079/plib_gpio.o: ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c  .generated_files/flags/LVLEU05/c054814002c3754c9919df813d680752d43b991e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512701079" 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512915370/plib_nvic.o: ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c  .generated_files/flags/LVLEU05/f42e69843384d5ce967f733e960e9f38c4fd134c .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512915370" 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o: ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  .generated_files/flags/LVLEU05/9acc1938deaf6af56c3417416ef19b2a21c4cb15 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/566442893" 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o: ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c  .generated_files/flags/LVLEU05/9e07f52dd43c108d0780afd11211e5217e0d05e6 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1949253983" 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d" -o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1710155465/plib_tc0.o: ../src/config/LVLEU05/peripheral/tc/plib_tc0.c  .generated_files/flags/LVLEU05/d4c3325c732848faeac3487169aea95d260f62cb .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1710155465" 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ../src/config/LVLEU05/peripheral/tc/plib_tc0.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1767347422/xc32_monitor.o: ../src/config/LVLEU05/stdio/xc32_monitor.c  .generated_files/flags/LVLEU05/482b349e5cb200183ef53f67c2e8375145182bd .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1767347422" 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ../src/config/LVLEU05/stdio/xc32_monitor.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1589946285/sys_cache.o: ../src/config/LVLEU05/system/cache/sys_cache.c  .generated_files/flags/LVLEU05/2ae18f0542dcf872338aa973bafe1944a50f1c1e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1589946285" 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1589946285/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ../src/config/LVLEU05/system/cache/sys_cache.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346275119/sys_int.o: ../src/config/LVLEU05/system/int/src/sys_int.c  .generated_files/flags/LVLEU05/56744f3c1b465f5d0f205488d13b081c4e8c5bee .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346275119" 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/346275119/sys_int.o.d" -o ${OBJECTDIR}/_ext/346275119/sys_int.o ../src/config/LVLEU05/system/int/src/sys_int.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/454437993/sys_time.o: ../src/config/LVLEU05/system/time/src/sys_time.c  .generated_files/flags/LVLEU05/6536eee2c8181f88ae57f6a3dc99a4bf6a886aad .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/454437993" 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/454437993/sys_time.o.d" -o ${OBJECTDIR}/_ext/454437993/sys_time.o ../src/config/LVLEU05/system/time/src/sys_time.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/exceptions.o: ../src/config/LVLEU05/exceptions.c  .generated_files/flags/LVLEU05/21a48811a07e4c34acd10a9f3bd77a4198fc9bdf .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/exceptions.o.d" -o ${OBJECTDIR}/_ext/891923492/exceptions.o ../src/config/LVLEU05/exceptions.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/libc_syscalls.o: ../src/config/LVLEU05/libc_syscalls.c  .generated_files/flags/LVLEU05/686c61529fd79f5ff2cd21d57e5dc20a82a884f0 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ../src/config/LVLEU05/libc_syscalls.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/startup_xc32.o: ../src/config/LVLEU05/startup_xc32.c  .generated_files/flags/LVLEU05/50f8725efc3148f4f7564c356736b0d3f8914b98 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ../src/config/LVLEU05/startup_xc32.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/interrupts.o: ../src/config/LVLEU05/interrupts.c  .generated_files/flags/LVLEU05/ee0f63588d0307ac8d3770170d98603071d26c87 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/interrupts.o.d" -o ${OBJECTDIR}/_ext/891923492/interrupts.o ../src/config/LVLEU05/interrupts.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/initialization.o: ../src/config/LVLEU05/initialization.c  .generated_files/flags/LVLEU05/d09edfa91e623b87577a301ee93c4171fca6e4b6 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/initialization.o.d" -o ${OBJECTDIR}/_ext/891923492/initialization.o ../src/config/LVLEU05/initialization.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/tasks.o: ../src/config/LVLEU05/tasks.c  .generated_files/flags/LVLEU05/d51cf05f467603fc4a6e908d792c872f001da8ac .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/tasks.o.d" -o ${OBJECTDIR}/_ext/891923492/tasks.o ../src/config/LVLEU05/tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/freertos_hooks.o: ../src/config/LVLEU05/freertos_hooks.c  .generated_files/flags/LVLEU05/60283f704bd548886a53d9fd7e99f7c82f855da1 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ../src/config/LVLEU05/freertos_hooks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/LVLEU05/bbde5f6e8e204fd2327099d515169349df20e868 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/LVLEU05/b9d1d0cdc9536c0d2cfe0d4d2c71772691e12362 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/LVLEU05/c65552cff3bf765c1f557c0f7afcfd4e4807795c .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/LVLEU05/4e9dfb58ae30b0bcf153c113c774adca2b865643 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/LVLEU05/9fe701caa2b202c1dbcd2866dbcb22a23e575bd .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/LVLEU05/88b4d6109b9516add1a193c813977bc95e7592ee .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/LVLEU05/292932ba29461adc34b3575af8c688d1ecc32f00 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/LVLEU05/b6ffb1884302785ba4261ad65063ed8303dbc7ea .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/LVLEU05/21a65d73176fbf393bc292e7aa5598dba43d01a4 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/LVLEU05/aaee3ea680c2f51aac9d08d653ded9bdfe0e19d1 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/LVLEU05/3eeabf17c8ed2762a0165ff3918e1411ed365039 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/900200176/I2C_DRV.o: ../src/app/driver/I2C_DRV.c  .generated_files/flags/LVLEU05/bd2137537b8bdc844478614dd3dae7c47a5e2582 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/900200176" 
	@${RM} ${OBJECTDIR}/_ext/900200176/I2C_DRV.o.d 
	@${RM} ${OBJECTDIR}/_ext/900200176/I2C_DRV.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/900200176/I2C_DRV.o.d" -o ${OBJECTDIR}/_ext/900200176/I2C_DRV.o ../src/app/driver/I2C_DRV.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o: ../src/app/driver/MLX90614_DRV.c  .generated_files/flags/LVLEU05/9d6d30ce02a317e251a2f5f4140fb389a0be0c6e .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/900200176" 
	@${RM} ${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o.d 
	@${RM} ${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o.d" -o ${OBJECTDIR}/_ext/900200176/MLX90614_DRV.o ../src/app/driver/MLX90614_DRV.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o: ../src/app/plugin/MLX90614_Plugin.c  .generated_files/flags/LVLEU05/759b0993232c3cdf8bdb1f89475df3f25e186036 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/561848293" 
	@${RM} ${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o.d 
	@${RM} ${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o.d" -o ${OBJECTDIR}/_ext/561848293/MLX90614_Plugin.o ../src/app/plugin/MLX90614_Plugin.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2072612147/log.o: ../src/app/service/log.c  .generated_files/flags/LVLEU05/c99cc1be32433565e2b2558846cbaed1591a77f0 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2072612147" 
	@${RM} ${OBJECTDIR}/_ext/2072612147/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/2072612147/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/2072612147/log.o.d" -o ${OBJECTDIR}/_ext/2072612147/log.o ../src/app/service/log.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2072612147/clock.o: ../src/app/service/clock.c  .generated_files/flags/LVLEU05/d1ea7fa74b280579d7ad2c90a565ba81a66ec2ef .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2072612147" 
	@${RM} ${OBJECTDIR}/_ext/2072612147/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/2072612147/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/2072612147/clock.o.d" -o ${OBJECTDIR}/_ext/2072612147/clock.o ../src/app/service/clock.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1580911642/osal_freertos.o: ../src/config/LVLEU05/osal/osal_freertos.c  .generated_files/flags/LVLEU05/87c35a1b2d95794f2f1e7e56f5110edab2d05744 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1580911642" 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1580911642/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1580911642/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1580911642/osal_freertos.o ../src/config/LVLEU05/osal/osal_freertos.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1475227814/plib_clk.o: ../src/config/LVLEU05/peripheral/clk/plib_clk.c  .generated_files/flags/LVLEU05/73b649b32b8262b7f6fe20547704c98da119eb50 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1475227814" 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1475227814/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1475227814/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1475227814/plib_clk.o ../src/config/LVLEU05/peripheral/clk/plib_clk.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512578834/plib_cmcc.o: ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/LVLEU05/8d1c294339b01e0ec8a7282268aafab65e8ff54 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512578834" 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512578834/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1512578834/plib_cmcc.o ../src/config/LVLEU05/peripheral/cmcc/plib_cmcc.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512701079/plib_gpio.o: ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c  .generated_files/flags/LVLEU05/52785f10e7f3f362ca799c94589e1895e50d2a25 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512701079" 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512701079/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512701079/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1512701079/plib_gpio.o ../src/config/LVLEU05/peripheral/gpio/plib_gpio.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1512915370/plib_nvic.o: ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c  .generated_files/flags/LVLEU05/65bbe4df8b19f578af168a81ab78631ccd026153 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1512915370" 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1512915370/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1512915370/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1512915370/plib_nvic.o ../src/config/LVLEU05/peripheral/nvic/plib_nvic.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o: ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  .generated_files/flags/LVLEU05/67822c6b85cc8f9ac2c0473d39476249b8de685 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/566442893" 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/566442893/plib_sercom2_i2c_master.o ../src/config/LVLEU05/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o: ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c  .generated_files/flags/LVLEU05/1be54de8fa531785d811d414c15c6e32ec2d98f1 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1949253983" 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o.d" -o ${OBJECTDIR}/_ext/1949253983/plib_sercom0_usart.o ../src/config/LVLEU05/peripheral/sercom/usart/plib_sercom0_usart.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1710155465/plib_tc0.o: ../src/config/LVLEU05/peripheral/tc/plib_tc0.c  .generated_files/flags/LVLEU05/896acc51f4e884cd70b649cbbe71c6e1d3d55a82 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1710155465" 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1710155465/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1710155465/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/1710155465/plib_tc0.o ../src/config/LVLEU05/peripheral/tc/plib_tc0.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1767347422/xc32_monitor.o: ../src/config/LVLEU05/stdio/xc32_monitor.c  .generated_files/flags/LVLEU05/eb4b9e586a4cb739d642f35ba2c494f0d7e5975a .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1767347422" 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1767347422/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1767347422/xc32_monitor.o ../src/config/LVLEU05/stdio/xc32_monitor.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1589946285/sys_cache.o: ../src/config/LVLEU05/system/cache/sys_cache.c  .generated_files/flags/LVLEU05/d04b8e4f5120446caa11f55d7c3bc1125a48cc7c .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1589946285" 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1589946285/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1589946285/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1589946285/sys_cache.o ../src/config/LVLEU05/system/cache/sys_cache.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346275119/sys_int.o: ../src/config/LVLEU05/system/int/src/sys_int.c  .generated_files/flags/LVLEU05/370046e2be73954a691b4874672a0c7891e25e4c .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346275119" 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/346275119/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/346275119/sys_int.o.d" -o ${OBJECTDIR}/_ext/346275119/sys_int.o ../src/config/LVLEU05/system/int/src/sys_int.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/454437993/sys_time.o: ../src/config/LVLEU05/system/time/src/sys_time.c  .generated_files/flags/LVLEU05/10907a932b113ea5563968e0e1a78bfd1dc2bbff .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/454437993" 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/454437993/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/454437993/sys_time.o.d" -o ${OBJECTDIR}/_ext/454437993/sys_time.o ../src/config/LVLEU05/system/time/src/sys_time.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/exceptions.o: ../src/config/LVLEU05/exceptions.c  .generated_files/flags/LVLEU05/4f30fceeefaad9bc2a5d0c09e800e4db8b4622ee .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/exceptions.o.d" -o ${OBJECTDIR}/_ext/891923492/exceptions.o ../src/config/LVLEU05/exceptions.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/libc_syscalls.o: ../src/config/LVLEU05/libc_syscalls.c  .generated_files/flags/LVLEU05/648093a5986dc01586082738ea58484c0157f743 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/891923492/libc_syscalls.o ../src/config/LVLEU05/libc_syscalls.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/startup_xc32.o: ../src/config/LVLEU05/startup_xc32.c  .generated_files/flags/LVLEU05/6031b308a4da1b9200c275a8fe0de1f59a074696 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/891923492/startup_xc32.o ../src/config/LVLEU05/startup_xc32.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/interrupts.o: ../src/config/LVLEU05/interrupts.c  .generated_files/flags/LVLEU05/a5177460ec7a7cad80cf7839702ef9ef38c4f564 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/interrupts.o.d" -o ${OBJECTDIR}/_ext/891923492/interrupts.o ../src/config/LVLEU05/interrupts.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/initialization.o: ../src/config/LVLEU05/initialization.c  .generated_files/flags/LVLEU05/62096d5ff884cb6125e2030a78ec36d485b3953b .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/initialization.o.d" -o ${OBJECTDIR}/_ext/891923492/initialization.o ../src/config/LVLEU05/initialization.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/tasks.o: ../src/config/LVLEU05/tasks.c  .generated_files/flags/LVLEU05/d57bfd58e8a3fa5d7bb81ada4fa600d8a5672c72 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/tasks.o.d" -o ${OBJECTDIR}/_ext/891923492/tasks.o ../src/config/LVLEU05/tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/891923492/freertos_hooks.o: ../src/config/LVLEU05/freertos_hooks.c  .generated_files/flags/LVLEU05/8d612d0bf91744aa3e26837f028bac6e10a1b6ec .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/891923492" 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/891923492/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/891923492/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/891923492/freertos_hooks.o ../src/config/LVLEU05/freertos_hooks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/LVLEU05/f0ae60ea12ca8a3ff76fd5291da235bc0332445a .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/LVLEU05/48d9c1bfcf775c35485cabd16745643c46732ee4 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/LVLEU05/7b0592168ed8f59b8e6346f397f92a9050e9ffdd .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/LVLEU05/90c2240763402e966f55770fada521cd1a8c2dcd .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/LVLEU05/f9de23f934c298d3a36cd500fd99234c3b68529f .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/LVLEU05/8a8e60162f4a445db43a22bd8338e6688bdc4916 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/LVLEU05/7214b9af582acadbaf34761de836aa714a72e688 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/LVLEU05/239155ed12091e931d605da9687b0ae8a58b74b8 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/LVLEU05/78954f090c52dbdeb51359536a7a4414b178eecc .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/LVLEU05/f0437a4fba9fb51a746f2b9f2ee223c1555d1788 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/LVLEU05/473113068089f93930a45161fdea274857ee2410 .generated_files/flags/LVLEU05/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../src" -I"../src/config/LVLEU05" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ451_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_LVLEU05=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ451" ${PACK_COMMON_OPTIONS} 
	
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
