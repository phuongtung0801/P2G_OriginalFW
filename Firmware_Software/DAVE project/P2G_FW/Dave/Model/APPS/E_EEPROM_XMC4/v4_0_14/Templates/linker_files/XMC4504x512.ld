/**
 * @file XMC4504x512.ld
 * @date 2016-03-08
 *
 * @cond
 *********************************************************************************************************************
 * Linker file for the GNU C Compiler v1.7
 * Supported devices: XMC4504-F144x512
 *                    XMC4504-F100x512
 *
 * Copyright (c) 2015-2016, Infineon Technologies AG
 * All rights reserved.                        
 *                                             
 * Redistribution and use in source and binary forms, with or without modification,are permitted provided that the 
 * following conditions are met:   
 *                                                                              
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following 
 * disclaimer.                        
 * 
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following 
 * disclaimer in the documentation and/or other materials provided with the distribution.                       
 * 
 * Neither the name of the copyright holders nor the names of its contributors may be used to endorse or promote 
 * products derived from this software without specific prior written permission.                                           
 *                                                                              
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE  
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE  FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR  
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
 * WHETHER IN CONTRACT, STRICT LIABILITY,OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                                                  
 *                                                                              
 * To improve the quality of the software, users are encouraged to share modifications, enhancements or bug fixes with 
 * Infineon Technologies AG dave@infineon.com).                                                          
 *********************************************************************************************************************
 *
 * Change History
 * --------------
 *
 * 2015-07-07:
 *     - Product splitting
 *     - Copyright notice update
 *      
 * 2015-08-26:
 *     - Fix error on not existing DSRAM2
 *
 * 2015-11-24:
 *     - Compatibility with GCC 4.9 2015q2
 *
 * 2016-03-08:
 *     - Fix size of BSS and DATA sections to be multiple of 4
 *     - Add assertion to check that region DSRAM_1_system does not overflowed no_init section 
 *      
 * @endcond 
 *
 */

OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(Reset_Handler)

MEMORY
{
    FLASH_0_cached(RX) : ORIGIN = 0x08000000, LENGTH = 0x010000
    FLASH_0_uncached(RX) : ORIGIN = 0x0C000000, LENGTH = 0x010000
    FLASH_1_cached(RX) : ORIGIN = 0x08020000, LENGTH = 0x60000
    FLASH_1_uncached(RX) : ORIGIN = 0x0C020000, LENGTH = 0x60000
    PSRAM_1(!RX) : ORIGIN = 0x10000000, LENGTH = 0x10000
    DSRAM_1_system(!RX) : ORIGIN = 0x20000000, LENGTH = 0x10000
}

stack_size = DEFINED(stack_size) ? stack_size : 2048;
no_init_size = 64;

