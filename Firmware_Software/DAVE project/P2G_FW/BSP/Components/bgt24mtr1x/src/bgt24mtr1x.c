/**
    @file: bgt24mtr1x.c

    @brief: This file provides the BGT24MTR12 – 24GHz Radar IC low level driver.
	    It contains a set of functions to configure and use BGT24MTR12 Radar device.
*/

/* ===========================================================================
** Copyright (C) 2018-2019 Infineon Technologies AG
** All rights reserved.
** ===========================================================================
**
** ===========================================================================
** This document contains proprietary information of Infineon Technologies AG.
** Passing on and copying of this document, and communication of its contents
** is not permitted without Infineon's prior written authorization.
** ===========================================================================
*/

/*
==============================================================================
   1. INCLUDE FILES
==============================================================================
 */

#include "bgt24mtr1x.h"

/*
==============================================================================
   2. DATA
==============================================================================
 */

static volatile uint16_t bgt24mtr1x_ana_command = BGT24MTR1X_ANA_CMD_TX_POWER_REF; /**< Current index of the ANA output Command */

static volatile uint16_t bgt24mtr1x_global_config = BGT24MTR1X_BASE_CONF; /**< Current BGT24MTR1x configuration */

static SPI_DIGITAL_IOs_t bgt24mtr1x_spi_pins; /**< SPI GPIOs used to configure BGT24MTR1x device */

/*
==============================================================================
   3. EXPORTED FUNCTIONS
==============================================================================
 */

void bgt24mtr1x_init(Bgt24mtr1x_LNAgain_t lna_gain, Bgt24mtr1x_Power_t power_level)
{
  bgt24mtr1x_global_config = BGT24MTR1X_BASE_CONF;
  
  /* Set the digital IOs used by SPI interface */
  bgt24mtr1x_spi_pins.spi_device    = BGT_DEVICE;
  bgt24mtr1x_spi_pins.gpio_cs_pin 	= (DIGITAL_IO_t*)&DIGITAL_IO_SPI_M_CS_BGT24;
  bgt24mtr1x_spi_pins.gpio_data_pin = (DIGITAL_IO_t*)&DIGITAL_IO_SPI_M_DATA;
  bgt24mtr1x_spi_pins.gpio_clk_pin 	= (DIGITAL_IO_t*)&DIGITAL_IO_SPI_M_CLK;
  
  if (lna_gain)
  {
    bgt24mtr1x_global_config &= BGT24MTR1X_ENA_LNA_MASK;
  }
  else
  {
    bgt24mtr1x_global_config |= BGT24MTR1X_DIS_LNA_MASK;
  }
  
  /* Configure BGT24MTR1x */
  bgt24mtr1x_set_tx_power(power_level);
  
  bgt24mtr1x_ana_vref_tx();
}

//============================================================================

void bgt24mtr1x_start_tx(void)
{
  bgt24mtr1x_global_config &= BGT24MTR1X_ENA_PA_MASK;
  bgt24mtr1x_set_config(bgt24mtr1x_global_config);
}

//============================================================================

void bgt24mtr1x_stop_tx(void)
{
  bgt24mtr1x_global_config |= BGT24MTR1X_DIS_PA_MASK;
  bgt24mtr1x_set_config(bgt24mtr1x_global_config);
}

//============================================================================

void bgt24mtr1x_power_up(void)
{
  /* After turning on BGT, then We should keep CE pin high.
   * CE pin is active low, so it should keep high until it is activated.
   */
  DIGITAL_IO_SetOutputHigh(&DIGITAL_IO_SPI_M_CS_BGT24);
  DIGITAL_IO_SetOutputLow(&DIGITAL_IO_BGT_POWER_ENABLE);
}

//============================================================================

void bgt24mtr1x_power_down(void)
{
  /* Before turning off BGT, we should keep SPI's signals low
  * to avoid offset voltage at BGT's VCC.
  *
  * If they are above 0.3V which is bias voltage inside BGT, then inside BGT turns on.
  * It makes offset voltage at BGT's VCC.
  */
  DIGITAL_IO_SetOutputLow(&DIGITAL_IO_SPI_M_CS_BGT24);
  DIGITAL_IO_SetOutputHigh(&DIGITAL_IO_BGT_POWER_ENABLE);
}

//============================================================================

