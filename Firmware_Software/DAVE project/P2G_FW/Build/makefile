################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Store/src/subdir.mk
-include Startup/subdir.mk
-include Radar_Control/src/subdir.mk
-include Libraries/XMCLib/src/subdir.mk
-include Libraries/Newlib/subdir.mk
-include HostCommunication/src/subdir.mk
-include Dave/Generated/USBD_VCOM/virtual_com/subdir.mk
-include Dave/Generated/USBD_VCOM/class_driver/device/subdir.mk
-include Dave/Generated/USBD_VCOM/subdir.mk
-include Dave/Generated/USBD/usb/core/xmc4000/subdir.mk
-include Dave/Generated/USBD/usb/core/subdir.mk
-include Dave/Generated/USBD/subdir.mk
-include Dave/Generated/TIMER/subdir.mk
-include Dave/Generated/SYSTIMER/subdir.mk
-include Dave/Generated/INTERRUPT/subdir.mk
-include Dave/Generated/GLOBAL_DMA/subdir.mk
-include Dave/Generated/GLOBAL_CCU8/subdir.mk
-include Dave/Generated/GLOBAL_CCU4/subdir.mk
-include Dave/Generated/GLOBAL_ADC/subdir.mk
-include Dave/Generated/E_EEPROM_XMC4/subdir.mk
-include Dave/Generated/EVENT_GENERATOR/subdir.mk
-include Dave/Generated/EVENT_DETECTOR/subdir.mk
-include Dave/Generated/DMA_CH/subdir.mk
-include Dave/Generated/DIGITAL_IO/subdir.mk
-include Dave/Generated/CPU_CTRL_XMC4/subdir.mk
-include Dave/Generated/CMSIS_DSP/TransformFunctions/subdir.mk
-include Dave/Generated/CMSIS_DSP/SupportFunctions/subdir.mk
-include Dave/Generated/CMSIS_DSP/StatisticsFunctions/subdir.mk
-include Dave/Generated/CMSIS_DSP/MatrixFunctions/subdir.mk
-include Dave/Generated/CMSIS_DSP/FilteringFunctions/subdir.mk
-include Dave/Generated/CMSIS_DSP/FastMathFunctions/subdir.mk
-include Dave/Generated/CMSIS_DSP/ControllerFunctions/subdir.mk
-include Dave/Generated/CMSIS_DSP/ComplexMathFunctions/subdir.mk
-include Dave/Generated/CMSIS_DSP/CommonTables/subdir.mk
-include Dave/Generated/CMSIS_DSP/BasicMathFunctions/subdir.mk
-include Dave/Generated/CMSIS_DSP/subdir.mk
-include Dave/Generated/CLOCK_XMC4/subdir.mk
-include Dave/Generated/CCU4_SLICE_CONFIG/subdir.mk
-include Dave/Generated/ADC_MEASUREMENT_ADV/subdir.mk
-include Dave/Generated/subdir.mk
-include DSP_LIB/src/subdir.mk
-include BSP/Position2Go/src/subdir.mk
-include BSP/Components/pga112/src/subdir.mk
-include BSP/Components/lmx249x/src/subdir.mk
-include BSP/Components/bgt24mtr1x/src/subdir.mk
-include Application/src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
P2G_FW.hex \

SECONDARY_LIST += \
P2G_FW.lst \

SECONDARY_SIZE += \
P2G_FW.siz \


LIST_FILES = $(addsuffix .o.lst, $(basename $(OBJS))) 
MAP_FILE = "P2G_FW.map"

TOOLCHAIN_ROOT=C:/Infineon/Tools/DAVE IDE/4.5.0.202105191637/eclipse/ARM-GCC-49
PROJECT_LOC=E:/NOVA/Assets/IFX_P2G-HW-SW_V1.0.4/Firmware_Software/DAVE project/P2G_FW

# All Target
all: P2G_FW.elf secondary-outputs

