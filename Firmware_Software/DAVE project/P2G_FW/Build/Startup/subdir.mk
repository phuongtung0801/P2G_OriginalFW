################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Startup/system_XMC4700.c 

S_UPPER_SRCS += \
../Startup/startup_XMC4700.S 

OBJS += \
./Startup/startup_XMC4700.o \
./Startup/system_XMC4700.o 

S_UPPER_DEPS += \
./Startup/startup_XMC4700.d 

C_DEPS += \
./Startup/system_XMC4700.d 


# Each subdirectory must supply rules for building sources it contributes
Startup/%.o: ../Startup/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC Assembler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -x assembler-with-cpp -DXMC4700_E196x2048 -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Dave/Generated" -Wall -Wa,-adhlns="$@.lst" -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Startup/%.o: ../Startup/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"$(PROJECT_LOC)/BSP/inc" -I"$(PROJECT_LOC)/BSP/Position2Go/inc" -I"$(PROJECT_LOC)/BSP/Components/bgt24mtr1x/inc" -I"$(PROJECT_LOC)/BSP/Components/pga112/inc" -I"$(PROJECT_LOC)/BSP/Components/lmx249x/inc" -I"$(PROJECT_LOC)/Dave/Generated" -I"$(PROJECT_LOC)/Dave/Generated/CMSIS_DSP" -I"$(PROJECT_LOC)/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"$(PROJECT_LOC)/Radar_Control/inc" -I"$(PROJECT_LOC)/Store/inc" -I"$(PROJECT_LOC)/HostCommunication/include" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.

