/**
 * @file e_eeprom_xmc4.h
 * @date 2017-02-16
 *
 * NOTE:
 * This file is generated by DAVE. Any manual modification done to this file will be lost when the code is regenerated.
 *
 * @cond
 ***********************************************************************************************************************
 * E_EEPROM_XMC4 v4.0.14 - The E_EEPROM_XMC4 APP is used to Emulate a portion of program flash as EEPROM for permanent
 *                        data storage.
 *
 * Copyright (c) 2016, Infineon Technologies AG
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,are permitted provided that the
 * following conditions are met:
 *
 *   Redistributions of source code must retain the above copyright notice, this list of conditions and the  following
 *   disclaimer.
 *
 *   Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the
 *   following disclaimer in the documentation and/or other materials provided with the distribution.
 *
 *   Neither the name of the copyright holders nor the names of its contributors may be used to endorse or promote
 *   products derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE  FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY,OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * To improve the quality of the software, users are encouraged to share modifications, enhancements or bug fixes
 * with Infineon Technologies AG (dave@infineon.com).
 ***********************************************************************************************************************
 *
 * Change History
 * --------------
 *
 * 2016-01-20
 *     - Initial version
 *
 * 2016-02-05
 *     - XMC_LIB (LLD) version check corrected in header file
 *
 * 2016-07-08:
 *     - Fixed incorrect case for an included header.<br>
 *
 * 2017-02-16:
 *     - E_EEPROM_XMC4_WriteByte() and E_EEPROM_XMC4_WriteArray() returns a boolean indicating if changes were detected since the last write to the same area <BR>
 *
 * @endcond
 *
 */

#ifndef E_EEPROM_XMC4_H
#define E_EEPROM_XMC4_H

/***********************************************************************************************************************
 * HEADER FILES
 **********************************************************************************************************************/

#include "xmc_flash.h"
#include "xmc_fce.h"
#include <DAVE_Common.h>
#include "e_eeprom_xmc4_conf.h"

#if (!((XMC_LIB_MAJOR_VERSION == 2U) && \
       (XMC_LIB_MINOR_VERSION >= 1U) && \
       (XMC_LIB_PATCH_VERSION >= 4U)))
#error "E_EEPROM_XMC4 requires XMC Peripheral Library v2.1.4 or higher"
#endif

/***********************************************************************************************************************
 * MACROS
 **********************************************************************************************************************/



/**********************************************************************************************************************
* ENUMS
**********************************************************************************************************************/

/**
 * @ingroup E_EEPROM_XMC4_enumerations
 * @{
 */

/** Defines the error codes for E_EEPROM_XMC4 application. Use @ref E_EEPROM_XMC4_STATUS_t type for accessing the member.  */
typedef enum E_EEPROM_XMC4_STATUS
{
  E_EEPROM_XMC4_STATUS_OK                 = 0U, /**< Successful completion of initialization */
  E_EEPROM_XMC4_STATUS_ERROR_OLD_DATA     = 1U, /**< Initialization succeeded with old data block. Latest has been found
                                                     corrupted or half programmed in previous power down cycle write. */
  E_EEPROM_XMC4_STATUS_READ_ERROR         = 2U, /**< Initialization failed due to read error */
  E_EEPROM_XMC4_STATUS_WRITE_ERROR        = 3U, /**< Initialization failed due to write error */
  E_EEPROM_XMC4_STATUS_ERASE_ERROR        = 4U, /**< Initialization failed due to erase error */
} E_EEPROM_XMC4_STATUS_t;

/**
 *@}
 */
/**
 * @ingroup E_EEPROM_XMC4_datastructures
 * @{
 */

/**********************************************************************************************************************
* DATA STRUCTURES
**********************************************************************************************************************/
/**
* @brief Initialization data structure of E_EEPROM_XMC4 APP
*/
typedef struct E_EEPROM_XMC4
{
  bool initialized;                           /**< Initialization status */
} E_EEPROM_XMC4_t;
/**
 *@}
 */
/**********************************************************************************************************************
 * API Prototypes
 *********************************************************************************************************************/