void bgt24mtr1x_set_tx_power(Bgt24mtr1x_Power_t power_level)
{
  /* Clear the last 3-bits */
  bgt24mtr1x_global_config &= 0xFFF8;
  
  switch (power_level)
  {
  case BGT24MTR1X_TX_MIN:
    /* Reduction by 9dBm */
    bgt24mtr1x_global_config |= BGT24MTR1X_PC_PA_7;
    break;
    
  case BGT24MTR1X_TX_LEVEL_1:
    /* Reduction by 6dBm */
    bgt24mtr1x_global_config |= BGT24MTR1X_PC_PA_6;
    break;
    
  case BGT24MTR1X_TX_LEVEL_2:
    /* Reduction by 4dBm */
    bgt24mtr1x_global_config |= BGT24MTR1X_PC_PA_5;
    break;
    
  case BGT24MTR1X_TX_MID:
    /* Reduction by 2.5dBm */
    bgt24mtr1x_global_config |= BGT24MTR1X_PC_PA_4;
    break;
    
  case BGT24MTR1X_TX_LEVEL_4:
    /* Reduction by 1.4dBm */
    bgt24mtr1x_global_config |= BGT24MTR1X_PC_PA_3;
    break;
    
  case BGT24MTR1X_TX_LEVEL_5:
    /* Reduction by 0.8dBm */
    bgt24mtr1x_global_config |= BGT24MTR1X_PC_PA_2;
    break;
    
  case BGT24MTR1X_TX_LEVEL_6:
    /* Reduction by 0.4dBm */
    bgt24mtr1x_global_config |= BGT24MTR1X_PC_PA_1;
    break;
    
  case BGT24MTR1X_TX_MAX:
  default:
    /* TX on with maximum power */
    bgt24mtr1x_global_config |= BGT24MTR1X_PC_PA_0;
  }
  
  bgt24mtr1x_ana_vout_tx();
}

//============================================================================

uint8_t bgt24mtr1x_get_tx_power(void)
{
  /* lower byte contains the Tx power levels info */
  return (uint8_t)(bgt24mtr1x_global_config & 0x07);
}

//============================================================================

void bgt24mtr1x_lna_gain_enable(void)
{
  bgt24mtr1x_global_config &= BGT24MTR1X_ENA_LNA_MASK;
}

//============================================================================

void bgt24mtr1x_lna_gain_disable(void)
{
  bgt24mtr1x_global_config |= BGT24MTR1X_DIS_LNA_MASK;
}

//============================================================================

uint8_t bgt24mtr1x_lna_gain_is_enable(void)
{
  return (uint8_t)((bgt24mtr1x_global_config & BGT24MTR1X_DIS_LNA_MASK) == 0 ? true : false);
}

//============================================================================

void bgt24mtr1x_set_config(uint16_t config_val)
{
  uint16_t shuffled_data = 0;
  
  /* Lower byte goes to upper byte position */
  shuffled_data  = (config_val << 8);
  
  /* Upper byte goes to lower byte position */
  shuffled_data |= (config_val >> 8);
  
  /* Transmit configuration data to BGT24MTR1x through SPI protocol */
  spi_transmit_data((uint8_t *)&shuffled_data , 2U, (void*) &bgt24mtr1x_spi_pins);
}

//============================================================================

uint16_t bgt24mtr1x_get_config(void)
{
  return (bgt24mtr1x_global_config);
}

//============================================================================

void bgt24mtr1x_ana_temp(void)
{
  bgt24mtr1x_ana_command = BGT24MTR1X_ANA_CMD_TEMPERATURE;
  
  bgt24mtr1x_global_config &= BGT24MTR1X_AMUX_VOUT_TX;
  
  bgt24mtr1x_global_config |= BGT24MTR1X_AMUX_2;
}

//============================================================================

void bgt24mtr1x_ana_vout_tx(void)
{
  bgt24mtr1x_ana_command = BGT24MTR1X_ANA_CMD_TX_POWER;
  
  bgt24mtr1x_global_config &= BGT24MTR1X_AMUX_VOUT_TX;
}

//============================================================================

void bgt24mtr1x_ana_vref_tx(void)
{
  bgt24mtr1x_ana_command = BGT24MTR1X_ANA_CMD_TX_POWER_REF;
  
  bgt24mtr1x_global_config &= BGT24MTR1X_AMUX_VOUT_TX;
  
  bgt24mtr1x_global_config |= BGT24MTR1X_AMUX_0;
}

//============================================================================

uint16_t bgt24mtr1x_get_ana_config(void)
{
  return (bgt24mtr1x_ana_command);
}

//============================================================================

void bgt24mtr1x_lowest_power_with_q2_disable(void)
{
  bgt24mtr1x_set_config((uint16_t)BGT24MTR1X_POWER_CONF);
}

/* --- End of File -------------------------------------------------------- */
