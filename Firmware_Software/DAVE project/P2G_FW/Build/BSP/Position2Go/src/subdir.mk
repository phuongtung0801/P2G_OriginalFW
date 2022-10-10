################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../BSP/Position2Go/src/position2go_bgt.c \
../BSP/Position2Go/src/position2go_bsp.c \
../BSP/Position2Go/src/position2go_pga.c \
../BSP/Position2Go/src/position2go_pll.c \
../BSP/Position2Go/src/position2go_spi.c \
../BSP/Position2Go/src/stream_interface_usb.c 

OBJS += \
./BSP/Position2Go/src/position2go_bgt.o \
./BSP/Position2Go/src/position2go_bsp.o \
./BSP/Position2Go/src/position2go_pga.o \
./BSP/Position2Go/src/position2go_pll.o \
./BSP/Position2Go/src/position2go_spi.o \
./BSP/Position2Go/src/stream_interface_usb.o 

C_DEPS += \
./BSP/Position2Go/src/position2go_bgt.d \
./BSP/Position2Go/src/position2go_bsp.d \
./BSP/Position2Go/src/position2go_pga.d \
./BSP/Position2Go/src/position2go_pll.d \
./BSP/Position2Go/src/position2go_spi.d \
./BSP/Position2Go/src/stream_interface_usb.d 


# Each subdirectory must supply rules for building sources it contributes
BSP/Position2Go/src/%.o: ../BSP/Position2Go/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"$(PROJECT_LOC)/BSP/inc" -I"$(PROJECT_LOC)/BSP/Position2Go/inc" -I"$(PROJECT_LOC)/BSP/Components/bgt24mtr1x/inc" -I"$(PROJECT_LOC)/BSP/Components/pga112/inc" -I"$(PROJECT_LOC)/BSP/Components/lmx249x/inc" -I"$(PROJECT_LOC)/Dave/Generated" -I"$(PROJECT_LOC)/Dave/Generated/CMSIS_DSP" -I"$(PROJECT_LOC)/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"$(PROJECT_LOC)/Radar_Control/inc" -I"$(PROJECT_LOC)/Store/inc" -I"$(PROJECT_LOC)/HostCommunication/include" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.

