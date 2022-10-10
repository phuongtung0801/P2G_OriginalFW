/**
 * \file EndpointRadarBase.c
 *
 * \brief This file implements the API to communicate with Radar Base
 *        Endpoints in Infineon sensor devices.
 *
 * See header \ref EndpointRadarBase.h for more information.
 */

/* ===========================================================================
** Copyright (C) 2016-2019 Infineon Technologies AG
** All rights reserved.
** ===========================================================================
**
** ===========================================================================
** This document contains proprietary information of Infineon Technologies AG.
** Passing on and copying of this document, and communication of its contents
** is not permitted without Infineon's prior written authorisation.
** ===========================================================================
*/

/*
==============================================================================
   1. INCLUDE FILES
==============================================================================
*/
#include "EndpointTestData.h"
#define __PROTOCOL_INCLUDE_ENDPOINT_ONLY_API__
#include "Protocol_internal.h"
#undef __PROTOCOL_INCLUDE_ENDPOINT_ONLY_API__
#include <stdlib.h>
#include <string.h>

/*
==============================================================================
   2. LOCAL DEFINITIONS
==============================================================================
*/
/**
 * \internal
 * \defgroup EndpointRadarBaseCommandCodes
 *
 * \brief These are the command codes to identify the payload type.
 *
 * Each payload message of the supported endpoint starts with one of these
 * commend codes.
 *
 * @{
 */
#define MSG_FRAME_DATA            0x00 /**< A message containing radar
                                            frame data. */
#define MSG_GET_FRAME_DATA        0x01 /**< A message to retrieve frame data.
                                            */
#define MSG_SET_AUTOMATIC_TRIGGER 0x02 /**< A message to configure the
                                            automatic frame trigger. */
#define MSG_ENABLE_TEST_MODE      0x03 /**< A message to configure antenna
                                            test mode. */
#define MSG_GET_DRIVER_VERSION    0x20 /**< A message to query device
                                            information. */
#define MSG_SET_DRIVER_VERSION    0x21 /**< A message containing device
                                            information. */
#define MSG_GET_DEVICE_INFO       0x22 /**< A message to query device
                                            information. */
#define MSG_SET_DEVICE_INFO       0x23 /**< A message containing device
                                            information. */
#define MSG_GET_TEMPRATURE        0x30 /**< A message to query a measured
                                            temperature value. */
#define MSG_SET_TEMPRATURE        0x31 /**< A message containing a measured
                                            temperature value. */
#define MSG_GET_TX_POWER          0x32 /**< A message to query a measured TX
                                            power value. */
#define MSG_SET_TX_POWER          0x33 /**< A message containing a measured TX
                                            power value. */
#define MSG_GET_CHRIP_DURATION    0x34 /**< A message to query the current
                                            chirp duration. */
#define MSG_SET_CHRIP_DURATION    0x35 /**< A message containing the current
                                            chirp duration. */
#define MSG_GET_MIN_INTERVAL      0x36 /**< A message to query the minimum
                                            frame interval. */
#define MSG_SET_MIN_INTERVAL      0x37 /**< A message containing the minimum
                                            frame interval. */
#define MSG_GET_FRAME_FORMAT      0x40 /**< A message to query the frame
                                            format. */
#define MSG_SET_FRAME_FORMAT      0x41 /**< A message containing frame format
                                            parameters. */
/** @} */

/*
==============================================================================
   5. LOCAL FUNCTION PROTOTYPES
==============================================================================
*/

/**
 * \internal
 * \brief This function is called to parse a payload message.
 *
 * Whenever a connected device sends a payload message from an endpoint that
 * is of type and version compatible to the implementation is this module,
 * this function is invoked to parse the content of that message.
 *
 * \param[in] protocol_handle  The handle to the connection, the message was
 *                             received through.
 * \param[in] endpoint         The endpoint the message was sent from.
 * \param[in] payload          A pointer to the buffer containing the payload
 *                             to parse.
 * \param[in] payload_size     The number of bytes in payload.
 */
void parse_payload(int32_t protocol_handle, uint8_t endpoint,
                          const uint8_t* payload, uint16_t payload_size);

/**
 * \internal
 * See module \ref EndpointRadarErrorCodes.c for information.
 */