# Tool invocations
P2G_FW.elf: $(OBJS) ../linker_script.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM-GCC C Linker'
	$(file >objects.rsp,$(OBJS))
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-gcc" -T"../linker_script.ld" -nostartfiles -Xlinker --gc-sections -specs=nano.specs -specs=nosys.specs -Wl,-Map,$(MAP_FILE) -mfloat-abi=softfp -mfpu=fpv4-sp-d16 -mcpu=cortex-m4 -mthumb -g -gdwarf-2 -o "P2G_FW.elf" "@objects.rsp" $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo.
P2G_FW.hex: P2G_FW.elf
	@echo 'Invoking: ARM-GCC Create Flash Image'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-objcopy" -O ihex "P2G_FW.elf" "P2G_FW.hex"
	@echo 'Finished building: $@'
	@echo.
P2G_FW.lst: P2G_FW.elf
	@echo 'Invoking: ARM-GCC Create Listing'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-objdump" -h -S "P2G_FW.elf" > "P2G_FW.lst"
	@echo 'Finished building: $@'
	@echo.
P2G_FW.siz: P2G_FW.elf
	@echo 'Invoking: ARM-GCC Print Size'
	"$(TOOLCHAIN_ROOT)/bin/arm-none-eabi-size" --format=berkeley "P2G_FW.elf"
	@echo 'Finished building: $@'
	@echo.
