################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Radar_Control/src/acq_buffer.c \
../Radar_Control/src/radar_adc_xmc.c \
../Radar_Control/src/radar_base.c \
../Radar_Control/src/radar_calibration.c \
../Radar_Control/src/radar_control.c \
../Radar_Control/src/radar_doppler.c \
../Radar_Control/src/radar_fmcw.c \
../Radar_Control/src/radar_industrial.c \
../Radar_Control/src/radar_p2g.c \
../Radar_Control/src/radar_target_detection.c 

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
Radar_Control/src/%.o: ../Radar_Control/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"$(PROJECT_LOC)/BSP/inc" -I"$(PROJECT_LOC)/BSP/Position2Go/inc" -I"$(PROJECT_LOC)/BSP/Components/bgt24mtr1x/inc" -I"$(PROJECT_LOC)/BSP/Components/pga112/inc" -I"$(PROJECT_LOC)/BSP/Components/lmx249x/inc" -I"$(PROJECT_LOC)/Dave/Generated" -I"$(PROJECT_LOC)/Dave/Generated/CMSIS_DSP" -I"$(PROJECT_LOC)/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"$(PROJECT_LOC)/Radar_Control/inc" -I"$(PROJECT_LOC)/Store/inc" -I"$(PROJECT_LOC)/HostCommunication/include" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.

