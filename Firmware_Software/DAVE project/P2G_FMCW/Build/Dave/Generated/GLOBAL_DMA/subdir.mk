################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Dave/Generated/GLOBAL_DMA/global_dma.c \
E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Dave/Generated/GLOBAL_DMA/global_dma_conf.c 

OBJS += \
./Dave/Generated/GLOBAL_DMA/global_dma.o \
./Dave/Generated/GLOBAL_DMA/global_dma_conf.o 

C_DEPS += \
./Dave/Generated/GLOBAL_DMA/global_dma.d \
./Dave/Generated/GLOBAL_DMA/global_dma_conf.d 


# Each subdirectory must supply rules for building sources it contributes
Dave/Generated/GLOBAL_DMA/global_dma.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Dave/Generated/GLOBAL_DMA/global_dma.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.
Dave/Generated/GLOBAL_DMA/global_dma_conf.o: E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE\ project/P2G_FW/Dave/Generated/GLOBAL_DMA/global_dma_conf.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM-GCC C Compiler'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -MMD -MT "$@" -DXMC4700_E196x2048 -DUSE_POSITION2GO_BOARD -I"$(PROJECT_LOC)" -I"$(PROJECT_LOC)/Application/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Position2Go/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/bgt24mtr1x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/pga112/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/BSP/Components/lmx249x/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Dave/Generated/CMSIS_DSP" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/DSP_LIB/inc" -I"$(PROJECT_LOC)/Libraries/XMCLib/inc" -I"$(PROJECT_LOC)/Libraries/CMSIS/Include" -I"$(PROJECT_LOC)/Libraries/CMSIS/Infineon/XMC4700_series/Include" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Radar_Control/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/Store/inc" -I"E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW/HostCommunication/include" -I"$(PROJECT_LOC)/Algorithm/inc" -O3 -ffunction-sections -fdata-sections -Wall -std=gnu99 -mfloat-abi=softfp -Wa,-adhlns="$@.lst" -pipe -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $@" -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mthumb -g -gdwarf-2 -o "$@" "$<" 
	@echo 'Finished building: $<'
	@echo.