extern const char* ep_radar_get_error_code_description(uint16_t error_code);

int32_t parse_frame_info(int32_t protocol_handle, uint8_t endpoint,
                                const uint8_t* payload,
                                uint16_t payload_size);

static int32_t parse_temperature(int32_t protocol_handle, uint8_t endpoint,
                                 const uint8_t* payload,
                                 uint16_t payload_size);

static int32_t parse_tx_power(int32_t protocol_handle, uint8_t endpoint,
                              const uint8_t* payload, uint16_t payload_size);

static int32_t parse_chirp_duration(int32_t protocol_handle, uint8_t endpoint,
                                    const uint8_t* payload,
                                    uint16_t payload_size);

static int32_t parse_min_frame_interval(int32_t protocol_handle,
                                        uint8_t endpoint,
                                        const uint8_t* payload,
                                        uint16_t payload_size);

static int32_t parse__frame_format(int32_t protocol_handle, uint8_t endpoint,
                                   const uint8_t* payload,
                                   uint16_t payload_size);

static int32_t parse_device_info(int32_t protocol_handle, uint8_t endpoint,
                                 const uint8_t* payload,
                                 uint16_t payload_size);

static int32_t parse_driver_version(int32_t protocol_handle, uint8_t endpoint,
                                    const uint8_t* payload,
                                    uint16_t payload_size);

/*
==============================================================================
   4. DATA
==============================================================================
*/
    /*Tung*/
    
/**
 * \internal
 * \brief This structure contains information about this module needed by the
 *        module Protocol.c
 *
 * The structure contains the endpoint type and version range that is
 * supported by this module. The number identifying the endpoint type is the
 * ASCII code for 'RBAS' (= Radar Base driver).
 *
 * This struct contains also pointers to the functions to parse payload
 * messages and retrieve human readable status messages. Those function are
 * called from the main module \ref Protocol.c
 */
const Endpoint_Definition_t ep_test_data_definition =
{
    /*.type             =*/ 0x54444153,
    /*.min_version      =*/ 1,
    /*.max_version      =*/ 1,
    /*.description      =*/ "ifxTestData",
    /*.parse_payload    =*/ parse_payload,
    /*.get_status_descr =*/ ep_radar_get_error_code_description
};

/**
 * \internal
 * \defgroup EndpointRadarBaseRegisteredCallbacks
 *
 * \brief The registered callback function are stored here.
 *
 * For each message type that is expected from the connected device a callback
 * function can be registered. That registered callback function is stored
 * here along with a data pointer that is forwarded the callback function each
 * time it is issued.
 *
 * @{
 */

/**
 * \brief The callback function to handle radar frame data messages.
 */
static callback_data_frame_test_Test_t callback_data_frame_test = NULL;

/**
 * \brief The context data pointer for the radar frame data message callback
 *        function.
 */
static void* context_data_frame = NULL;

/**
 * \brief The callback function to handle driver version messages.
 */
static Callback_Driver_Version_t callback_driver_version = NULL;

/**
 * \brief The context data pointer for the driver version message callback
 *        function.
 */
static void* context_driver_version = NULL;

/**
 * \brief The callback function to handle device info messages.
 */
static Callback_Device_Info_t callback_device_info = NULL;

/**
 * \brief The context data pointer for the device info message callback
 *        function.
 */
static void* context_device_info = NULL;

/**
 * \brief The callback function to handle frame format messages.
 */
static Callback_Frame_Format_t callback_frame_format = NULL;

/**
 * \brief The context data pointer for the frame format message callback
 *        function.
 */
static void* context_frame_format = NULL;

/**
 * \brief The callback function to handle temperature messages.
 */
static Callback_Temperature_t callback_temperature = NULL;

/**
 * \brief The context data pointer for the temperature message callback
 *        function.
 */
static void* context_temperature = NULL;

/**
 * \brief The callback function to handle transmission power messages.
 */
static Callback_Tx_Power_t callback_tx_power = NULL;

/**
 * \brief The context data pointer for the transmission power message callback
 *        function.
 */
static void* context_tx_power = NULL;

/**
 * \brief The callback function to handle chirp duration messages.
 */
static Callback_Chirp_Duration_t callback_chirp_duration = NULL;

/**
 * \brief The context data pointer for the chirp duration message callback
 *        function.
 */