# Other Targets
clean:
	-$(RM) $(SECONDARY_FLASH)$(SECONDARY_LIST)$(SECONDARY_SIZE)$(ARM_GCC_FOR_XMC_LINKER_OUTPUT_TYPE_OUTPUTS)$(S_DEPS)$(S_UPPER_DEPS)$(C_DEPS)
	-$(RM) Application/src/application.o BSP/Components/bgt24mtr1x/src/bgt24mtr1x.o BSP/Components/lmx249x/src/lmx249x.o BSP/Components/pga112/src/pga112.o BSP/Position2Go/src/position2go_bgt.o BSP/Position2Go/src/position2go_bsp.o BSP/Position2Go/src/position2go_pga.o BSP/Position2Go/src/position2go_pll.o BSP/Position2Go/src/position2go_spi.o BSP/Position2Go/src/stream_interface_usb.o DSP_LIB/src/dsp_lib.o Dave/Generated/ADC_MEASUREMENT_ADV/adc_measurement_adv.o Dave/Generated/ADC_MEASUREMENT_ADV/adc_measurement_adv_conf.o Dave/Generated/CCU4_SLICE_CONFIG/ccu4_slice_config.o Dave/Generated/CCU4_SLICE_CONFIG/ccu4_slice_config_conf.o Dave/Generated/CLOCK_XMC4/clock_xmc4.o Dave/Generated/CLOCK_XMC4/clock_xmc4_conf.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_abs_f32.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_abs_q15.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_abs_q31.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_abs_q7.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_add_f32.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_add_q15.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_add_q31.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_add_q7.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_dot_prod_f32.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_dot_prod_q15.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_dot_prod_q31.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_dot_prod_q7.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_mult_f32.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_mult_q15.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_mult_q31.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_mult_q7.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_negate_f32.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_negate_q15.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_negate_q31.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_negate_q7.o 
	-$(RM) Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_offset_f32.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_offset_q15.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_offset_q31.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_offset_q7.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_scale_f32.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_scale_q15.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_scale_q31.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_scale_q7.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_shift_q15.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_shift_q31.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_shift_q7.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_sub_f32.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_sub_q15.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_sub_q31.o Dave/Generated/CMSIS_DSP/BasicMathFunctions/arm_sub_q7.o Dave/Generated/CMSIS_DSP/CommonTables/arm_common_tables.o Dave/Generated/CMSIS_DSP/CommonTables/arm_const_structs.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_conj_f32.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_conj_q15.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_conj_q31.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_dot_prod_f32.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_dot_prod_q15.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_dot_prod_q31.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mag_f32.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mag_q15.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mag_q31.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mag_squared_f32.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mag_squared_q15.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mag_squared_q31.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.o 
	-$(RM) Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mult_real_f32.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mult_real_q15.o Dave/Generated/CMSIS_DSP/ComplexMathFunctions/arm_cmplx_mult_real_q31.o Dave/Generated/CMSIS_DSP/ControllerFunctions/arm_pid_init_f32.o Dave/Generated/CMSIS_DSP/ControllerFunctions/arm_pid_init_q15.o Dave/Generated/CMSIS_DSP/ControllerFunctions/arm_pid_init_q31.o Dave/Generated/CMSIS_DSP/ControllerFunctions/arm_pid_reset_f32.o Dave/Generated/CMSIS_DSP/ControllerFunctions/arm_pid_reset_q15.o Dave/Generated/CMSIS_DSP/ControllerFunctions/arm_pid_reset_q31.o Dave/Generated/CMSIS_DSP/ControllerFunctions/arm_sin_cos_f32.o Dave/Generated/CMSIS_DSP/ControllerFunctions/arm_sin_cos_q31.o Dave/Generated/CMSIS_DSP/FastMathFunctions/arm_cos_f32.o Dave/Generated/CMSIS_DSP/FastMathFunctions/arm_cos_q15.o Dave/Generated/CMSIS_DSP/FastMathFunctions/arm_cos_q31.o Dave/Generated/CMSIS_DSP/FastMathFunctions/arm_sin_f32.o Dave/Generated/CMSIS_DSP/FastMathFunctions/arm_sin_q15.o Dave/Generated/CMSIS_DSP/FastMathFunctions/arm_sin_q31.o Dave/Generated/CMSIS_DSP/FastMathFunctions/arm_sqrt_q15.o Dave/Generated/CMSIS_DSP/FastMathFunctions/arm_sqrt_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df1_32x64_init_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df1_32x64_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df1_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df1_fast_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df1_fast_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df1_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df1_init_q15.o 
	-$(RM) Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df1_init_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df1_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df1_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df2T_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df2T_f64.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df2T_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_df2T_init_f64.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_stereo_df2T_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_biquad_cascade_stereo_df2T_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_fast_opt_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_fast_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_fast_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_opt_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_opt_q7.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_partial_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_partial_fast_opt_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_partial_fast_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_partial_fast_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_partial_opt_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_partial_opt_q7.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_partial_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_partial_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_partial_q7.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_conv_q7.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_correlate_f32.o 
	-$(RM) Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_correlate_fast_opt_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_correlate_fast_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_correlate_fast_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_correlate_opt_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_correlate_opt_q7.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_correlate_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_correlate_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_correlate_q7.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_decimate_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_decimate_fast_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_decimate_fast_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_decimate_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_decimate_init_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_decimate_init_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_decimate_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_decimate_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_fast_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_fast_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_init_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_init_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_init_q7.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_interpolate_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_interpolate_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_interpolate_init_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_interpolate_init_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_interpolate_q15.o 
	-$(RM) Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_interpolate_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_lattice_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_lattice_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_lattice_init_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_lattice_init_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_lattice_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_lattice_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_q7.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_sparse_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_sparse_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_sparse_init_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_sparse_init_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_sparse_init_q7.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_sparse_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_sparse_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_fir_sparse_q7.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_iir_lattice_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_iir_lattice_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_iir_lattice_init_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_iir_lattice_init_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_iir_lattice_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_iir_lattice_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_init_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_init_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_norm_f32.o 
	-$(RM) Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_norm_init_f32.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_norm_init_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_norm_init_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_norm_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_norm_q31.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_q15.o Dave/Generated/CMSIS_DSP/FilteringFunctions/arm_lms_q31.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_add_f32.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_add_q15.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_add_q31.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_cmplx_mult_f32.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_cmplx_mult_q15.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_cmplx_mult_q31.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_init_f32.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_init_q15.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_init_q31.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_inverse_f32.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_inverse_f64.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_mult_f32.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_mult_fast_q15.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_mult_fast_q31.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_mult_q15.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_mult_q31.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_scale_f32.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_scale_q15.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_scale_q31.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_sub_f32.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_sub_q15.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_sub_q31.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_trans_f32.o Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_trans_q15.o 
	-$(RM) Dave/Generated/CMSIS_DSP/MatrixFunctions/arm_mat_trans_q31.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_max_f32.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_max_q15.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_max_q31.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_max_q7.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_mean_f32.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_mean_q15.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_mean_q31.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_mean_q7.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_min_f32.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_min_q15.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_min_q31.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_min_q7.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_power_f32.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_power_q15.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_power_q31.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_power_q7.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_rms_f32.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_rms_q15.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_rms_q31.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_std_f32.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_std_q15.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_std_q31.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_var_f32.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_var_q15.o Dave/Generated/CMSIS_DSP/StatisticsFunctions/arm_var_q31.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_copy_f32.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_copy_q15.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_copy_q31.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_copy_q7.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_fill_f32.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_fill_q15.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_fill_q31.o 
	-$(RM) Dave/Generated/CMSIS_DSP/SupportFunctions/arm_fill_q7.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_float_to_q15.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_float_to_q31.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_float_to_q7.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_q15_to_float.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_q15_to_q31.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_q15_to_q7.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_q31_to_float.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_q31_to_q15.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_q31_to_q7.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_q7_to_float.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_q7_to_q15.o Dave/Generated/CMSIS_DSP/SupportFunctions/arm_q7_to_q31.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_bitreversal.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_bitreversal2.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_q15.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_q31.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix2_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix2_init_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix2_init_q15.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix2_init_q31.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix2_q15.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix2_q31.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix4_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix4_init_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix4_init_q15.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix4_init_q31.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix4_q15.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix4_q31.o 
	-$(RM) Dave/Generated/CMSIS_DSP/TransformFunctions/arm_cfft_radix8_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_dct4_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_dct4_init_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_dct4_init_q15.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_dct4_init_q31.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_dct4_q15.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_dct4_q31.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_rfft_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_rfft_fast_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_rfft_fast_init_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_rfft_init_f32.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_rfft_init_q15.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_rfft_init_q31.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_rfft_q15.o Dave/Generated/CMSIS_DSP/TransformFunctions/arm_rfft_q31.o Dave/Generated/CMSIS_DSP/cmsis_dsp.o Dave/Generated/CPU_CTRL_XMC4/cpu_ctrl_xmc4.o Dave/Generated/CPU_CTRL_XMC4/cpu_ctrl_xmc4_conf.o Dave/Generated/DAVE.o Dave/Generated/DIGITAL_IO/digital_io.o Dave/Generated/DIGITAL_IO/digital_io_conf.o Dave/Generated/DMA_CH/dma_ch.o Dave/Generated/DMA_CH/dma_ch_conf.o Dave/Generated/EVENT_DETECTOR/event_detector.o Dave/Generated/EVENT_DETECTOR/event_detector_conf.o Dave/Generated/EVENT_GENERATOR/event_generator.o Dave/Generated/EVENT_GENERATOR/event_generator_conf.o Dave/Generated/E_EEPROM_XMC4/e_eeprom_xmc4.o Dave/Generated/E_EEPROM_XMC4/e_eeprom_xmc4_conf.o Dave/Generated/GLOBAL_ADC/global_adc.o Dave/Generated/GLOBAL_ADC/global_adc_conf.o Dave/Generated/GLOBAL_CCU4/global_ccu4.o Dave/Generated/GLOBAL_CCU4/global_ccu4_conf.o Dave/Generated/GLOBAL_CCU8/global_ccu8.o Dave/Generated/GLOBAL_CCU8/global_ccu8_conf.o Dave/Generated/GLOBAL_DMA/global_dma.o Dave/Generated/GLOBAL_DMA/global_dma_conf.o Dave/Generated/INTERRUPT/interrupt.o 
	-$(RM) Dave/Generated/INTERRUPT/interrupt_conf.o Dave/Generated/SYSTIMER/systimer.o Dave/Generated/SYSTIMER/systimer_conf.o Dave/Generated/TIMER/timer.o Dave/Generated/TIMER/timer_conf.o Dave/Generated/USBD/usb/core/usb_task.o Dave/Generated/USBD/usb/core/xmc4000/usbd_endpoint_stream_xmc4000.o Dave/Generated/USBD/usb/core/xmc4000/usbd_endpoint_xmc4000.o Dave/Generated/USBD/usbd.o Dave/Generated/USBD/usbd_conf.o Dave/Generated/USBD_VCOM/class_driver/device/cdc_class_device.o Dave/Generated/USBD_VCOM/usbd_vcom.o Dave/Generated/USBD_VCOM/usbd_vcom_conf.o Dave/Generated/USBD_VCOM/virtual_com/descriptors.o HostCommunication/src/EndpointCalibration.o HostCommunication/src/EndpointRadarADCXMC.o HostCommunication/src/EndpointRadarBase.o HostCommunication/src/EndpointRadarDoppler.o HostCommunication/src/EndpointRadarFMCW.o HostCommunication/src/EndpointRadarIndustrial.o HostCommunication/src/EndpointRadarP2G.o HostCommunication/src/EndpointTargetDetection.o HostCommunication/src/Protocol.o Libraries/Newlib/syscalls.o Libraries/XMCLib/src/xmc4_eru.o Libraries/XMCLib/src/xmc4_flash.o Libraries/XMCLib/src/xmc4_gpio.o Libraries/XMCLib/src/xmc4_rtc.o Libraries/XMCLib/src/xmc4_scu.o Libraries/XMCLib/src/xmc_can.o Libraries/XMCLib/src/xmc_ccu4.o Libraries/XMCLib/src/xmc_ccu8.o Libraries/XMCLib/src/xmc_common.o Libraries/XMCLib/src/xmc_dac.o Libraries/XMCLib/src/xmc_dma.o Libraries/XMCLib/src/xmc_dsd.o Libraries/XMCLib/src/xmc_ebu.o Libraries/XMCLib/src/xmc_ecat.o Libraries/XMCLib/src/xmc_eru.o Libraries/XMCLib/src/xmc_eth_mac.o Libraries/XMCLib/src/xmc_eth_phy_dp83848.o Libraries/XMCLib/src/xmc_eth_phy_ksz8031rnl.o Libraries/XMCLib/src/xmc_eth_phy_ksz8081rnb.o Libraries/XMCLib/src/xmc_fce.o Libraries/XMCLib/src/xmc_gpio.o Libraries/XMCLib/src/xmc_hrpwm.o Libraries/XMCLib/src/xmc_i2c.o Libraries/XMCLib/src/xmc_i2s.o Libraries/XMCLib/src/xmc_ledts.o Libraries/XMCLib/src/xmc_posif.o Libraries/XMCLib/src/xmc_rtc.o 
	-$(RM) Libraries/XMCLib/src/xmc_sdmmc.o Libraries/XMCLib/src/xmc_spi.o Libraries/XMCLib/src/xmc_uart.o Libraries/XMCLib/src/xmc_usbd.o Libraries/XMCLib/src/xmc_usbh.o Libraries/XMCLib/src/xmc_usic.o Libraries/XMCLib/src/xmc_vadc.o Libraries/XMCLib/src/xmc_wdt.o Radar_Control/src/acq_buffer.o Radar_Control/src/radar_adc_xmc.o Radar_Control/src/radar_base.o Radar_Control/src/radar_calibration.o Radar_Control/src/radar_control.o Radar_Control/src/radar_doppler.o Radar_Control/src/radar_fmcw.o Radar_Control/src/radar_industrial.o Radar_Control/src/radar_p2g.o Radar_Control/src/radar_target_detection.o Startup/startup_XMC4700.o Startup/system_XMC4700.o Store/src/datastore.o Store/src/ds_radar_interface.o main.o  P2G_FW.elf $(LIST_FILES) $(MAP_FILE) objects.rsp
	-@echo.
secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_LIST) $(SECONDARY_SIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