#ifdef __cplusplus
extern "C"  {
#endif

/**
 * @ingroup E_EEPROM_XMC4_apidoc
 * @{
 */

/**
 * @brief Get E_EEPROM_XMC4 APP version
 * @return DAVE_APP_VERSION_t APP version information (major, minor and patch number).
 *
 * \par<b>Description: </b><br>
 * The function can be used to check application software compatibility with a
 * specific version of the APP.
 *
 * @code
 * #include <DAVE.h>
 *
 * int main(void)
 * {
 *  DAVE_STATUS_t status;
 *  DAVE_APP_VERSION_t app_version;
 *
 *  status = DAVE_Init();   // E_EEPROM_XMC4_Init() is called from DAVE_Init()
 *
 *  if(status == DAVE_STATUS_SUCCESS)
 *  {
 *    app_version = E_EEPROM_XMC4_GetAppVersion();
 *  }
 *
 *  if (app_version.major != 4U)
 *  {
 *    // Probably, not the right version.
 *  }
 *
 *  while(1U)
 *  {
 *  }
 *
 * }
 * @endcode
 */
DAVE_APP_VERSION_t E_EEPROM_XMC4_GetAppVersion(void);

/**
 * @brief Initializes flash emulated EEPROM to start read and write operations.
 * @param None
 *
 * @return E_EEPROM_XMC4_STATUS_OK, if Initialization succeeds, Else\n
 *         E_EEPROM_XMC4_STATUS_WRITE_ERROR, if initialization failed due to write error.
 *         E_EEPROM_XMC4_STATUS_ERASE_ERROR, if erase failed during initialization process.
 *         E_EEPROM_XMC4_STATUS_ERROR_OLD_DATA, if initialization succeeded with old data block. Latest has been found
 *                                              corrupted or half programmed in previous power down cycle write.
 *
 * \par<b>Description:</b><br>
 * Initializes Flash Emulated EEPROM application.\n
 * It checks for the latest written block starting from logical SECTOR 7 to SECTOR 4. If a latest block is identified
 * among any 4 sectors, the block gets copied to RAM. Hence it can be read any time from RAM. If no blocks identified,
 * SECTOR 4 is considered as current active sector for future writes. \n If more than one SECTOR has data blocks, all
 * sectors apart from the sector having the latest data block are erased. In this process, any flash errors results in
 * "E_EEPROM_XMC4_STATUS_ERASE_ERROR" state.\n  If the sector having the latest block doesn't have any free space, the Init
 * process will copy the latest block into new free sector and erase the old sector. If the copy process results in
 * flash write errors or when all sectors filled up, it returns the status \a E_EEPROM_XMC4_STATUS_WRITE_ERROR.
 *
 * \par<b>Related APIs:</b><BR>
 * None \n
 *
 * \par<b>Example Usage:</b><br>
 * @code
 *   #include <DAVE.h>         //Declarations from DAVE Code Generation (includes SFR declaration)
 *
 *   int main(void)
 *   {
 *     E_EEPROM_XMC4_STATUS_t init_status;
 *
 *     init_status = (E_EEPROM_XMC4_STATUS_t)E_EEPROM_XMC4_Init(&E_EEPROM_XMC4_0); // Initialization of E_EEPROM_XMC4 APP
 *     if (init_status == E_EEPROM_XMC4_STATUS_OK)
 *     {
 *       // Add application code here
 *       while(1)
 *       {
 *       }
 *     }
 *     else
 *     {
 *      XMC_DEBUG("main: Application initialization failed");
 *      while(1)
 *      {
 *      }
 *     }
 *      return (1);
 *  }
 *  @endcode
 */
E_EEPROM_XMC4_STATUS_t E_EEPROM_XMC4_Init(E_EEPROM_XMC4_t *const handle);


/**
 * @brief Update a particular byte in the RAM copy of data block.
 * @param address RAM Offset address, where the data shall be written.
 * @param data    8bit data to be written into the RAM buffer.
 *
 * @return Boolean indicating if changes were detected since the last write to the address
 *
 * \par<b>Description:</b><br>
 * Write a particular byte into the RAM buffer. Sets up the internal RAM buffer with data elements
 * which are targeted to be written into emulated flash area.\n
 *
 *<b>Related APIs : </b><BR>  None\n\n
 *
 *<BR><P ALIGN="LEFT"><B>Example:</B>
 *  @code
 *  #include <DAVE.h>
 *  int main(void)
 *  {
 *    DAVE_STATUS_t status;
 *    uint32_t i;
 *    uint8_t data_buffer[504];
 *
 *    for(i=0;i<504;i++)
 *    {
 *      if (i<256)
 *      {
 *        data_buffer[i] = i;
 *      }
 *      else
 *      {
 *        data_buffer[i] = 0;
 *      }
 *    }
 *
 *    status = DAVE_Init();      // Initialization of DAVE apps
 *
 *    if (status == DAVE_STATUS_SUCCESS)
 *    {
 *      E_EEPROM_XMC4_WriteArray(0U, data_buffer, 504U);
 *      E_EEPROM_XMC4_WriteByte(4U, 0xDD);
 *    }
 *
 *    // Placeholder for user application code. The while loop below can be replaced with user application code.
 *    while(1)
 *    {
 *
 *    }
 *
 *    return 1;
 *  }
 *  @endcode<BR> </p>
 */
bool E_EEPROM_XMC4_WriteByte(const uint16_t offset_address, const uint8_t value);

/**
 * @brief Update a set of bytes in the RAM copy of data block.
 * @param address RAM Offset address from where the data write shall be started.
 * @param data    Constant pointer to array of 8bit data.
 * @param length  Length of the data array (specify the number bytes to be written).
 *
 * @return Boolean indicating if changes were detected since the last write to the same area
 *
 * \par<b>Description:</b><br>
 * Write an array of data elements into the RAM buffer.\n
 *
 *<b>Related APIs : </b><BR>  None\n\n
 *
 *<BR><P ALIGN="LEFT"><B>Example:</B>
 *  @code
 *  #include <DAVE.h>
 *  int main(void)
 *  {
 *    DAVE_STATUS_t status;
 *    uint32_t i;
 *    uint8_t data_buffer[504];
 *
 *    for(i=0;i<504;i++)
 *    {
 *      if (i<256)
 *      {
 *        data_buffer[i] = i;
 *      }
 *      else
 *      {
 *        data_buffer[i] = 0;
 *      }
 *    }
 *
 *    status = DAVE_Init();      // Initialization of DAVE apps
 *
 *    if (status == DAVE_STATUS_SUCCESS)
 *    {
 *      E_EEPROM_XMC4_WriteArray(0U, data_buffer, 504U);
 *    }
 *
 *    // Placeholder for user application code. The while loop below can be replaced with user application code.
 *    while(1)
 *    {
 *
 *    }
 *
 *    return 1;
 *  }
 *  @endcode<BR> </p>
 */
bool E_EEPROM_XMC4_WriteArray(const uint16_t offset_address, const uint8_t *const data, const uint16_t length);

/**
 * @brief Reads a particular byte from the RAM copy of data block.
 * @param address RAM Offset address from where the data read shall be started.
 * @param data    Constant pointer to 8bit data variable (address of variable).
 *
 *
 * @return None
 *
 * \par<b>Description:</b><br>
 * Read a particular byte from the RAM buffer.\n
 *
 *<b>Related APIs : </b><BR>  None\n\n
 *
 *<BR><P ALIGN="LEFT"><B>Example:</B>
 *  @code
 *  #include <DAVE.h>
 *  int main(void)
 *  {
 *    DAVE_STATUS_t status;
 *    uint8_t data = 0U;
 *
 *    status = DAVE_Init();      // Initialization of DAVE apps
 *
 *    if (status == DAVE_STATUS_SUCCESS)
 *    {
 *      E_EEPROM_XMC4_ReadByte(10U, &data);
 *    }
 *
 *    // Placeholder for user application code. The while loop below can be replaced with user application code.
 *    while(1)
 *    {
 *
 *    }
 *
 *    return 1;
 *  }
 *  @endcode<BR> </p>
 */
void E_EEPROM_XMC4_ReadByte(const uint16_t offset_address, uint8_t *const value);

/**
 * @brief Reads a set of bytes from the RAM copy of data block.
 * @param address RAM Offset address from where the data read shall be started.
 * @param data    Constant pointer to array of 8bit data variable.
 * @param length  Length of the data array (specify the number bytes to be read).
 *
 * @return None
 *
 * \par<b>Description:</b><br>
 * Read an array of data elements from the RAM buffer.\n
 *
 * \par<b>Related APIs:</b><BR>
 * None\n
 *
 *<BR><P ALIGN="LEFT"><B>Example:</B>
 *  @code
 *  #include <DAVE.h>
 *  int main(void)
 *  {
 *    DAVE_STATUS_t status;
 *    uint32_t i;
 *    uint8_t data_buffer[504];
 *
 *    for(i=0;i<504;i++)
 *    {
 *        data_buffer[i] = 0;
 *
 *    }
 *
 *    status = DAVE_Init();      // Initialization of DAVE apps
 *
 *    if (status == DAVE_STATUS_SUCCESS)
 *    {
 *      E_EEPROM_XMC4_ReadArray(10U, data_buffer, 50U);
 *    }
 *
 *    // Placeholder for user application code. The while loop below can be replaced with user application code.
 *    while(1)
 *    {
 *
 *    }
 *
 *    return 1;
 *  }
 *  @endcode<BR> </p>
 */
void E_EEPROM_XMC4_ReadArray(const uint16_t offset_address, uint8_t *const data, const uint16_t length);

/**
 * @brief Programs the flash with the latest data block available in RAM.
 * @param None
 *
 * @return E_EEPROM_XMC4_STATUS_OK, if flash programming succeeds, Else\n
 *         E_EEPROM_XMC4_STATUS_WRITE_ERROR, fails due to flash write error or \n
 *         E_EEPROM_XMC4_STATUS_ERASE_ERROR, fails due to flash erase operation when all sectors are filled up.
 *
 * \par<b>Description:</b><br>
 * Programs the RAM buffer into emulated area of the FLASH. On successful completion of this API, the data block
 * gets saved in the flash. Hence data retention is possible over reset cycles. Call this API only in the POWER
 * DOWN cycle to ensure the flash endurance.
 *
 * \par<b>Related APIs:</b><BR>
 * None\n
 *
 *<BR><P ALIGN="LEFT"><B>Example:</B>
 *  @code
 *  #include <DAVE.h>
 *  int main(void)
 *  {
 *    DAVE_STATUS_t status;
 *    E_EEPROM_XMC4_STATUS_t flash_status;
 *    uint32_t i;
 *    uint8_t data_buffer[504];
 *
 *    for(i=0;i<504;i++)
 *    {
 *      if (i<256)
 *      {
 *        data_buffer[i] = i;
 *      }
 *      else
 *      {
 *        data_buffer[i] = 0;
 *      }
 *    }
 *
 *    status = DAVE_Init();      // Initialization of DAVE apps
 *
 *    if (status == DAVE_STATUS_SUCCESS)
 *    {
 *      E_EEPROM_XMC4_WriteArray(0U, data_buffer, 504U);
 *      flash_status = E_EEPROM_XMC4_UpdateFlashContents();
 *    }
 *
 *    // Placeholder for user application code. The while loop below can be replaced with user application code.
 *    while(1)
 *    {
 *
 *    }
 *
 *    return flash_status;
 *  }
 *  @endcode<BR> </p>
 */
E_EEPROM_XMC4_STATUS_t E_EEPROM_XMC4_UpdateFlashContents(void);

/**
 * @brief Check at least one data block is available in the flash emulated EEPROM.
 * @param None
 *
 * @return  <BR>
 *        true, if the flash is empty
 *        else returns false.
 *
 * \par<b>Description:</b><br>
 *  During first time of the execution, flash can be programmed with data by checking this API status.
 *
 * \par<b>Related APIs:</b><BR>
 *  None\n
 *
 *  <BR><P ALIGN="LEFT"><B>Example:</B>
 *  @code
 *  #include <DAVE.h>
 *  int main(void)
 *  {
 *    DAVE_STATUS_t status;
 *    E_EEPROM_XMC4_STATUS_t flash_status;
 *    uint32_t i;
 *    uint8_t data_buffer[504];
 *
 *    for(i=0;i<504;i++)
 *    {
 *      if (i<256)
 *      {
 *        data_buffer[i] = i;
 *      }
 *      else
 *      {
 *        data_buffer[i] = 0;
 *      }
 *    }
 *
 *
 *    status = DAVE_Init();      // Initialization of DAVE apps
 *
 *    if ( status == DAVE_STATUS_SUCCESS)
 *    {
 *     // Check if the flash is empty or not
 *     if(E_EEPROM_XMC4_IsFlashEmpty())
 *     {
 *       E_EEPROM_XMC4_WriteArray(0U, data_buffer, 504U);
 *       flash_status = E_EEPROM_XMC4_UpdateFlashContents();
 *     }
 *     else
 *     {
 *       E_EEPROM_XMC4_ReadArray(10U, data_buffer, 50U);
 *     }
 *    }
 *    while(1)
 *    {}
 *    return flash_status;
 *  }
 *  @endcode<BR> </p>
 */
bool E_EEPROM_XMC4_IsFlashEmpty(void);

/**
 *@}
 */

#ifdef __cplusplus
}
#endif

/* Include APP extern file */
#include "e_eeprom_xmc4_extern.h"

#endif /* E_EEPROM_XMC4_H */

