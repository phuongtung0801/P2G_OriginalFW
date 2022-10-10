################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/acq_buffer.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_adc_xmc.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_base.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_calibration.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_control.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_doppler.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_fmcw.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_industrial.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_p2g.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_target_detection.c 

OBJS += \
./Radar_Control/src/acq_buffer.o \
./Radar_Control/src/radar_adc_xmc.o \
./Radar_Control/src/radar_base.o \
./Radar_Control/src/radar_calibration.o \
./Radar_Control/src/radar_control.o \
./Radar_Control/src/radar_doppler.o \
./Radar_Control/src/radar_fmcw.o \
./Radar_Control/src/radar_industrial.o \
./Radar_Control/src/radar_p2g.o \
./Radar_Control/src/radar_target_detection.o 

C_DEPS += \
./Radar_Control/src/acq_buffer.d \
./Radar_Control/src/radar_adc_xmc.d \
./Radar_Control/src/radar_base.d \
./Radar_Control/src/radar_calibration.d \
./Radar_Control/src/radar_control.d \
./Radar_Control/src/radar_doppler.d \
./Radar_Control/src/radar_fmcw.d \
./Radar_Control/src/radar_industrial.d \
./Radar_Control/src/radar_p2g.d \
./Radar_Control/src/radar_target_detection.d 


# Each subdirectory must supply rules for building sources it contributes
Radar_Control/src/acq_buffer.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/acq_buffer.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Radar_Control/src/radar_adc_xmc.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_adc_xmc.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Radar_Control/src/radar_base.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_base.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Radar_Control/src/radar_calibration.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_calibration.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Radar_Control/src/radar_control.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_control.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Radar_Control/src/radar_doppler.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_doppler.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Radar_Control/src/radar_fmcw.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_fmcw.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Radar_Control/src/radar_industrial.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_industrial.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Radar_Control/src/radar_p2g.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_p2g.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Radar_Control/src/radar_target_detection.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Radar_Control/src/radar_target_detection.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