static void* context_chirp_duration = NULL;

/**
 * \brief The callback function to handle frame interval messages.
 */
static Callback_Min_Frame_Interval_t callback_min_frame_interval = NULL;

/**
 * \brief The context data pointer for the frame interval message callback
 *        function.
 */
static void* context_min_frame_interval = NULL;

/** @} */

/*
==============================================================================
  6. LOCAL FUNCTIONS
==============================================================================
*/

// handle message function
void parse_payload(int32_t protocol_handle, uint8_t endpoint,
                          const uint8_t* payload, uint16_t payload_size)
{
    /* try to parse payload for all supported message types, stop when parsing
     * was successful
     */
    if (parse_frame_info(protocol_handle, endpoint,
                         payload, payload_size))
    {
        printf("Parsing frame infor success\n");
        return;
    }
    // else printf("Failed parsing frame infor\n");

    if (parse_temperature(protocol_handle, endpoint,
                          payload, payload_size))
    {
        // printf("Parsing temperature infor\n");
        return;
    }

    if (parse_tx_power(protocol_handle, endpoint,
                       payload, payload_size))
    {
        printf("Parsing tx power infor\n");

        return;
    }

    if (parse_chirp_duration(protocol_handle, endpoint,
                             payload, payload_size))
    {
        printf("Parsing chirp duration infor\n");
        return;
    }

    if (parse_min_frame_interval(protocol_handle, endpoint,
                                 payload, payload_size))
    {
        return;
    }

    if (parse__frame_format(protocol_handle, endpoint,
                            payload, payload_size))
    {
        printf("Parsing frame format infor\n");
        return;
    }

    if (parse_device_info(protocol_handle, endpoint,
                          payload, payload_size))
    {
        printf("Parsing device infor\n");
        return;
    }

    if (parse_driver_version(protocol_handle, endpoint,
                             payload, payload_size))
    {
        printf("Parsing driver version infor\n");
        return;
    }
}

//used in parse_payload
int32_t parse_frame_info(int32_t protocol_handle, uint8_t endpoint,
                                const uint8_t* payload,
                                uint16_t payload_size)
{   
    const uint16_t header_size = 18;
    
    // memcpy(test_payload.int_payload, payload, payload_size - header_size);
    
    if ((protocol_read_payload_uint8(payload, 0) == MSG_FRAME_DATA) &&
        (payload_size >= header_size))
    {
        
        EndpointTestData test_payload;

        if (callback_data_frame_test)
        {   
            printf("Callback data frame success\n");
            for (size_t i = 0; i < payload_size - header_size; i++)
            {
                test_payload.int_payload[i] = payload[i + 18];
            }

            /*Store to file system. */
            
            static uint64_t total_file_write =  RECEIVE_TIME / (AUTOMATIC_DATA_TRIGER_TIME_US); //number of txt files need to combine
            store_data(total_file_write, payload_size, header_size, &test_payload);

            Frame_Info_t frame_info;
            uint32_t total_samples;
            uint32_t expected_message_size;

            /* read header info from payload */
            frame_info.frame_number =
                                    protocol_read_payload_uint32(payload,  1);
            frame_info.num_chirps = protocol_read_payload_uint32(payload,  5);
            frame_info.num_rx_antennas =
                                    protocol_read_payload_uint8 (payload,  9);
            frame_info.num_samples_per_chirp =
                                    protocol_read_payload_uint32(payload, 10);
            frame_info.rx_mask =    protocol_read_payload_uint8 (payload, 14);
            frame_info.data_format =
                  (Rx_Data_Format_t)protocol_read_payload_uint8 (payload, 15);
            frame_info.adc_resolution =
                                    protocol_read_payload_uint8 (payload, 16);
            frame_info.interleaved_rx =
                                    protocol_read_payload_uint8 (payload, 17);

            callback_data_frame_test(context_data_frame, protocol_handle,
                                    endpoint, &frame_info);
            return 1;
        }
    }
    return 0;
}

