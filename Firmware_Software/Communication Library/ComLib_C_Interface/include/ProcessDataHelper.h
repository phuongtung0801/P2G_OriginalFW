/**
 * \file ProcessDataHelper.h
 *
 * \brief This file defines the system counter and some function to manipulate
 * data write into file system
 *
 */

#ifndef _ProcessDataHelper_H
#define _ProcessDataHelper_H

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "Protocol.h"

// #define MICRO                                   1000000 //use to calculate receive time
/*Change these macro when want to change receive time and interval time to split txt file*/
#define RECEIVE_TIME                             7200000000 //micro seconds 
#define SPLIT_INTERVAL                           300000000

/*system counter*/
extern time_t seconds;

/*/Tung define test struct*/
    #define BSP_MAX_ADC_BUFFER_SIZE_BYTES           (32768U) 
    #define	RANGE_FFT_SIZE 				            (256)	
    typedef union 
    {
        float float_payload[BSP_MAX_ADC_BUFFER_SIZE_BYTES/4];
        uint8_t int_payload[BSP_MAX_ADC_BUFFER_SIZE_BYTES];
    } EndpointTestData;
    
/*

/*
==============================================================================
   3. DECLARE FUNCTIONS
==============================================================================
*/
void system_counter();

/*combine files in file system into one single txt file */
void combine_file(uint16_t total);

/*delete files after using*/
void delete_file(char* file_path);
/*
Calculate file path to store data base on index_number
*/
void cal_path(char* file_path);

/*Store data to file system*/
void store_data(uint64_t total_file_write, uint16_t payload_size, uint16_t header_size, EndpointTestData* object);

#endif