SECTIONS
{

  .reset :
  {
    KEEP(*(.reset));
  } > FLASH_0_cached AT > FLASH_0_uncached
  
    /* TEXT section */

    .text :
    {
        sText = .;
        
        *(.text .text.* .gnu.linkonce.t.*);

        /* C++ Support */
        KEEP(*(.init))
        KEEP(*(.fini))

        /* .ctors */
        *crtbegin.o(.ctors)
        *crtbegin?.o(.ctors)
        *(EXCLUDE_FILE(*crtend?.o *crtend.o) .ctors)
        *(SORT(.ctors.*))
        *(.ctors)

        /* .dtors */
        *crtbegin.o(.dtors)
        *crtbegin?.o(.dtors)
        *(EXCLUDE_FILE(*crtend?.o *crtend.o) .dtors)
        *(SORT(.dtors.*))
        *(.dtors)

        *(.rodata .rodata.*)
        *(.gnu.linkonce.r*)
        
        . = ALIGN(4);        
    } > FLASH_1_cached AT > FLASH_1_uncached

    /* Exception handling, exidx needs a dedicated section */
    .ARM.extab :
    {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > FLASH_1_cached AT > FLASH_1_uncached

    __exidx_start = .;
    .ARM.exidx :
    {
        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
    } > FLASH_1_cached AT > FLASH_1_uncached
    __exidx_end = .;

    /* DSRAM layout (Lowest to highest)*/

    Stack (NOLOAD) : 
    {
        __stack_start = .;
        . = . + stack_size;
        __stack_end = .;
        __initial_sp = .;
    } > PSRAM_1
    
    /* functions with __attribute__((section(".ram_code"))) */
    .ram_code :
    {
        . = ALIGN(4); /* section size must be multiply of 4. See startup.S file */
        __ram_code_start = .;
        *(.ram_code)
        . = ALIGN(4); /* section size must be multiply of 4. See startup.S file */
        __ram_code_end = .;
    } > PSRAM_1 AT > FLASH_1_uncached
    __ram_code_load = LOADADDR (.ram_code);
    __ram_code_size = __ram_code_end - __ram_code_start;

    PSRAM_DATA :
    {
        . = ALIGN(4); /* section size must be multiply of 4. See startup.S file */
        __data3_start = .;
        *(PSRAM_DATA)
        . = ALIGN(4); /* section size must be multiply of 4. See startup.S file */
        __data3_end = .;
    } > PSRAM_1 AT > FLASH_1_uncached
    __data3_load = LOADADDR (PSRAM_DATA);
    __data3_size = __data3_end - __data3_start;

    PSRAM_BSS (NOLOAD) :
    {
        . = ALIGN(4); /* section size must be multiply of 4. See startup.S file */
        __bss3_start = .;
        *(PSRAM_BSS)
        . = ALIGN(4); /* section size must be multiply of 4. See startup.S file */
        __bss3_end = .;
        . = ALIGN(8);        
        Heap_Bank2_Start = .;
    } > PSRAM_1
    __bss3_size = __bss3_end - __bss3_start;
    
    /* Standard DATA and user defined DATA/BSS/CONST sections */
    .data :
    {
        . = ALIGN(4); /* section size must be multiply of 4. See startup.S file */
        __data_start = .;
        * (.data);
        * (.data*);
        *(*.data);
        *(.gnu.linkonce.d*)
      
        . = ALIGN(4);
        /* preinit data */
        PROVIDE_HIDDEN (__preinit_array_start = .);
        KEEP(*(.preinit_array))
        PROVIDE_HIDDEN (__preinit_array_end = .);

        . = ALIGN(4);
        /* init data */
        PROVIDE_HIDDEN (__init_array_start = .);
        KEEP(*(SORT(.init_array.*)))
        KEEP(*(.init_array))
        PROVIDE_HIDDEN (__init_array_end = .);

        . = ALIGN(4);
        /* finit data */
        PROVIDE_HIDDEN (__fini_array_start = .);
        KEEP(*(SORT(.fini_array.*)))
        KEEP(*(.fini_array))
        PROVIDE_HIDDEN (__fini_array_end = .);

        . = ALIGN(4); /* section size must be multiply of 4. See startup.S file */
        __data_end = .;
    } > DSRAM_1_system AT > FLASH_1_uncached
    __data_load = LOADADDR (.data);
    __data_size = __data_end - __data_start;

    /* BSS section */
    .bss (NOLOAD) : 
    {
        . = ALIGN(4); /* section size must be multiply of 4. See startup.S file */
        __bss_start = .;
        * (.bss);
        * (.bss*);
        * (COMMON);
        *(.gnu.linkonce.b*)
        . = ALIGN(4); /* section size must be multiply of 4. See startup.S file */
        __bss_end = .;
        . = ALIGN(8);
        Heap_Bank1_Start = .;
    } > DSRAM_1_system
    __bss_size = __bss_end - __bss_start;
    
    /* .no_init section contains chipid, SystemCoreClock and trimming data. See system.c file */
    .no_init ORIGIN(DSRAM_1_system) + LENGTH(DSRAM_1_system) - no_init_size (NOLOAD) : 
    {
        Heap_Bank1_End = .;
        * (.no_init);
    } > DSRAM_1_system

    Heap_Bank1_Size = Heap_Bank1_End - Heap_Bank1_Start;
    Heap_Bank2_Size = LENGTH(PSRAM_1) - (Heap_Bank2_Start - ORIGIN(PSRAM_1));

    ASSERT(Heap_Bank1_Start <= Heap_Bank1_End, "region SRAM_combined overflowed no_init section")

    /DISCARD/ :
    {
        *(.comment)
    }

    .stab       0 (NOLOAD) : { *(.stab) }
    .stabstr    0 (NOLOAD) : { *(.stabstr) }

    /* DWARF 1 */
    .debug              0 : { *(.debug) }
    .line               0 : { *(.line) }

    /* GNU DWARF 1 extensions */
    .debug_srcinfo      0 : { *(.debug_srcinfo) }
    .debug_sfnames      0 : { *(.debug_sfnames) }

    /* DWARF 1.1 and DWARF 2 */
    .debug_aranges      0 : { *(.debug_aranges) }
    .debug_pubnames     0 : { *(.debug_pubnames) }
    .debug_pubtypes     0 : { *(.debug_pubtypes) }

    /* DWARF 2 */
    .debug_info         0 : { *(.debug_info .gnu.linkonce.wi.*) }
    .debug_abbrev       0 : { *(.debug_abbrev) }
    .debug_line         0 : { *(.debug_line) }
    .debug_frame        0 : { *(.debug_frame) }
    .debug_str          0 : { *(.debug_str) }
    .debug_loc          0 : { *(.debug_loc) }
    .debug_macinfo      0 : { *(.debug_macinfo) }

    /* DWARF 2.1 */
    .debug_ranges       0 : { *(.debug_ranges) }

    /* SGI/MIPS DWARF 2 extensions */
    .debug_weaknames    0 : { *(.debug_weaknames) }
    .debug_funcnames    0 : { *(.debug_funcnames) }
    .debug_typenames    0 : { *(.debug_typenames) }
    .debug_varnames     0 : { *(.debug_varnames) }

    /* Build attributes */
    .build_attributes   0 : { *(.ARM.attributes) }
}