static int32_t parse_temperature(int32_t protocol_handle, uint8_t endpoint,
                                 const uint8_t* payload,
                                 uint16_t payload_size)
{
    if ((protocol_read_payload_uint8(payload, 0) == MSG_SET_TEMPRATURE) &&
        (payload_size == 6))
    {
        if (callback_temperature)
        {
            uint8_t temp_sensor;
            int32_t temperature_001C;

            temp_sensor      = protocol_read_payload_uint8(payload,  1);
            temperature_001C = protocol_read_payload_int32(payload,  2);

            /* send frame format to callback */
            callback_temperature(context_temperature, protocol_handle,
                                 endpoint, temp_sensor, temperature_001C);
        }

        return 1;
    }

    return 0;
}

static int32_t parse_tx_power(int32_t protocol_handle, uint8_t endpoint,
                              const uint8_t* payload, uint16_t payload_size)
{
    if ((protocol_read_payload_uint8(payload, 0) == MSG_SET_TX_POWER) &&
        (payload_size == 6))
    {
        if (callback_tx_power)
        {
            uint8_t tx_antenna;
            int32_t tx_power_001dBm;

            tx_antenna      = protocol_read_payload_uint8(payload,  1);
            tx_power_001dBm = protocol_read_payload_int32(payload,  2);

            /* send frame format to callback */
            callback_tx_power(context_tx_power, protocol_handle, endpoint,
                              tx_antenna, tx_power_001dBm);
        }

        return 1;
    }

    return 0;
}

static int32_t parse_chirp_duration(int32_t protocol_handle, uint8_t endpoint,
                                    const uint8_t* payload,
                                    uint16_t payload_size)
{
    if ((protocol_read_payload_uint8(payload, 0) == MSG_SET_CHRIP_DURATION) &&
        (payload_size == 5))
    {
        if (callback_chirp_duration)
        {
            uint32_t chirp_duration_ns;

            chirp_duration_ns = protocol_read_payload_uint32(payload, 1);

            /* send frame format to callback */
            callback_chirp_duration(context_chirp_duration, protocol_handle,
                                    endpoint, chirp_duration_ns);
        }

        return 1;
    }

    return 0;
}

static int32_t parse_min_frame_interval(int32_t protocol_handle,
                                        uint8_t endpoint,
                                        const uint8_t* payload,
                                        uint16_t payload_size)
{
    if ((protocol_read_payload_uint8(payload, 0) == MSG_SET_MIN_INTERVAL) &&
        (payload_size == 5))
    {
        if (callback_min_frame_interval)
        {
            uint32_t min_frame_interval_us;

            min_frame_interval_us = protocol_read_payload_uint32(payload, 1);

            /* send frame format to callback */
            callback_min_frame_interval(context_min_frame_interval,
                                        protocol_handle, endpoint,
                                        min_frame_interval_us);
        }

        return 1;
    }

    return 0;
}

static int32_t parse__frame_format(int32_t protocol_handle, uint8_t endpoint,
                                   const uint8_t* payload,
                                   uint16_t payload_size)
{
    if ((protocol_read_payload_uint8(payload, 0) == MSG_SET_FRAME_FORMAT) &&
        (payload_size == 11))
    {
        if (callback_frame_format)
        {
            Frame_Format_t frame_format;

            frame_format.num_samples_per_chirp =
                                    protocol_read_payload_uint32(payload,  1);
            frame_format.num_chirps_per_frame =
                                    protocol_read_payload_uint32(payload,  5);
            frame_format.rx_mask =  protocol_read_payload_uint8 (payload,  9);
            frame_format.eSignalPart =
                     (Signal_Part_t)protocol_read_payload_uint8 (payload, 10);

            /* send frame format to callback */
            callback_frame_format(context_frame_format, protocol_handle,
                                  endpoint, &frame_format);
        }

        return 1;
    }

    return 0;
}

