################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/position2go_bgt.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/position2go_bsp.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/position2go_pga.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/position2go_pll.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/position2go_spi.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/stream_interface_usb.c 

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
BSP/Position2Go/src/position2go_bgt.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/position2go_bgt.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
BSP/Position2Go/src/position2go_bsp.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/position2go_bsp.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
BSP/Position2Go/src/position2go_pga.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/position2go_pga.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
BSP/Position2Go/src/position2go_pll.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/position2go_pll.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
BSP/Position2Go/src/position2go_spi.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/position2go_spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
BSP/Position2Go/src/stream_interface_usb.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/BSP/Position2Go/src/stream_interface_usb.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.