static int32_t parse_device_info(int32_t protocol_handle, uint8_t endpoint,
                                 const uint8_t* payload,
                                 uint16_t payload_size)
{
    if ((protocol_read_payload_uint8(payload, 0) == MSG_SET_DEVICE_INFO) &&
        (payload_size >= 17))
    {
        if (callback_device_info)
        {
            Device_Info_t device_info;

            device_info.min_rf_frequency_kHz =
                                    protocol_read_payload_uint32(payload,  1);
            device_info.max_rf_frequency_kHz =
                                    protocol_read_payload_uint32(payload,  5);
            device_info.num_tx_antennas =
                                    protocol_read_payload_uint8 (payload,  9);
            device_info.num_rx_antennas =
                                    protocol_read_payload_uint8 (payload, 10);
            device_info.max_tx_power =
                                    protocol_read_payload_uint8 (payload, 11);
            device_info.num_temp_sensors =
                                    protocol_read_payload_uint8 (payload, 12);
            device_info.major_version_hw =
                                    protocol_read_payload_uint8 (payload, 13);
            device_info.minor_version_hw =
                                    protocol_read_payload_uint8 (payload, 14);
            device_info.interleaved_rx =
                                    protocol_read_payload_uint8 (payload, 15);
            device_info.data_format =
                  (Rx_Data_Format_t)protocol_read_payload_uint8 (payload, 16);
            device_info.description =                     (char*)payload + 17;

            /* send device info to callback */
            callback_device_info(context_device_info, protocol_handle,
                                 endpoint, &device_info);
        }

        return 1;
    }

    return 0;
}

static int32_t parse_driver_version(int32_t protocol_handle, uint8_t endpoint,
                                    const uint8_t* payload,
                                    uint16_t payload_size)
{
    if ((protocol_read_payload_uint8(payload, 0) == MSG_SET_DRIVER_VERSION) &&
        (payload_size == 4))
    {
        if (callback_driver_version)
        {
            Driver_Version_t driver_version;

            driver_version.major    = protocol_read_payload_uint8(payload, 1);
            driver_version.minor    = protocol_read_payload_uint8(payload, 2);
            driver_version.revision = protocol_read_payload_uint8(payload, 3);

            /* send device info to callback */
            callback_driver_version(context_driver_version, protocol_handle,
                                    endpoint, &driver_version);
        }

        return 1;
    }

    return 0;
}

/*
==============================================================================
   7. EXPORTED FUNCTIONS
==============================================================================
*/

int32_t ep_test_data_is_compatible_endpoint(int32_t protocol_handle,
                                             uint8_t endpoint)
{
    return protocol_is_endpoint_compatible(protocol_handle, endpoint,
                                           &ep_test_data_definition);
}

void ep_test_data_set_callback_data_frame_test(callback_data_frame_test_Test_t callback, void* context)
{
    callback_data_frame_test = callback;
    context_data_frame = context;
}

void ep_test_data_set_callback_driver_version(Callback_Driver_Version_t
                                                 callback,
                                               void* context)
{
    callback_driver_version = callback;
    context_driver_version = context;
}

void ep_test_data_set_callback_device_info(Callback_Device_Info_t callback,
                                            void* context)
{
    callback_device_info = callback;
    context_device_info = context;
}

void ep_test_data_set_callback_frame_format(Callback_Frame_Format_t callback,
                                             void* context)
{
    callback_frame_format = callback;
    context_frame_format = context;
}

void ep_test_data_set_callback_temperature(Callback_Temperature_t callback,
                                            void* context)
{
    callback_temperature = callback;
    context_temperature = context;
}

void ep_test_data_set_callback_tx_power(Callback_Tx_Power_t callback,
                                         void* context)
{
    callback_tx_power = callback;
    context_tx_power = context;
}

void ep_test_data_set_callback_chirp_duration(Callback_Chirp_Duration_t
                                                 callback,
                                               void* context)
{
    callback_chirp_duration = callback;
    context_chirp_duration = context;
}

void ep_test_data_set_callback_min_frame_interval(Callback_Min_Frame_Interval_t
                                                     callback,
                                                   void* context)
{
    callback_min_frame_interval = callback;
    context_min_frame_interval = context;
}

int32_t ep_test_data_get_frame_data(int32_t protocol_handle,
                                     uint8_t endpoint, uint8_t wait)
{
    /* build message to send */
    uint8_t cmd_message[2];

    protocol_write_payload_uint8(cmd_message, 0, MSG_GET_FRAME_DATA);
    protocol_write_payload_uint8(cmd_message, 1, wait);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint,
                                     &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

int32_t ep_test_data_set_automatic_frame_trigger(int32_t protocol_handle,
                                                  uint8_t endpoint,
                                                  uint32_t frame_interval_us)
{
    /* build message to send */
    printf("protocol handle: %d, endpoint: %d\n", protocol_handle, endpoint);
    uint8_t cmd_message[5];

    protocol_write_payload_uint8 (cmd_message, 0, MSG_SET_AUTOMATIC_TRIGGER);
    protocol_write_payload_uint32(cmd_message, 1, frame_interval_us);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint,
                                     &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

int32_t ep_test_data_enable_test_mode(int32_t protocol_handle,
                                       uint8_t endpoint, uint8_t tx_mask,
                                       uint8_t rx_mask,
                                       uint32_t frequency_kHz,
                                       uint8_t tx_power)
{
    /* build message to send */
    uint8_t cmd_message[8];

    protocol_write_payload_uint8 (cmd_message, 0, MSG_ENABLE_TEST_MODE);
    protocol_write_payload_uint8 (cmd_message, 1, tx_mask);
    protocol_write_payload_uint8 (cmd_message, 2, rx_mask);
    protocol_write_payload_uint32(cmd_message, 3, frequency_kHz);
    protocol_write_payload_uint8 (cmd_message, 7, tx_power);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint,
                                     &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

int32_t ep_test_data_get_driver_version(int32_t protocol_handle,
                                         uint8_t endpoint)
{
    /* build message to send */
    uint8_t cmd_message[1];

    protocol_write_payload_uint8(cmd_message, 0, MSG_GET_DRIVER_VERSION);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint,
                                     &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

int32_t ep_test_data_get_device_info(int32_t protocol_handle,
                                      uint8_t endpoint)
{
    /* build message to send */
    uint8_t cmd_message[1];

    protocol_write_payload_uint8(cmd_message, 0, MSG_GET_DEVICE_INFO);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint,
                                     &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

int32_t ep_test_data_set_frame_format(int32_t protocol_handle,
                                       uint8_t endpoint,
                                       const Frame_Format_t* frame_format)
{
    /* build message to send */
    uint8_t cmd_message[11];

    protocol_write_payload_uint8 (cmd_message,  0, MSG_SET_FRAME_FORMAT);
    protocol_write_payload_uint32(cmd_message,  1, frame_format->num_samples_per_chirp);
    protocol_write_payload_uint32(cmd_message,  5, frame_format->num_chirps_per_frame);
    protocol_write_payload_uint8 (cmd_message,  9, frame_format->rx_mask);
    protocol_write_payload_uint8 (cmd_message, 10, frame_format->eSignalPart);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint,
                                     &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

int32_t ep_test_data_get_frame_format(int32_t protocol_handle,
                                       uint8_t endpoint)
{
    /* build message to send */
    uint8_t cmd_message[1];

    protocol_write_payload_uint8(cmd_message, 0, MSG_GET_FRAME_FORMAT);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint, &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

int32_t ep_test_data_get_temperature(int32_t protocol_handle,
                                      uint8_t endpoint, uint8_t temp_sensor)
{
    /* build message to send */
    uint8_t cmd_message[2];

    protocol_write_payload_uint8(cmd_message, 0, MSG_GET_TEMPRATURE);
    protocol_write_payload_uint8(cmd_message, 1, temp_sensor);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint,
                                     &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

int32_t ep_test_data_get_tx_power(int32_t protocol_handle, uint8_t endpoint,
                                   uint8_t tx_antenna)
{
    /* build message to send */
    uint8_t cmd_message[2];

    protocol_write_payload_uint8(cmd_message, 0, MSG_GET_TX_POWER);
    protocol_write_payload_uint8(cmd_message, 1, tx_antenna);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint,
                                     &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

int32_t ep_test_data_get_chirp_duration(int32_t protocol_handle,
                                         uint8_t endpoint)
{
    /* build message to send */
    uint8_t cmd_message[1];

    protocol_write_payload_uint8(cmd_message, 0, MSG_GET_CHRIP_DURATION);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint,
                                     &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

int32_t ep_test_data_get_min_frame_interval(int32_t protocol_handle,
                                             uint8_t endpoint)
{
    /* build message to send */
    uint8_t cmd_message[1];

    protocol_write_payload_uint8(cmd_message, 0, MSG_GET_MIN_INTERVAL);

    /* send message and process received response */
    return protocol_send_and_receive(protocol_handle, endpoint,
                                     &ep_test_data_definition,
                                     cmd_message, sizeof(cmd_message));
}

/* --- End of File -------------------------------------------------------- */
