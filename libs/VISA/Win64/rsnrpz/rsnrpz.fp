s��        ��  ! Y  �h   �   ����                               rsnrpz                          R&S NRPZ Power Sensor                       _VI_FUNC                                                     � ��ViChar  � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]  � � ��ViUInt16  � � ��ViUInt32  T    This instrument module provides programming support for the R&S NRP Power Meter. The module is divided into the following functions:

Functions/Classes:

(1) Initialize:
This function initializes the instrument and sets it to a default configuration.

(2) Function Examples: (Class)
This class contains high-level, test and measurement routines.  These examples call other instrument driver functions to configure, start, and read from the instrument.

(3) Configuration Functions: (Class)
This class of functions configures the instrument by setting acquisition and system configuration parameters.

(4) Action/Status Functions: (Class)
This class of functions begins or terminates an acquisition. It also provides functions which allow the user to determine the current status of the instrument.

(5) Data Functions: (Class)
This class of functions transfers data to or from the instrument.

(6) Utility Functions: (Class)
This class of functions provides lower level functions to communicate with the instrument, and change instrument parameters.

(7) Close:
This function takes the instrument offline.
    �    This class of functions provides lower level functions to communicate with the instrument, and change instrument parameters.

Functions:

(1) State Checking:
This function switches state checking of the instrument (reading of the Standard Event Register and checking it for error) status subsystem.

(2) Write To Instrument:
This function writes commands and queries to the instrument to modify parameters and query device settings.

(3) Read Instrument Data:
This function reads data from instrument buffer and returns it to the specified variable in memory.

(4) Reset:
This function resets the instrument to its default state.

(5) Self-Test:
This function runs the instrument self test and returns the test code.

(6) Error Query:
This function reads an error code from the instrument error queue.

(7) Error Message:
This function takes the Status Code and returns it as a user readable string.
 
(8) Revision Query:
This function returns the revision numbers of the instrument driver and instrument firmware.
     !    Support for USB hub R&S NRP-Z5.    �    This function performs the following initialization actions and assigned specified sesnor to channel 1:

- Opens a session to the specified device using the interface and address specified in the Resource Name control.

- Performs an identification query on the sensor.

- Resets the instrument to a known state.

- Sends initialization commands to the sensor

- Returns an Instrument Handle which is used to differentiate between different sessions of this instrument driver.    E    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0011  Instrument returned invalid response to ID Query
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors
    �    This control specifies the interface and address of the device that is to be initialized (Instrument Descriptor). The exact grammar to be used in this control is shown in the note below. 

Default Value:  "USB::0x0aad::0x000b::100000"

Notes:

(1) Based on the Instrument Descriptor, this operation establishes a communication session with a device.  The grammar for the Instrument Descriptor is shown below.  Optional parameters are shown in square brackets ([]).

Interface   Grammar
------------------------------------------------------
USB         USB::vendor Id::product Id::serial number

where:
  vendor Id is 0aad for all Rohde&Schwarz instruments.

  product Id depends on your sensor model:

                       NRP-Z21    : 0x0003
                       NRP-FU     : 0x0004
                       FSH-Z1     : 0x000b
                       NRP-Z11    : 0x000c
                       NRP-Z22    : 0x0013
                       NRP-Z23    : 0x0014
                       NRP-Z24    : 0x0015
                       NRP-Z51    : 0x0016
                       NRP-Z52    : 0x0017
                       NRP-Z55    : 0x0018
                       NRP-Z56    : 0x0019
                       FSH-Z18    : 0x001a
                       NRP-Z91    : 0x0021
                       NRP-Z81    : 0x0023
                       NRP-Z31    : 0x002c
                       NRP-Z37    : 0x002d
                       NRP-Z96    : 0x002e
                       NRP-Z27    : 0x002f
                       NRP-Z28    : 0x0051
                       NRP-Z98    : 0x0052
                       NRP-Z92    : 0x0062
                       NRP-Z57    : 0x0070
                       NRP-Z85    : 0x0083
                       NRPC40     : 0x008f
                       NRPC50     : 0x0090
                       NRP-Z86    : 0x0095
                       NRP-Z41    : 0x0096
                       NRP-Z61    : 0x0097
                       NRP-Z71    : 0x0098
                       NRP-Z32    : 0x009a
                       NRP-Z211   : 0x00a6
                       NRP-Z221   : 0x00a7
                       NRP-Z58    : 0x00a8
                       NRPC33     : 0x00b6
                       NRPC18     : 0x00bf
                       NRPC18-B1  : 0x00c1
                       NRPC33-B1  : 0x00c2
                       NRPC40-B1  : 0x00c3
                       NRPC50-B1  : 0x00c4
                       NRP8S      : 0x00e2
                       NRP8SN     : 0x0137
                       NRP18S     : 0x0138
                       NRP18SN    : 0x0139
                       NRP33S     : 0x0145
                       NRP33SN    : 0x0146
                       NRP18S-10  : 0x0148
                       NRP18SN-10 : 0x0149
                       NRP18S-20  : 0x014a
                       NRP18SN-20 : 0x014b
                       NRP18S-25  : 0x014c
                       NRP18SN-25 : 0x014d
                       NRP18A     : 0x014e
                       NRP18AN    : 0x014f
                       NRP18T     : 0x0150
                       NRP18TN    : 0x0151
                       NRP33T     : 0x0152
                       NRP33TN    : 0x0153
                       NRP40T     : 0x0154
                       NRP40TN    : 0x0155
                       NRP50T     : 0x0156
                       NRP50TN    : 0x0157
                       NRP67T     : 0x0158
                       NRP67TN    : 0x0159
                       NRP110T    : 0x015a
                       NRP40S     : 0x015f
                       NRP40SN    : 0x0160
                       NRP50S     : 0x0161
                       NRP50SN    : 0x0162
                       NRP33SN-V  : 0x0168
                       NRP6A      : 0x0178
                       NRP6AN     : 0x0179
                       NRPM3      : 0x0195

  serial number you can find on your sensor. Serial number is number with 6 digits. For example 900003

you can use asterisk '*' for product id or serial number in resource descriptor. Use asterisk only for one connected sensor, because driver opens only first sensor on the bus.
 
The USB keyword is used for USB interface.

Examples:
USB   - "USB::0x0aad::0x000b::100000"
USB   - "USB::0x0aad::*"         - Opens first R&S sensor
USB   - "*"                      - Opens first R&S sensor    #    This control specifies if an ID Query is sent to the instrument during the initialization procedure.

Valid Range:
VI_FALSE (0) - Skip Query
VI_TRUE  (1) - Do Query (Default Value)

Notes:
   
(1) Under normal circumstances the ID Query ensures that the instrument initialized is the type supported by this driver. However circumstances may arise where it is undesirable to send an ID Query to the instrument.  In those cases; set this control to "Skip Query" and this function will initialize the selected interface, without doing an ID Query.
    H    This control specifies if the instrument is to be reset to its power-on settings during the initialization procedure.

Valid Range:
VI_FALSE (0) - Don't Reset
VI_TRUE  (1) - Reset Device (Default Value)

Notes:

(1) If you do not want the instrument reset. Set this control to "Don't Reset" while initializing the instrument.
    7    This control returns an Instrument Handle that is used in all subsequent function calls to differentiate between different sessions of this instrument driver.

Notes:

(1) Each time this function is invoked a Unique Session is opened.  It is possible to have more than one session open for the same resource.
  ���� 
 2��                                           {����  �    Status                            � [   �  �    Resource Name                     "� X �       ID Query                          $� [� �       Reset Device                      & � � �  }    Instrument Handle                  DWarning: The driver requires NRP Toolkit installed on your computer    	           "USB::0x0aad::0x000b::100000"  % Do Query VI_TRUE Skip Query VI_FALSE  * Reset Device VI_TRUE Don't Reset VI_FALSE    	           �    This function immediately sets all the sensors to the IDLE state. Measurements in progress are interrupted. If INIT:CONT ON is set, a new measurement is immediately started since the trigger system is not influenced.

Remote-control command(s):
ABOR        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    *c����  �    Status                            .�   �  �    Instrument Handle                  	               �    This function returns number of available channels (1, 2 or 4 depending on installed options NRP-B2 - Two channel interface and NRP-B5 - Four channel interface).        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    This control returns number of available channels (1, 2 or 4 depending on installed options NRP-B2 - Two channel interface and NRP-B5 - Four channel interface).    0H����  �    Status                            4i   �  �    Instrument Handle                 5 G� �  x    Count                              	               	           �    This function starts a single-shot measurement on all channels. The respective sensor goes to the INITIATED state. The command is completely executed when the sensor returns to the IDLE state. The command is ignored when the sensor is not in the IDLE state or when continuous measurements are selected (INIT:CONT ON). The command is only fully executed when the measurement is completed and the trigger system has again reached the IDLE state. INIT is the only remote control command that permits overlapping execution. Other commands can be received and processed while the command is being executed.

Remote-control command(s):
STAT:OPER:MEAS?
INIT:IMM        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    9����  �    Status                            =&   �  �    Instrument Handle                  	              �    This function starts zeroing of all sensors using the signal at each sensor input. Zeroing is an asynchronous operation which will require a couple of seconds. Therefore, after starting the function, the user should poll the current execution status by continuously calling rsnrpz_chans_isZeroComplete(). As soon as the zeroing has finished, the result of the operation can be queried by a call to rsnrpz_error_query(). See the example code below.

Note: All sensors must be disconnected from all power sources. If the signal at the input considerably deviates from 0 W, the sensor aborts the zero calibration and raises an error condition. The rsnrpz driver queues the error for later retrieval by the rsnrpz_error_query() function.

Example code
bool Zero( ViSession lSesID )
{
  const int CH1 = 1;
  ViStatus lStat = VI_SUCCESS;
  ViBoolean bZeroComplete = VI_FALSE;
  ViInt32 iErrorCode = VI_SUCCESS;
  ViChar szErrorMsg[256];
  /* Start zeroing the sensor  */
  lStat = rsnrpz_chans_zero( lSesID );
  if ( lStat != VI_SUCCESS )
  {
    fprintf( stderr, "Error 0x%08x in rsnrpz_chan_zero()", lStat );
    return false;
  }
  while ( bZeroComplete == VI_FALSE )
  {
    lStat = rsnrpz_chans_isZeroComplete( lSesID, &bZeroComplete );
    if ( bZeroComplete )
    {
      rsnrpz_error_query( lSesID, &iErrorCode, szErrorMsg );
      fprintf( stderr, "Zero-Cal.: error %d, %s\n\n", iErrorCode, szErrorMsg );
      break;
    }
    else 
      SLEEP( 200 );
  }
  return iErrorCode == 0;
}

Remote-control command(s):
CAL:ZERO:AUTO        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    DC����  �    Status                            Hd   �  �    Instrument Handle                  	              K    This function should be used for polling whether a previously started zero calibration on a group of sensor has already finished. Zero calibration is an asynchronous operation and may take some seconds until completion. See the example code under rsnrpz_chans_zero() on how to conduct a zeroing calibration on a group of sensors.        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     F    This control returns VI_TRUE if all channels have calibration ready.    J�����  �    Status                            N�   �  �    Instrument Handle                 O� G� �  x    Zeroing Completed                  	               	            K    This function returns the summary status of measurements on all channels.        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     G    This control returns VI_TRUE if all channels have measurement ready.
    P�����  �    Status                            U   �  �    Instrument Handle                 U� G� �  x    Measurement Completed              	               	            �    This function sets the sensor to one of the measurement modes.

Remote-control command(s):
SENSe[1..4]:FUNCtion
SENSe[1..4]:BUFFer:STATe ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    6    This control specifies the measurement mode to which sensor should be switched.

Valid Values:
RSNRPZ_SENSOR_MODE_CONTAV (0) - ContAv (Default Value)
RSNRPZ_SENSOR_MODE_BUF_CONTAV (1) - Buffered ContAv
RSNRPZ_SENSOR_MODE_TIMESLOT (2) - Timeslot
RSNRPZ_SENSOR_MODE_BURST (3) - Burst
RSNRPZ_SENSOR_MODE_SCOPE (4) - Scope
RSNRPZ_SENSOR_MODE_CCDF (6) - CCDF
RSNRPZ_SENSOR_MODE_PDF (7) - PDF

Notes:
(1) ContAv: After a trigger event, the power is integrated over a time interval (Averaging).

(2) Buffered ContAv: The same as ContAv except the buffered mode is switched On.

(3) Timeslot: The power is measured simultaneously in a number of timeslots (up to 26).

(4) Burst: SENS:POW:BURS:DTOL defines the time interval during which a signal drop below the trigger level is not interpreted as the end of the burst. In the BurstAv mode, the set trigger source is ignored.

(5) Scope: A sequence of measurements is performed. The individual measured values are determined as in the ContAv mode.

(6) NRP-Z51 supports only RSNRPZ_SENSOR_MODE_CONTAV and RSNRPZ_SENSOR_MODE_BUF_CONTAV.    WQ����  �    Status                            [r   �  �    Instrument Handle                 \ G  �  x    Channel                           \ G � � x    Measurement Mode                   	               1               �ContAv RSNRPZ_SENSOR_MODE_CONTAV Buffered ContAv RSNRPZ_SENSOR_MODE_BUF_CONTAV Timeslot RSNRPZ_SENSOR_MODE_TIMESLOT Burst RSNRPZ_SENSOR_MODE_BURST Scope RSNRPZ_SENSOR_MODE_SCOPE CCDF RSNRPZ_SENSOR_MODE_CCDF PDF RSNRPZ_SENSOR_MODE_PDF    �    This function configures times that is to be excluded at the beginning and at the end of the integration.

Note:
  
1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TIM:EXCL:STAR
SENS:TIM:EXCL:STOP        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets a time (in seconds) that is to be excluded at the beginning of the integration

Valid Range:
NRP-Z21: 0.0 - 0.1 s
FSH-Z1:  0.0 - 0.1 s


Default Value:
0.0 s

Notes:
(1) Actual valid range depends on sensor used     �    This control sets a time (in seconds) that is to be excluded at the end of the integration.

Valid Range:
NRP-Z21: 0.0 - 0.003 s
FSH-Z1:  0.0 - 0.003 s

Default Value:
0.0 s

Notes:
(1) Actual valid range depends on sensor used    c�����  �    Status                            g�   �  �    Instrument Handle                 hM G  �  x    Channel                           h� G � �  x    Exclude Start                     i� G3 �  x    Exclude Stop                       	               1    0.0    0.0    �    This function sets a time that is to be excluded at the beginning of the integration.

Note:
  
1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TIM:EXCL:STAR        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets a time (in seconds) that is to be excluded at the beginning of the integration

Valid Range:
NRP-Z21: 0.0 - 0.1 s
FSH-Z1:  0.0 - 0.1 s

Default Value:
0.0 s

Notes:
(1) Actual valid range depends on sensor used    l�����  �    Status                            p�   �  �    Instrument Handle                 qJ G  �  x    Channel                           q� G � �  x    Exclude Start                      	               1    0.0    �    This function reads a time that is to be excluded at the beginning of the integration.

Note:
  
1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TIM:EXCL:STAR?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     f    This control returns a time (in seconds) that is to be excluded at the beginning of the integration.    t_����  �    Status                            x�   �  �    Instrument Handle                 y G  �  x    Channel                           y� G� �  x    Exclude Start                      	               1    	           �    This function sets a time that is to be excluded at the end of the integration.

Note:
  
1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TIM:EXCL:STOP        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets a time (in seconds) that is to be excluded at the end of the integration.

Valid Range:

NRP-Z21: 0.0 - 0.003 s
FSH-Z1:  0.0 - 0.003 s

Default Value:
0.0 s

Notes:
(1) Actual valid range depends on sensor used    {�����  �    Status                            �   �  �    Instrument Handle                 �q G  �  x    Channel                           �� G � �  x    Exclude Stop                       	               1    0.0    �    This function reads a time that is to be excluded at the end of the integration.

Note:
  
1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TIM:EXCL:STOP?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     `    This control returns a time (in seconds) that is to be excluded at the end of the integration.    ������  �    Status                            ��   �  �    Instrument Handle                 �@ G  �  x    Channel                           �� G� �  x    Exclude Stop                       	               1    	          L    This function can be used to reduce the video bandwidth for the Trace and Statistics modes. As a result, trigger sensitivity is increased and the display noise reduced. To prevent signals from being corrupted, the selected video bandwidth should not be smaller than the RF bandwidth of the measurement signal. The "FULL" setting corresponds to a video bandwidth of at least 30 MHz if there is an associated frequency setting (SENSe:FREQuency command) greater than or equal to 500 MHz. If a frequency below 500 MHz is set and the video bandwidth is set to "FULL", the video bandwidth is automatically reduced to approx. 7.5 MHz.
If the video bandwidth is limited with the SENSe:BWIDth:VIDEo command, the sampling rate is also automatically reduced, i.e. the effective time resolution in the Trace mode is reduced accordingly. In the Statistics modes, the measurement time must be increased appropriately if the required sample size is to be maintained:
Video bandwidth Sampling rate   Sampling interval
"Full"            8e7 1/s       12.5 ns
"5 MHz"           4e7 1/s         25 ns
"1.5 MHz"         1e7 1/s        100 ns
"300 kHz"       2.5e6 1/s        400 ns








sets the video bandwidth according to a list of available bandwidths. The list can be obtained using function rsnrpz_bandwidth_getBwList.

Remote-control command(s):
SENSe:BWIDth:VIDeo        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the video bandwidth according to a list of available bandwidths. The list can be obtained using function rsnrpz_bandwidth_getBwList.

Valid Range:
Index of bandwidth in the list

Default Value:
0    �_����  �    Status                            ��   �  �    Instrument Handle                 � G  �  x    Channel                           �� G � �  x    Bandwidth                          	               1    0    a    This function queries selected video bandwidth.

Remote-control command(s):
SENSe:BWIDth:VIDeo?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     K    This control returns selected video bandwidth as index in bandwidth list.    ������  �    Status                            ��   �  �    Instrument Handle                 �� G  �  x    Channel                           �� G) �  x    Bandwidth                          	               1    	            s    This function queries the list of possible video bandwidths.

Remote-control command(s):
SENSe:BWIDth:VIDeo:LIST?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     r    This control defines the size of buffer passed to Bandwidth List argument.

Valid Range:
> 0

Default Value:
200     M    This control returns the comma separated list of possible video bandwidths.    ������  �    Status                            ��   �  �    Instrument Handle                 �t G  �  x    Channel                           �� G � �  x    Buffer Size                       �\ G� �  x    Bandwidth List                     	               1    200    	            �    This function configures all parameters necessary for automatic detection of filter bandwidth.

Remote-control command(s):
SENS:AVER:COUN:AUTO ON
SENS:AVER:COUN:AUTO:TYPE RES
SENS:AVER:COUN:AUTO:RES <value>
SENS:AVER:TCON REP
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    8    This control defines the number of significant places for linear units and the number of decimal places for logarithmic units which should be free of noise in the measurement result.

Valid Range:
1 to 4

Default Value: 3

Notes:
(1) Actual range depend on sensor used and may vary from the range stated above.    ������  �    Status                            ��   �  �    Instrument Handle                 �� G  �  x    Channel                           �� G � �  x    Resolution                         	               1    3   ;    This function configures all parameters necessary for setting the noise ratio in the measurement result and automatic detection of filter bandwidth.

Remote-control command(s):
SENS:AVER:COUN:AUTO ON
SENS:AVER:COUN:AUTO:TYPE NSR
SENS:AVER:COUN:AUTO:NSR <value>
SENS:AVER:COUN:AUTO:MTIM <value>
SENS:AVER:TCON REP
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the maximum noise ratio in the measurement result. The value is set in dB.

Valid Range:

NRP-Z21: 0.0 - 1.0
FSH-Z1:  0.0 - 1.0

Default Value: 0.1

Notes:
(1) This value is not range checked; the actual range depends on sensor used.     �    This control sets the upper time limit (maximum time to fill the filter).

Valid Range:

NRP-21: 0.01 - 999.99
FSH-Z1: 0.01 - 999.99

Default Value: 4.0

Notes:
(1) This value is not range checked, the actual range depends on sensor used.    �m����  �    Status                            ��   �  �    Instrument Handle                 �- G  �  x    Channel                           �� G � �  x    Maximum Noise Ratio               �� G= �  x    Upper Time Limit                   	               1    0.1    4.0    �    This function configures all parameters necessary for manual setting of filter bandwidth.

Remote-control command(s):
SENS:AVER:COUN
SENS:AVER:COUN:AUTO OFF
SENS:AVER:TCON REP        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the filter bandwidth.

Valid Range:
1 - 65536

Default Value: 4

Notes:
(1) Actual valid range depends on sensor used    �}����  �    Status                            ��   �  �    Instrument Handle                 �= G  �  x    Channel                           �� G � �  x    Count                              	               1    4    �    This function can be used to automatically determine a value for filter bandwidth.

Remote-control command(s):
SENS:AVER:COUN:AUTO ON|OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1        This control activates or deactivates automatic determination of a value for filter bandwidth.
If the automatic switchover is activated with the ON parameter, the sensor always defines a suitable filter length.

Valid Values:
VI_FALSE (0) - Off
VI_TRUE (1) - On (Default Value)    ������  �    Status                            ��   �  �    Instrument Handle                 �} G  �  x    Channel                           �� G � �u      Auto Enabled                       	               1   On VI_TRUE Off VI_FALSE    �    This function queries the setting of automatic switchover of filter bandwidth.

Remote-control command(s):
SENS:AVER:COUN:AUTO?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     P    This control returns the setting of automatic switchover of filter bandwidth.
    Ɨ����  �    Status                            ʸ   �  �    Instrument Handle                 �W G  �  x    Channel                           �� G� �  x    Auto Enabled                       	               1    	                This function sets an upper time limit can be set via (maximum time). It should never be exceeded. Undesired long measurement times can thus be prevented if the automatic filter length switchover is on.

Remote-control command(s):
SENS:AVER:COUN:AUTO:MTIM        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the upper time limit (maximum time to fill the filter).

Valid Range:

NRP-21: 0.01 - 999.99
FSH-Z1: 0.01 - 999.99

Default Value: 4.0

Notes:
(1) This value is not range checked, the actual range depends on sensor used.    �����  �    Status                            �=   �  �    Instrument Handle                 �� G  �  x    Channel                           �J G � �  x    Upper Time Limit                   	               1    4.0    �    This function queries an upper time limit (maximum time to fill the filter).

Remote-control command(s):
SENS:AVER:COUN:AUTO:MTIM?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     M    This control returns an upper time limit (maximum time to fill the filter).    վ����  �    Status                            ��   �  �    Instrument Handle                 �~ G  �  x    Channel                           �� G� �  x    Upper Time Limit                   	               1    	           {    This function sets the maximum noise ratio in the measurement result.

Remote-control command(s):
SENS:AVER:COUN:AUTO:NSR        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the maximum noise ratio in the measurement result. The value is set in dB.

Valid Range:

NRP-Z21: 0.0 - 1.0
FSH-Z1:  0.0 - 1.0

Default Value: 0.1

Notes:
(1) This value is not range checked; the actual range depends on sensor used.    ܹ����  �    Status                            ��   �  �    Instrument Handle                 �y G  �  x    Channel                           �� G � �  x    Maximum Noise Ratio                	               1    0.1    r    This function queries the maximum noise signal ratio value.

Remote-control command(s):
SENS:AVER:COUN:AUTO:NSR?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     :    This control returns a maximum noise signal ratio in dB.    �V����  �    Status                            �w   �  �    Instrument Handle                 � G  �  x    Channel                           � G� �  x    Maximum Noise Ratio                	               1    	          *    This function defines the number of significant places for linear units and the number of decimal places for logarithmic units which should be free of noise in the measurement result. This setting does not affect the setting of display.

Remote-control command(s):
SENS:AVER:COUN:AUTO:RES 1 ... 4        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    8    This control defines the number of significant places for linear units and the number of decimal places for logarithmic units which should be free of noise in the measurement result.

Valid Range:
1 to 4

Default Value: 3

Notes:
(1) Actual range depend on sensor used and may vary from the range stated above.    ������  �    Status                            �   �  �    Instrument Handle                 � G  �  x    Channel                           � G � �  x    Resolution                         	               1    3    �    This function returns the number of significant places for linear units and the number of decimal places for logarithmic units which should be free of noise in the measurement result. 

Remote-control command(s):
SENS:AVER:COUN:AUTO:RES?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the number of significant places for linear units and the number of decimal places for logarithmic units which should be free of noise in the measurement result.

Valid Range:
1 to 4    �@����  �    Status                            �a   �  �    Instrument Handle                 �  G  �  x    Channel                           �n G� �  x    Resolution                         	               1    	            �    This function selects a method by which the automatic filter length switchover can operate.

Remote-control command(s):
SENS:AVER:COUN:AUTO:TYPE RES | NSR        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control selects a method by which the automatic filter length switchover can operate.

Valid Values:
RSNRPZ_AUTO_COUNT_TYPE_RESOLUTION (0) - Resolution (Default Value)
RSNRPZ_AUTO_COUNT_TYPE_NSR (1) - Noise Ratio    ������  �    Status                            ��   �  �    Instrument Handle                 � G  �  x    Channel                          
 G � � x    Method                             	               1               TResolution RSNRPZ_AUTO_COUNT_TYPE_RESOLUTION Noise Ratio RSNRPZ_AUTO_COUNT_TYPE_NSR    �    This function returns a method by which the automatic filter length switchover can operate.

Remote-control command(s):
SENS:AVER:COUN:AUTO:TYPE?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns a method by which the automatic filter length switchover can operate.

Valid Values:
Resolution (RSNRPZ_AUTO_COUNT_TYPE_RESOLUTION)
Noise Ratio (RSNRPZ_AUTO_COUNT_TYPE_NSR)   �����  �    Status                           �   �  �    Instrument Handle                � G  �  x    Channel                          	 G� �  x    Method                             	               1    	            �    This function sets the filter bandwidth. The wider the filter the lower the noise and the longer it takes to obtain a measured value.

Remote-control command(s):
SENS:AVER:COUN        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the filter bandwidth.

Valid Range:
1 - 65536

Default Value: 4

Notes:
(1) Actual valid range depends on sensor used   |����  �    Status                           �   �  �    Instrument Handle                < G  �  x    Channel                          � G � �  x    Count                              	               1    4    Y    This function returns the filter bandwidth.

Remote-control command(s):
SENS:AVER:COUN?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     ,    This control returns the filter bandwidth.   �����  �    Status                           �   �  �    Instrument Handle                J G  �  x    Channel                          � G� �  x    Count                              	               1    	           .    This function switches the filter function of a sensor on or off. When the filter is switched on, the number of measured values set with rsnrpz_avg_setCount() is averaged. This reduces the effect of noise so that more reliable results are obtained.

Remote-control command(s):
SENS:AVER:STAT ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control switches the filter function of a sensor on or off.

Valid Values:
VI_TRUE (1)  - On (Default Value)
VI_FALSE (0) - Off   ����  �    Status                           8   �  �    Instrument Handle                � G  �  x    Channel                          E G � �P      Averaging                          	               1   On VI_TRUE Off VI_FALSE    q    This function returns the state of the filter function of a sensor.

Remote-control command(s):
SENS:AVER:STAT?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     w    This control returns the state of the filter function of a sensor.

Valid Values:
VI_TRUE (1) - On
VI_FALSE (0) - Off   !P����  �    Status                           %q   �  �    Instrument Handle                & G  �  x    Channel                          &~ G� �  x    Averaging                          	               1    	            �    This function sets a timeslot whose measured value is used to automatically determine the filter length.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:AVER:COUN:AUTO:SLOT        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets a timeslot whose measured value is used to automatically determine the filter length.

Valid Range:

NRP-Z21: 1 - 8
FSH-Z1:  1 - 8

Default Value: 1   (�����  �    Status                           ,�   �  �    Instrument Handle                -� G  �  x    Channel                          -� G � �  x    Timeslot                           	               1    1    �    This function returns a timeslot whose measured value is used to automatically determine the filter length.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:AVER:COUN:AUTO:SLOT?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     l    This control returns a timeslot whose measured value is used to automatically determine the filter length.   0~����  �    Status                           4�   �  �    Instrument Handle                5> G  �  x    Channel                          5� G� �  x    Timeslot                           	               1    	            �    This function determines whether a new result is calculated immediately after a new measured value is available or only after an entire range of new values is available for the filter.

Remote-control command(s):
SENS:AVER:TCON MOV | REP        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control determines the type of terminal control.

Valid Values:
RSNRPZ_TERMINAL_CONTROL_MOVING (0) - Moving
RSNRPZ_TERMINAL_CONTROL_REPEAT (1) - Repeat (Default Value)   8����  �    Status                           <-   �  �    Instrument Handle                <� G  �  x    Channel                          =: G � � x    Terminal Control                   	               1              LMoving RSNRPZ_TERMINAL_CONTROL_MOVING Repeat RSNRPZ_TERMINAL_CONTROL_REPEAT    o    This function returns the type of terminal control.

Remote-control command(s):
SENSe[1..4]:AVERage:TCONtrol?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the type of terminal control.

Valid Values:
RSNRPZ_TERMINAL_CONTROL_MOVING (0) - Moving
RSNRPZ_TERMINAL_CONTROL_REPEAT (1) - Repeat (Default Value)   ?�����  �    Status                           C�   �  �    Instrument Handle                Dk G  �  x    Channel                          D� G� �  x    Terminal Control                   	               1    	            �    This function initializes the digital filter by deleting the stored measured values.

Remote-control command(s):
SENS:AVER:RES        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1   G	����  �    Status                           K*   �  �    Instrument Handle                K� G  �  x    Channel                            	               1    �    This function sets the automatic selection of a measurement range to ON or OFF.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:RANG:AUTO ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the automatic selection of a measurement range to ON or OFF.

Valid Values:
VI_TRUE (1)  - On (Default Value)
VI_FALSE (0) - Off   M�����  �    Status                           Q�   �  �    Instrument Handle                Ro G  �  x    Channel                          R� G � �y      Auto Range                         	               1   On VI_TRUE Off VI_FALSE    �    This function returns the state of automatic selection of a measurement range.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:RANG:AUTO?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the state of automatic selection of a measurement range.

Valid Values:
VI_TRUE (1) - On
VI_FALSE (0) - Off   U8����  �    Status                           YY   �  �    Instrument Handle                Y� G  �  x    Channel                          Zf G� �  x    Auto Range                         	               1    	           4    This function sets the cross-over level. Shifts the transition ranges between the measurement ranges. This may improve the measurement accuracy for special signals, i.e. signals with a high crest factor.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:RANG:AUTO:CLEV        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the cross-over level in dB.

Valid Range:

NRP-Z21: -20.0 - 0.0 dB
FSH-Z1:  -20.0 - 0.0 dB

Default Value: 0.0 dB

Notes:
(1) Actual valid range depends on sensor used   ]!����  �    Status                           aB   �  �    Instrument Handle                a� G  �  x    Channel                          bO G � �  x    Crossover Level                    	               1    0.0    �    This function reads the cross-over level.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:RANG:AUTO:CLEV?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors      �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     2    This control returns the cross-over level in dB.   d�����  �    Status                           h�   �  �    Instrument Handle                i^ G  �  x    Channel                          i� G� �  x    Crossover Level                    	               1    	           �    This function selects a measurement range in which the corresponding sensor is to perform a measurement.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:RANG 0 .. 2        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control selects a measurement range in which the corresponding sensor is to perform a measurement.

Valid Range:
NRP-Z21:  0 to 2
FSH-1:    0 to 2

Default Value: 2   k�����  �    Status                           o�   �  �    Instrument Handle                p� G  �  x    Channel                          p� G � �  x    Range                              	               1    2    �    This function returns a measurement range in which the corresponding sensor is to perform a measurement.

Note:

1) This function is not available for NRP-Z51

Remote-control command(s):
SENS:RANG?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     i    This control returns a measurement range in which the corresponding sensor is to perform a measurement.   so����  �    Status                           w�   �  �    Instrument Handle                x/ G  �  x    Channel                          x� G� �  x    Range                              	               1    	            �    This function configures all correction parameters.

Remote-control command(s):
SENS:CORR:OFFS
SENS:CORR:OFFS:STAT ON | OFF
SENS:CORR:SPD:STAT ON | OFF

        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     |    This control switches the offset correction on or off.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)     �    This control sets a fixed offset value can be defined for multiplying (logarithmically adding) the measured value of a sensor.

Valid Range:
  -200.0 to 200.0 dB


Default Value:
0.0 dB

Notes:
(1) Actual valid range depends on sensor used     .    This prameter is reserved. Value is ignored.     A    This prameter is reserved. Value is ignored.

Default Value:
""     �    This control enables or disables measured-value correction by means of the stored s-parameter device.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)

   z�����  �    Status                           ~�   �  �    Instrument Handle                f G  �  x    Channel                          � G � �      Offset State                     �X G �  x    Offset                           �Q � � �       Reserved 1                       �� � �  x    Reserved 2                       �� �� �       S-Parameter Enable                 	               1    On VI_TRUE Off VI_FALSE    0.0    On VI_TRUE Off VI_FALSE    ""    On VI_TRUE Off VI_FALSE       This function informs the R&S NRP about the frequency of the power to be measured since this frequency is not automatically determined. The frequency is used to determine a frequency-dependent correction factor for the measurement results.

Remote-control command(s):
SENS:FREQ        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    F    This control sets the frequency in Hz of the power to be measured since this frequency is not automatically determined.

Valid Range:

NRP-Z21: 10.0e6 - 18.0e9
FSH-Z1:  10.0e6 -  8.0e9
NRP-Z51: 0.0    - 18.0e9 (depends on the calibration data)

Default Value: 50.0e6 Hz

Notes:
(1) Actual valid range depends on sensor used.   ������  �    Status                           ��   �  �    Instrument Handle                � G  �  x    Channel                          �� G � �  x    Frequency                          	               1    50.0e6    �    This function queries the instrument for the frequency of the power to be measured since this frequency is not automatically determined.

Remote-control command(s):
SENSe[1..4]:FREQuency?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     |    This control returns the frequency in Hz of the power to be measured since this frequency is not automatically determined.   ������  �    Status                           �   �  �    Instrument Handle                �� G  �  x    Channel                          �! =� �  x    Frequency                          	               1    	          B    If the frequency step parameter is set to a value greater than 0.0 the sensor does a internal frequency increment if buffered mode is enabled

Depending on the parameter "frequency spacing" the sensor adds this value to the current frequency or it multiplies this value with the current frequency.

This function is used to do a simple scalar network nalysis. 
To enable this automativally frequency stepping you have to configure CONTAV sensor mode, enable buffered measurements and set frequency stepping to a value greater than 0.

Remote-control command(s):
SENS:FREQ:STEP        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the frequency step value.

Valid Range:
0 to 0.5 * MAXfreq

Default Value: 0.0

Notes:
(1) Actual valid range depends on sensor used.   ������  �    Status                           �   �  �    Instrument Handle                �� G  �  x    Channel                          � G � �  x    Frequency Step                     	               1    0.0    ]    This function returns the frequency step value.

Remote-control command(s):
SENS:FREQ:STEP?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     0    This control returns the frequency step value.   �����  �    Status                           �)   �  �    Instrument Handle                �� G  �  x    Channel                          �6 G� �  x    Frequency Step                     	               1    	          o    If scalar network analysis is enabled this parameter defines how the frequency is incremented.

Linear spacing means that the frequency step value is added to the current frequency after each buffered measurement.
Logarithmic spacing means that the frequency step value is multiplied with the current frequency after each buffered measurement.

This command is used to do a simple scalar network nalysis. 
To enable this automativally frequency stepping you have to configure CONTAV sensor mode, enable buffered measurements and set frequency stepping to a value greater than 0.

Remote-control command(s):
SENS:FREQ:SPAC        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    c    This control selects the frequency spacing value.

Valid Range:
RSNRPZ_SPACING_LINEAR (0) - Linear
RSNRPZ_SPACING_LOG    (1) - Logarithmic

Default Value: RSNRPZ_SPACING_LINEAR (0)

Note(s):

(1) Linear: linear increment of correction frequency (spacing is added).

(2) Logarithmic: logarithmic increment of corrcetion frequency (spacing is multiplied).   ������  �    Status                           ��   �  �    Instrument Handle                �� G  �  x    Channel                          � G � � x    Frequency Spacing                  	               1               <Linear RSNRPZ_SPACING_LINEAR Logarithmic RSNRPZ_SPACING_LOG    `    This function returns the frequency spacing value.

Remote-control command(s):
SENS:FREQ:SPAC?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    9    This control returns the frequency spacing value.

Valid Range:
RSNRPZ_SPACING_LINEAR (0) - Linear
RSNRPZ_SPACING_LOG    (1) - Logarithmic

Note(s):

(1) Linear: linear increment of correction frequency (spacing is added).

(2) Logarithmic: logarithmic increment of corrcetion frequency (spacing is multiplied).   �����  �    Status                           �0   �  �    Instrument Handle                �� G  �  x    Channel                          �= G� �  x    Frequency Spacing                  	               1    	            �    With this function a fixed offset value can be defined for multiplying (logarithmically adding) the measured value of a sensor.

Remote-control command(s):
SENS:CORR:OFFS        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets a fixed offset value can be defined for multiplying (logarithmically adding) the measured value of a sensor.

Valid Range:
  -200.0 to 200.0 dB

Default Value:
0.0 dB

Notes:
(1) Actual valid range depends on sensor used   �'����  �    Status                           �H   �  �    Instrument Handle                �� G  �  x    Channel                          �U G � �  x    Offset                             	               1    0.0    �    This function gets a fixed offset value defined for multiplying (logarithmically adding) the measured value of a sensor.

Remote-control command(s):
SENS:CORR:OFFS?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     |    This control returns a fixed offset value defined for multiplying (logarithmically adding) the measured value of a sensor.   ������  �    Status                           �   �  �    Instrument Handle                ë G  �  x    Channel                          � G� �  x    Offset                             	               1    	           r    This function switches the offset correction on or off.

Remote-control command(s):
SENS:CORR:OFFS:STAT ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     }    This control switches the offset correction on or off.

Valid Values:
VI_TRUE (1)  - On 
VI_FALSE (0) - Off (Default Value)   �����  �    Status                           �-   �  �    Instrument Handle                �� G  �  x    Channel                          �: G � �o      Offset State                       	               1    On VI_TRUE Off VI_FALSE    i    This function returns the offset correction on or off.

Remote-control command(s):
SENS:CORR:OFFS:STAT?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     j    This control returns the offset correction on or off.

Valid Values:
VI_TRUE (1) - On
VI_FALSE (0) - Off   �4����  �    Status                           �U   �  �    Instrument Handle                �� G  �  x    Channel                          �b G� �  x    Offset State                       	               1    	            �    This function instructs the sensor to perform a measured-value correction by means of the stored s-parameter device.

Remote-control command(s):
SENS:CORR:SPD:STAT ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control enables or disables measured-value correction by means of the stored s-parameter device.

Valid Values:
VI_TRUE (1)  - On
VI_FALSE (0) - Off (Default Value)

   �����  �    Status                           ؠ   �  �    Instrument Handle                �? G  �  x    Channel                          ٭ G � �       S-Parameter Enable                 	               1    On VI_TRUE Off VI_FALSE    �    This function returns the state of a measured-value correction by means of the stored s-parameter device.

Remote-control command(s):
SENSe[1..4]:CORRection:SPDevice:STATe?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     n    This control returns the state of S-Parameter correction.

Valid Values:
VI_TRUE (1) - On
VI_FALSE (0) - Off   �����  �    Status                           �=   �  �    Instrument Handle                �� G  �  x    Channel                          �J G� �  x    S-Parameter Correction             	               1    	           r    This function can be used to select a loaded data set for S-parameter correction. This data set is accessed by means of a consecutive number, starting with 1 for the first data set. If an invalid data set consecutive number is entered, an error message is output.

Note(s):

(1) This function is available only on NRP-Z81.

Remote-control command(s):
SENS:CORR:SPD:SEL        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    	    This control can be used to select a loaded data set for S-parameter correction. This data set is accessed by means of a consecutive number, starting with 1 for the first data set. If an invalid data set consecutive number is entered, an error message is output.
   �/����  �    Status                           �P   �  �    Instrument Handle                �� G  �  x    Channel                          �] G � �  `    S-Parameter                        	               1    0    �    This function gets selected data set for S-parameter correction. 

Note(s):

(1) This function is available only on NRP-Z81.

Remote-control command(s):
SENS:CORR:SPD:SEL?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     F    This control returns selected data set for S-parameter correction. 
   �����  �    Status                           �2   �  �    Instrument Handle                �� G  �  x    Channel                          �? G � �  `    S-Parameter                        	               1    	            �    This function gets list of S-Parameter devices. 

Note(s):

(1) This function is available only on NRP-Z81.

Remote-control command(s):
SENS:CORR:SPD:LIST?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     Y    This control defines the size of buffer.

Valid Range:
not checked

Default Value: 1000     F    This control returns selected data set for S-parameter correction. 
   �'����  �    Status                           �H   �  �    Instrument Handle                �� G  �  x    Channel                          �U G � �  x    Buffer Size                      �� G� �  `    S-Parameter Device List            	               1    1000    	            �    This function sets the parameters of the reflection coefficient for measured-value correction.

Remote-control command(s):
SENS:SGAM
SENS:SGAM:PHAS
SENS:SGAM:CORR:STAT ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control enables or disables source gamma correction of the measured value.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)     �    This control sets the magnitude of the reflection coefficient.

Valid Range:

NRP-Z21 0.0 - 1.0
FSH-Z1: 0.0 - 1.0

Default Value: 1.0

Notes:
(1) Actual valid range depends on sensor used     �    This control defines the phase angle of the reflection coefficient. Units are degrees.

Valid Range:
-360.0 to 360.0 deg

Default Value:
0.0 deg

Notes:
(1) Actual valid range depends on sensor used   ������  �    Status                           �   �  �    Instrument Handle                �� G  �  x    Channel                            G � �       Source Gamma Correction           � G �  x    Magnitude                        � G� �  x    Phase                              	               1    On VI_TRUE Off VI_FALSE    1.0    0.0    �    This function sets the magnitude of the reflection coefficient for measured-value correction.

Remote-control command(s):
SENS:SGAM:MAGN        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the magnitude of the reflection coefficient.

Valid Range:

NRP-Z21 0.0 - 1.0
FSH-Z1: 0.0 - 1.0

Default Value: 1.0

Notes:
(1) Actual valid range depends on sensor used   ^����  �    Status                              �  �    Instrument Handle                	 G  �  x    Channel                          	� G � �  x    Magnitude                          	               1    1.0    �    This function reads the magnitude of the reflection coefficient for measured-value correction.

Remote-control command(s):
SENS:SGAM:MAGN?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     a    This control returns the magnitude of the reflection coefficient for measured-value correction.   �����  �    Status                           �   �  �    Instrument Handle                � G  �  x    Channel                           G� �  x    Magnitude                          	               1    	           �    This function sets the phase angle of the reflection coefficient for measured-value correction.

Remote-control command(s):
SENS:SGAM:PHAS        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control defines the phase angle of the reflection coefficient. Units are degrees.

Valid Range:
-360.0 to 360.0 deg

Default Value:
0.0 deg

Notes:
(1) Actual valid range depends on sensor used   �����  �    Status                              �  �    Instrument Handle                � G  �  x    Channel                          # G � �  x    Phase                              	               1    0.0    �    This function reads the phase angle of the reflection coefficient for measured-value correction.

Remote-control command(s):
SENS:SGAM:PHAS?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     X    This control returns the phase angle of the reflection coefficient. Units are degrees.   y����  �    Status                           �   �  �    Instrument Handle                9 G  �  x    Channel                          � G� �  x    Phase                              	               1    	           �    This function switches the measured-value correction of the reflection coefficient effect of the source gamma ON or OFF.

Remote-control command(s):
SENS:SGAM:CORR:STAT ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control enables or disables source gamma correction of the measured value.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)   !�����  �    Status                           %�   �  �    Instrument Handle                &w G  �  x    Channel                          &� G � �       Source Gamma Correction            	               1    On VI_TRUE Off VI_FALSE    l    This function reads the state of source gamma correction.

Remote-control command(s):
SENS:RGAM:CORR:STAT?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     p    This control returns the state of source gamma correction.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   (�����  �    Status                           -   �  �    Instrument Handle                -� G  �  x    Channel                          .( G� �  x    Source Gamma Correction            	               1    	            �    This function sets the parameters of the compensation of the load distortion at the signal output.

Note(s):

(1) This function is available only for sensors NRP-Z27 and NRP-Z37

Remote-control command(s):
SENS:RGAM
SENS:RGAM:PHAS
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the magnitude of the reflection coefficient of the load for distortion compensation.

Valid Range:
0.0 - 1.0

Default Value: 0.0     �    This control defines the phase angle (in degrees) of the complex reflection factor of the load at the signal output.

Valid Range:
-360.0 to 360.0 deg

Default Value:
0.0 deg

Notes:
(1) Actual valid range depends on sensor used   0�����  �    Status                           4�   �  �    Instrument Handle                5F G  �  x    Channel                          5� G �  x    Magnitude                        6P G� �  x    Phase                              	               1    0.0    0.0   �    This function sets the magnitude of the reflection coefficient of the load for distortion compensation.
To deactivate distortion compensation, set Magnitude to 0. Distortion compensation should remain deactivated in the case of questionable measurement values for the reflection coefficient of the load.

Note(s):

(1) This function is available only for sensors NRP-Z27 and NRP-Z37

Remote-control command(s):
SENS:RGAM:MAGN        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the magnitude of the reflection coefficient of the load for distortion compensation.

Valid Range:
0.0 - 1.0

Default Value: 0.0   :����  �    Status                           >>   �  �    Instrument Handle                >� G  �  x    Channel                          ?K G � �  x    Magnitude                          	               1    0.0    �    This function reads the magnitude of the reflection coefficient of the load for distortion compensation.

Note(s):

(1) This function is available only for sensors NRP-Z27 and NRP-Z37

Remote-control command(s):
SENS:RGAM:MAGN?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     k    This control returns the magnitude of the reflection coefficient of the load for distortion compensation.   A�����  �    Status                           E�   �  �    Instrument Handle                F� G  �  x    Channel                          F� G� �  x    Magnitude                          	               1    	           �    This function defines the phase angle (in degrees) of the complex reflection factor of the load at the signal output.

Note(s):

(1) This function is available only for sensors NRP-Z27 and NRP-Z37

Remote-control command(s):
SENS:RGAM:PHAS        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control defines the phase angle (in degrees) of the complex reflection factor of the load at the signal output.

Valid Range:
-360.0 to 360.0 deg

Default Value:
0.0 deg

Notes:
(1) Actual valid range depends on sensor used   IS����  �    Status                           Mt   �  �    Instrument Handle                N G  �  x    Channel                          N� G � �  x    Phase                              	               1    0.0    �    This function reads the phase angle (in degrees) of the complex reflection factor of the load at the signal output.

Note(s):

(1) This function is available only for sensors NRP-Z27 and NRP-Z37

Remote-control command(s):
SENS:RGAM:PHAS?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     v    This control returns the phase angle (in degrees) of the complex reflection factor of the load at the signal output.   QW����  �    Status                           Ux   �  �    Instrument Handle                V G  �  x    Channel                          V� G� �  x    Phase                              	               1    	           �    This function defines reflection gamma uncertainty.

Note(s):

(1) This function is available only for sensors NRP-Z27 and NRP-Z37

Remote-control command(s):
SENS:RGAM:EUNC        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     T    This control defines the uncertainty.

Valid Range:
0.0 to 1.0

Default Value:
0.0   X�����  �    Status                           \�   �  �    Instrument Handle                ]o G  �  x    Channel                          ]� G � �  x    Uncertainty                        	               1    0.0    �    This function queries reflection gamma uncertainty.

Note(s):

(1) This function is available only for sensors NRP-Z27 and NRP-Z37

Remote-control command(s):
SENS:RGAM:EUNC?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     @    This control returns the uncertainty.

Valid Range:
0.0 to 1.0   _�����  �    Status                           d   �  �    Instrument Handle                d� G  �  x    Channel                          e G � �  x    Uncertainty                        	               1    	           }    This function configures all duty cycle parameters.

Remote-control command(s):
SENS:CORR:DCYC
SENS:CORR:DCYC:STAT ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control switches measured-value correction for a specific duty cycle on or off.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)     �    This control sets the duty cycle of power to be measured.

Valid Range:
0.001 - 99.999%

Default Value: 1.0 %

Notes:
(1) Actual valid range depends on sensor used   f�����  �    Status                           j�   �  �    Instrument Handle                k� G  �  x    Channel                          k� G � �o      Duty Cycle State                 l� G �  x    Duty Cycle                         	               1    On VI_TRUE Off VI_FALSE    1.0   �    This function informs the R&S NRP about the duty cycle of the power to be measured. Specifying a duty cycle only makes sense in the ContAv mode where measurements are performed continuously without taking the timing of the signal into account. For this reason, this setting can only be chosen in the local mode when the sensor performs measurements in the ContAv mode.

Remote-control command(s):
SENS:CORR:DCYC        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the duty cycle of power to be measured.

Valid Range:
0.001 - 99.999 %

Default Value: 1.0 %

Notes:
(1) Actual valid range depends on sensor used   p3����  �    Status                           tT   �  �    Instrument Handle                t� G  �  x    Channel                          ua G � �  x    Duty Cycle                         	               1    1.0    t    This function gets the size of duty cycle of the power to be measured.

Remote-control command(s):
SENS:CORR:DCYC?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     W    This control returns the size of duty cycle of the power to be measured. Units are %.   w{����  �    Status                           {�   �  �    Instrument Handle                |; G  �  x    Channel                          |� G� �  x    Duty Cycle                         	               1    	           �    This function switches measured-value correction for a specific duty cycle on or off.

Remote-control command(s):
SENS:CORR:DCYC:STAT ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control switches measured-value correction for a specific duty cycle on or off.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)   ~�����  �    Status                           ��   �  �    Instrument Handle                �U G  �  x    Channel                          �� G � �       Duty Cycle State                   	               1    On VI_TRUE Off VI_FALSE    `    This function gets the setting of duty cycle.

Remote-control command(s):
SENS:CORR:DCYC:STAT?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     c    This control returns the state of duty cycle.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   ������  �    Status                           ��   �  �    Instrument Handle                �� G  �  x    Channel                          �� G� �  x    Duty Cycle State                   	               1    	               This function determines the integration time for a single measurement in the ContAv mode. To increase the measurement accuracy, this integration is followed by a second averaging procedure in a window with a selectable number of values.

Remote-control command(s):
SENS:POW:AVG:APER        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control defines the ContAv Aperture in seconds.

Valid Range:
NRP-Z21:   0.1e-6 to 0.3 seconds
NRP-Z51:   0.1e-3 to 0.3 seconds
FSH-Z1:    0.1e-6 to 0.3 seconds

Default Value: 0.02 s

Notes:
(1) Actual valid range depends on sensor used   ������  �    Status                           ��   �  �    Instrument Handle                �D G  �  x    Channel                          �� G � �  x    ContAv Aperture                    	               1    0.02    n    This function queries the value of ContAv mode aperture size.

Remote-control command(s):
SENS:POW:AVG:APER?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     ;    This control returns the ContAv Aperture size in seconds.   �����  �    Status                           �6   �  �    Instrument Handle                �� G  �  x    Channel                          �C G� �  x    ContAv Aperture                    	               1    	          (    This function activates digital lowpass filtering of the sampled video signal.
The problem of instable display values due to a modulation of a test signal can also be eliminated by lowpass filtering of the video signal. The lowpass filter eliminates the variations of the display even in case of unperiodic modulation and does not require any other setting.
If the modulation is periodic, the setting of the sampling window is the better method since it allows for shorter measurement times.

Remote-control command(s):
SENS:POW:AVG:SMO:STAT ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the state of digital lowpass filtering of the sampled video signal.

Valid Values:
VI_TRUE  (1) - On (Default Value)
VI_FALSE (0) - Off   ������  �    Status                           ��   �  �    Instrument Handle                �k G  �  x    Channel                          �� G � �y      ContAv Smoothing                   	               1   On VI_TRUE Off VI_FALSE    �    This function gets the state of digital lowpass filtering of the sampled video signal.

Remote-control command(s):
SENS:POW:AVG:SMO:STAT?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the state of digital lowpass filtering of the sampled video signal.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   �����  �    Status                           �4   �  �    Instrument Handle                �� G  �  x    Channel                          �A G� �  x    ContAv Smoothing                   	               1    	               This function switches on the buffered ContAv mode, after which data blocks rather than single measured values are then  returned. In this mode a higher data rate is achieved than in the non-buffered ContAv mode.

Remote-control command(s):
SENS:POW:AVG:BUFF:STAT ON | OFF        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control turns on or off ContAv buffered measurement mode.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)   ������  �    Status                           �   �  �    Instrument Handle                �� G  �  x    Channel                          � G � �       ContAv Buffered Mode               	               1    On VI_TRUE Off VI_FALSE    z    This function returns the state of ContAv Buffered Measurement Mode.

Remote-control command(s):
SENS:POW:AVG:BUFF:STAT?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     E    This control returns the state of ContAv Buffered Measurement Mode.   �&����  �    Status                           �G   �  �    Instrument Handle                �� G  �  x    Channel                          �T G� �  x    ContAv Buffered Mode               	               1    	            �    This function sets the number of desired values for the buffered ContAv mode.

Remote-control command(s):
SENS:POW:AVG:BUFF:SIZE        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     t    This control sets the number of desired values for buffered ContAv mode.

Valid Range:
1 to 1024

Default Value: 1   � ����  �    Status                           �A   �  �    Instrument Handle                �� G  �  x    Channel                          �N G � �  x    Buffer Size                        	               1    1    �    This function returns the number of desired values for the buffered ContAv mode.

Remote-control command(s):
SENS:POW:AVG:BUFF:SIZE?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     k    This control returns the number of desired values for the buffered ContAv mode.

Valid Range:
1 to 400000   �F����  �    Status                           �g   �  �    Instrument Handle                � G  �  x    Channel                          �t G� �  x    Buffer Size                        	               1    	            �    This function returns the number of measurement values currently stored in the sensor buffer while the buffered measurement is running.

Remote-control command(s):
SENS:POW:AVG:BUFF:COUN?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the number of measurement values currently stored in the sensor buffer while the buffered measurement is running.   ɡ����  �    Status                           ��   �  �    Instrument Handle                �a G  �  x    Channel                          �� G� �  x    Buffer Count                       	               1    	            �    This function returns some important settings for the scalar network analysis.

Remote-control command(s):
SENS:POW:AVG:BUFF:INFO? <Info Type>        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control specifies which info should be retrieved from the sensor. If no infoType is given the sensor returns the complete information string.

Valid Values:
 "FAST"
 "NORMAL"
 "HIGHPRECISION"
 "TRACEMODE"

Default Value:
""     T    This control defines the size of array 'Info'.

Valid Range:
-

Default Value:
100    �    This control returns some important settings for the scalar network analysis.

The information for the types "FAST", "NORMAL" and "HIGHPRECISION" is a comma separated string including the following fields:

1.) infotype,
2.) aperture time
3.) average count
4.) min. time between two trigger events 
5.) trigger delay
6.) flag if this mode is available (0 if not)

The type "TRACEMODE" returns a "1" if tracemode is supported by the sensor.   ������  �    Status                           �   �  �    Instrument Handle                լ G # �  x    Channel                          � G � �  x    Info Type                        � G� �  x    Array Size                       �d �  � �    Info                               	               1    ""        	           K    The end of a burst (power pulse) is recognized when the signal level drops below the trigger level. Especially with modulated signals, this may also happen for a short time within a burst. To prevent the supposed end of the burst is from being recognized too early or incorrectly at these positions, a time interval can be defined via using this function (drop-out tolerance parameter) in which the pulse end is only recognized if the signal level no longer exceeds the trigger level.

Note:

1) This function is not available for NRP-Z51

Remote-control command(s):
SENS:POW:BURS:DTOL    $    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors
     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This parameter defines the Drop-Out Tolerance time interval in seconds.

Valid Range:
0.0 to 3.0e-3 seconds

Default Value: 100.0e-6 s

Notes:
(1) Actual valid range depends on sensor used   ������  �    Status                           �   �  �    Instrument Handle                � G  �  x    Channel                          � G � �  x    Drop-out Tolerance                 	               1    	100.0e-6    �    This function returns the drop-out tolerance parameter.

Note:

1) This function is not available for NRP-Z51

Remote-control command(s):
SENS:POW:BURS:DTOL?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     8    This control returns the drop-out tolerance parameter.   �|����  �    Status                           �   �  �    Instrument Handle                �F G  �  x    Channel                          � G� �  x    Drop-out Tolerance                 	               1    	              This function enables or disables the chopper in BurstAv mode. Disabling the chopper is only good for fast but unexact and noisy measurements. If the chopper is disabled, averaging is ignored internally also disabled.

Remote-control command(s):
SENSe:POWer:BURSt:CHOPper:STATe        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control enables or disables the chopper for BurstAv mode.

Valid Values:
VI_TRUE  (1) - On (Default Value)
VI_FALSE (0) - Off   �����  �    Status                           �)   �  �    Instrument Handle                �� G  �  x    Channel                          �6 G
 �i      BurstAv Chopper                    	               1   On VI_TRUE Off VI_FALSE    ~    This function queries the state of the chopper in BurstAv mode.

Remote-control command(s):
SENSe:POWer:BURSt:CHOPper:STATe?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     A    This control returns the state of the chopper for BurstAv mode.   �L����  �    Status                           �m   �  �    Instrument Handle                � G  �  x    Channel                          �z G� �  x    BurstAv Chopper                    	               1    	               This function configures the timegate (depends on trigger event) in which the sensor is doing statistic measurements.

Remote-control command(s):
SENSe:STATistics:OFFSet:TIME
SENSe:STATistics:TIME
SENSe:STATistics:[EXCLude]:MID:OFFSet[:TIME]
SENSe:STATistics:[EXCLude]:MID:TIME    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the start after the trigger of the timegate in which the sensor is doing statistic measurements.

Valid Range:


Default Value: 0.0 s     �    This control sets the length of the timegate in which the sensor is doing statistic measurements.

Valid Range:
1.0E-6 to 0.3 s

Default Value: 0.01 s     �    This control sets the midamble offset after timeslot start in seconds in the timegate in which the sensor is doing statistic measurements.

Valid Range:
0.0 to 10.0 s

Default Value: 0.0 s     e    This control sets the midamble length in seconds.

Valid Range:
0.0 to 10.0 s

Default Value: 0.0 s   ������  �    Status                           �   �  �    Instrument Handle                �� G F �  x    Channel                            G � �  x    Offset                            � Gl �  x    Time                             P � � �  x    Midamble Offset                   �  �  x    Midamble Length                    	               1    0.0    0.01    0.0    0.0    �    This function sets the X-Axis of statistical measurement.

Remote-control command(s):
SENSe:STATistics:SCALE:X:RLEVel
SENSe:STATistics:SCALE:X:RANGe
SENSe:STATistics:SCALE:X:POINts    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    3    This control sets the lower limit of the level range for the analysis result in both Statistics modes. This level can be assigned to the first pixel. The level assigned to the last pixel is equal to the level of the first pixel plus the level range.

Valid Range:
-80.0 to 20.0 dB

Default Value: -30.0 dB     �    This control sets the width of the level range for the analysis result in both Statistics modes.

Valid Range:
0.01 to 100.0

Default Value: 50.0    �    This control sets the measurement-result resolution in both Statistics modes. This function specifies the number of pixels that are to be assigned to the logarithmic level range (rsnrpz_stat_setScaleRange function) for measured value output. The width of the level range divided by N-1, where N is the number of pixels, must not be less than the value which can be read out with rsnrpz_stat_getScaleWidth.

Valid Range:
3 to 8192

Default Value: 200   �����  �    Status                           	   �  �    Instrument Handle                	� G 2 �  x    Channel                          
 G � �  x    Reference Level                  Y G� �  x    Range                            � � � �  x    Points                             	               1    -30.0    50.0    200    �    This function sets the start after the trigger of the timegate in which the sensor is doing statistic measurements.

Remote-control command(s):
SENSe:STATistics:OFFSet:TIME    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the start after the trigger of the timegate in which the sensor is doing statistic measurements.

Valid Range:


Default Value: 0.0 s   �����  �    Status                              �  �    Instrument Handle                � G  �  x    Channel                           G� �  x    Offset                             	               1    0.0    �    This function queries the start after the trigger of the timegate in which the sensor is doing statistic measurements.

Remote-control command(s):
SENSe:STATistics:OFFSet:TIME?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     w    This control returns the start after the trigger of the timegate in which the sensor is doing statistic measurements.   c����  �    Status                           �   �  �    Instrument Handle                - G  �  x    Channel                          � G� �  x    Offset                             	               1    	           �    This function sets the length of the timegate in which the sensor is doing statistic measurements.

Remote-control command(s):
SENSe:STATistics:TIME    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the length of the timegate in which the sensor is doing statistic measurements.

Valid Range:
1.0E-6 to 0.3 s

Default Value: 0.01 s   �����  �    Status                           "�   �  �    Instrument Handle                #w G  �  x    Channel                          #� G� �  x    Time                               	               1    0.01    �    This function queries the length of the timegate in which the sensor is doing statistic measurements.

Remote-control command(s):
SENSe:STATistics:TIME?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     f    This control returns the length of the timegate in which the sensor is doing statistic measurements.   &����  �    Status                           *C   �  �    Instrument Handle                *� G  �  x    Channel                          +P G� �  x    Time                               	               1    	           �    This function sets the midamble offset after timeslot start in seconds in the timegate in which the sensor is doing statistic measurements.

Remote-control command(s):
SENSe:STATistics:[EXCLude]:MID:OFFSet[:TIME]    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the midamble offset after timeslot start in seconds in the timegate in which the sensor is doing statistic measurements.

Valid Range:
0.0 to 10.0 s

Default Value: 0.0 s   -�����  �    Status                           1�   �  �    Instrument Handle                2[ G  �  x    Channel                          2� G� �  x    Offset                             	               1    0.0    �    This function queries the midamble offset after timeslot start in seconds in the timegate in which the sensor is doing statistic measurements.

Remote-control command(s):
SENSe:STATistics:[EXCLude]:MID:OFFSet[:TIME]?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the midamble offset after timeslot start in seconds in the timegate in which the sensor is doing statistic measurements.   5a����  �    Status                           9�   �  �    Instrument Handle                :+ G  �  x    Channel                          :� G� �  x    Offset                             	               1    	           t    This function sets the midamble length in seconds.

Remote-control command(s):
SENSe:STATistics:[EXCLude]:MID:TIME    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     e    This control sets the midamble length in seconds.

Valid Range:
0.0 to 10.0 s

Default Value: 0.0 s   <�����  �    Status                           @�   �  �    Instrument Handle                Ak G  �  x    Channel                          A� G� �  x    Length                             	               1    0.0    x    This function queries the midamble length in seconds.

Remote-control command(s):
SENSe:STATistics:[EXCLude]:MID:TIME?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     6    This control returns the midamble length in seconds.   C�����  �    Status                           G�   �  �    Instrument Handle                H� G  �  x    Channel                          H� G� �  x    Length                             	               1    	          8    This function sets the lower limit of the level range for the analysis result in both Statistics modes. This level can be assigned to the first pixel. The level assigned to the last pixel is equal to the level of the first pixel plus the level range.

Remote-control command(s):
SENSe:STATistics:SCALE:X:RLEVel    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    3    This control sets the lower limit of the level range for the analysis result in both Statistics modes. This level can be assigned to the first pixel. The level assigned to the last pixel is equal to the level of the first pixel plus the level range.

Valid Range:
-80.0 to 20.0 dB

Default Value: -30.0 dB   Ka����  �    Status                           O�   �  �    Instrument Handle                P+ G  �  x    Channel                          P� G� �  x    Reference Level                    	               1    -30.0   <    This function queries the lower limit of the level range for the analysis result in both Statistics modes. This level can be assigned to the first pixel. The level assigned to the last pixel is equal to the level of the first pixel plus the level range.

Remote-control command(s):
SENSe:STATistics:SCALE:X:RLEVel?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1        This control returns the lower limit of the level range for the analysis result in both Statistics modes. This level can be assigned to the first pixel. The level assigned to the last pixel is equal to the level of the first pixel plus the level range.

Valid Range:
-80.0 to 20.0 dBm   T
����  �    Status                           X5   �  �    Instrument Handle                X� G  �  x    Channel                          YB G� �  x    Reference Level                    	               1    	           �    This function sets the width of the level range for the analysis result in both Statistics modes.

Remote-control command(s):
SENSe:STATistics:SCALE:X:RANGe    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the width of the level range for the analysis result in both Statistics modes.

Valid Range:
0.01 to 100.0

Default Value: 50.0   \����  �    Status                           `.   �  �    Instrument Handle                `� G  �  x    Channel                          a; G� �  x    Range                              	               1    50.0    �    This function queries the width of the level range for the analysis result in both Statistics modes.

Remote-control command(s):
SENSe:STATistics:SCALE:X:RANGe?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1         This control returns the width of the level range for the analysis result in both Statistics modes.

Valid Range:
0.01 to 100   cq����  �    Status                           g�   �  �    Instrument Handle                h; G  �  x    Channel                          h� G� �  x    Range                              	               1    	          �    This function sets the measurement-result resolution in both Statistics modes. This function specifies the number of pixels that are to be assigned to the logarithmic level range (rsnrpz_stat_setScaleRange function) for measured value output. The width of the level range divided by N-1, where N is the number of pixels, must not be less than the value which can be read out with rsnrpz_stat_getScaleWidth.

Remote-control command(s):
SENSe:STATistics:SCALE:X:POINts    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     v    This control the measurement-result resolution in both Statistics modes.

Valid Range:
3 to 8192

Default Value: 200   l����  �    Status                           p,   �  �    Instrument Handle                p� G  �  x    Channel                          q9 G� �  x    Points                             	               1    200    �    This function queries the measurement-result resolution in both Statistics modes.

Remote-control command(s):
SENSe:STATistics:SCALE:X:POINts?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     j    This control returns the measurement-result resolution in both Statistics modes.

Valid Range:
3 to 8192   s?����  �    Status                           wj   �  �    Instrument Handle                x	 G  �  x    Channel                          xw G� �  x    Points                             	               1    	           �    This function queries the greatest attainable level resolution. For the R&S NRP-Z81 power sensor, this value is fixed at 0.006 dB per pixel. If this value is exceeded, a "Settings conflict" message is output. The reason for the conflict may be that the number of pixels that has been selected is too great or that the width chosen for the level range is too small (rsnrpz_stat_setScalePoints and rsnrpz_stat_setScaleRange functions).

Remote-control command(s):
SENSe:STATistics:SCALE:X:MPWidth?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     @    This control returns the greatest attainable level resolution.   {�����  �    Status                           �   �  �    Instrument Handle                �� G  �  x    Channel                          � G� �  x    Width                              	               1    	           �    This function configures the parameters of Timeslot measurement mode. Both exclude start and stop are set to 10% of timeslot width each.

Remote-control command(s):
SENS:POW:TSL:AVG:COUN
SENS:POW:TSL:AVG:WIDT
SENS:TIM:EXCL:STAR
SENS:TIM:EXCL:STOP    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the number of simultaneously measured timeslots in the Timeslot mode.

Valid Range:
1 - 128

Default Value:
8

Notes:
(1) Actual valid range depends on sensor used     �    This control sets the length in seconds of the timeslot in the Timeslot mode.

Valid Range:
10.0e-6 - 0.1

Default Value: 1.0e-3 s

Notes:
(1) Actual valid range depends on sensor used   �L����  �    Status                           �w   �  �    Instrument Handle                � G  �  x    Channel                          �� G � �  x    Time Slot Count                  �C G? �  x    Width                              	               1    8    1.0e-3    �    This function sets the number of simultaneously measured timeslots in the Timeslot mode.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:POW:TSL:AVG:COUN    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the number of simultaneously measured timeslots in the Timeslot mode.

Valid Range:
1 - 128

Default Value:
8

Notes:
(1) Actual valid range depends on sensor used   ������  �    Status                           �(   �  �    Instrument Handle                �� G  �  x    Channel                          �5 G � �  x    Time Slot Count                    	               1    8    �    This function reads the number of simultaneously measured timeslots in the Timeslot mode.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:POW:TSL:AVG:COUN?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     \    This control returns the number of simultaneously measured timeslots in the Timeslot mode.   ������  �    Status                           ��   �  �    Instrument Handle                �y G  �  x    Channel                          �� G� �  x    Time Slot Count                    	               1    	            �    This function sets the length of the timeslot in the Timeslot mode.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:POW:TSL:AVG:WIDT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the length in seconds of the timeslot in the Timeslot mode.

Valid Range:
10.0e-6 - 0.1

Default Value: 1.0e-3 s

Notes:
(1) Actual valid range depends on sensor used   ������  �    Status                           �!   �  �    Instrument Handle                �� G  �  x    Channel                          �. G � �  x    Width                              	               1    1.0e-3    �    This function reads the length of the timeslot in the Timeslot mode.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:POW:TSL:AVG:WIDT?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     R    This control returns the length in seconds of the timeslot in the Timeslot mode.   ������  �    Status                           ��   �  �    Instrument Handle                �e G  �  x    Channel                          �� G� �  x    Width                              	               1    	          �    This function sets the start of an exclusion interval in a timeslot. In conjunction with the function rsnrpz_tslot_setTimeSlotMidLength, it is possible to exclude, for example, a midamble from the measurement. The start of the timeslot is used as the reference point for defining the start of the exclusion interval and this applies to each of the timeslots

Remote-control command(s):
SENSe:POWer:TSLot[:AVG]:MID:OFFSet
    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     {    This control sets sets the start of an exclusion interval in a timeslot.

Valid Range:
0.0 to 0.1 s

Default Value: 0.0 s   ������  �    Status                           ��   �  �    Instrument Handle                �� G  �  x    Channel                          �	 G � �  x    Offset                             	               1    0.0    �    This function queries the start of an exclusion interval in a timeslot.

Remote-control command(s):
SENSe:POWer:TSLot[:AVG]:MID:OFFSet?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     h    This control returns sets the start of an exclusion interval in a timeslot.

Valid Range:
0.0 to 0.1 s   �����  �    Status                           �8   �  �    Instrument Handle                �� G  �  x    Channel                          �E G � �  x    Offset                             	               1    	              This function sets the length of an exclusion interval in a timeslot. In conjunction with the function rsnrpz_tslot_setTimeSlotMidOffset, it can be used, for example, to exclude a midamble from the measurement.

Remote-control command(s):
SENSe:POWer:TSLot[:AVG]:MID:TIME
    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     u    This control sets the length of an exclusion interval in a timeslot.

Valid Range:
0.0 to 0.1

Default Value: 0.0 s   ������  �    Status                           ��   �  �    Instrument Handle                �� G  �  x    Channel                          �� G � �  x    Length                             	               1    0.0    �    This function queries the length of an exclusion interval in a timeslot.

Remote-control command(s):
SENSe:POWer:TSLot[:AVG]:MID:TIME?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     d    This control returns the length of an exclusion interval in a timeslot.

Valid Range:
0.0 to 0.1 s   ������  �    Status                           �$   �  �    Instrument Handle                �� G  �  x    Channel                          �1 G � �  x    Length                             	               1    	              This function enables or disables the chopper in Time Slot mode. Disabling the chopper is only good for fast but unexact and noisy measurements. If the chopper is disabled, averaging is ignored internally also disabled.

Remote-control command(s):
SENSe:POWer:TSLot[:AVG]:CHOPper:STATe        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control enables or disables the chopper for Time Slot mode.

Valid Values:
VI_TRUE  (1) - On (Default Value)
VI_FALSE (0) - Off   ȹ����  �    Status                           ��   �  �    Instrument Handle                �y G  �  x    Channel                          �� G
 �       Time Slot Chopper                  	               1   On VI_TRUE Off VI_FALSE    �    This function queries the state of the chopper in Time Slot mode.

Remote-control command(s):
SENSe:POWer:TSLot[:AVG]:CHOPper:STATe?        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     C    This control returns the state of the chopper for Time Slot mode.   �����  �    Status                           �(   �  �    Instrument Handle                �� G  �  x    Channel                          �5 G� �  x    Time Slot Chopper                  	               1    	            �    This function sets parameters of the Scope mode.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:POIN
SENS:TRAC:TIME
SENS:TRAC:OFFS:TIME
SENS:TRAC:REAL ON | OFF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the number of desired values per Scope sequence.

Valid Range:
1 to 1024

Default Value: 312

Notes:
(1) Actual valid range depends on sensor used     �    This control sets the value of scope time.

Valid Range:
0.1e-3 to 0.3 s

Default Value: 0.01 s

Notes:
(1) Actual valid range depends on sensor used     �    This control sets the value of offset time.

Valid Range:

-5.0e-3 to 100.0 s

Default Value: 0.0 s


Notes:
(1) Actual valid range depends on sensor used     {    This control sets the state of real-time measurement.

Valid Values:
VI_TRUE  (1) - On (Default Value)
VI_FALSE (0) - Off   �L����  �    Status                           �w   �  �    Instrument Handle                � G  �  x    Channel                          ܄ G � �  x    Scope Points                     �2 G �  x    Scope Time                       �� G� �  x    Offset Time                      �u �  �       Realtime                           	               1    312    0.01    0.0    On VI_TRUE Off VI_FALSE   �    This function performs fast zeroing, but can be called only in the sensor's Trace mode and Statistics modes. In any other measurement mode, the error message NRPERROR_CALZERO is output. Even though the execution time is shorter than that for standard zeroing by a factor of 100 or more, measurement accuracy is not affected. Fast zeroing is available for the entire frequency range.

Remote-control command(s):
CAL:ZERO:FAST:AUTO        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None   �h����  �    Status                           �   �  �    Instrument Handle                  	              �    For the Scope mode, this function switches the filter function of a sensor on or off. When the filter is switched on, the number of measured values set with SENS:TRAC:AVER:COUN (function rsnrpz_scope_setAverageCount) is averaged. This reduces the effect of noise so that more reliable results are obtained.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:AVER:STAT ON | OFF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control switches the filter function of a sensor on or off.

Valid Values:
VI_TRUE  (1) - On (Default Value)
VI_FALSE (0) - Off   �N����  �    Status                           �y   �  �    Instrument Handle                � G  �  x    Channel                          � G � �       Scope Averaging                    	               1   On VI_TRUE Off VI_FALSE    �    This function reads the state of filter function of a sensor.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:AVER:STAT?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     t    This control returns the state of filter function of a sensor.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   ������  �    Status                           ��   �  �    Instrument Handle                �� G  �  x    Channel                          �� G� �  x    Scope Averaging                    	               1    	            �    This function sets the length of the filter for the Scope mode. The wider the filter the lower the noise and the longer it takes to obtain a measured value.

Remote-control command(s):
SENS:TRAC:AVER:COUN    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the length of the filter for the Scope mode.

Valid Range:
1 to 65536

Default Value: 4

Notes:
(1) Actual valid range depends on sensor used   �F����  �    Status                           �q   �  �    Instrument Handle                � G  �  x    Channel                          �~ G � �  x    Count                              	               1    4    v    This function returns the length of the filter for the Scope mode.

Remote-control command(s):
SENS:TRAC:AVER:COUN?
    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     A    This control returns the averaging filter length in Scope mode.   ������  �    Status                           �   �  �    Instrument Handle                ] G  �  x    Channel                          � G� �  x    Count                              	               1    	           �    As soon as a new single value is determined, the filter window is advanced by one value so that the new value is taken into account by the filter and the oldest value is forgotten.
Terminal control then determines in the Scope mode whether a new result will be calculated immediately after a new measured value is available or only after an entire range of new values is available for the filter.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:AVER:TCON MOV | REP    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control determines the type of terminal control.

Valid Values:
 RSNRPZ_TERMINAL_CONTROL_MOVING - Moving
 RSNRPZ_TERMINAL_CONTROL_REPEAT - Repeat (Default Value)
   ����  �    Status                           ;   �  �    Instrument Handle                � G  �  x    Channel                          H G � � x    Terminal Control                   	               1              LMoving RSNRPZ_TERMINAL_CONTROL_MOVING Repeat RSNRPZ_TERMINAL_CONTROL_REPEAT    �    This function returns selected terminal control type in the Scope mode.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:AVER:TCON?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the type of terminal control.

Valid Values:
Moving (RSNRPZ_TERMINAL_CONTROL_MOVING)
Repeat (RSNRPZ_TERMINAL_CONTROL_REPEAT)   �����  �    Status                           !   �  �    Instrument Handle                � G  �  x    Channel                          . G� �  x    Terminal Control                   	               1    	            �    This function determines the relative position of the trigger event in relation to the beginning of the Scope measurement sequence.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:OFFS:TIME    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the value of offset time.

Valid Range:

-5.0e-3 to 100.0 s

Default Value: 0.0 s


Notes:
(1) Actual valid range depends on sensor used   �����  �    Status                           �   �  �    Instrument Handle                | G  �  x    Channel                          � G � �  x    Offset Time                        	               1    0.0    �    This function reads the relative position of the trigger event in relation to the beginning of the Scope measurement sequence.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:OFFS:TIME?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     ;    This control returns the value of offset time in seconds.   n����  �    Status                           #�   �  �    Instrument Handle                $8 G  �  x    Channel                          $� G� �  x    Offset Time                        	               1    	           �    This function sets the number of desired values per Scope sequence.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:POIN    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the number of desired values per Scope sequence.

Valid Range:
1 to 1024

Default Value: 312

Notes:
(1) Actual valid range depends on sensor used   &�����  �    Status                           *�   �  �    Instrument Handle                +W G  �  x    Channel                          +� G � �  x    Scope Points                       	               1    312    �    This function reads the number of desired values per Scope sequence.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:POIN?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     G    This control returns the number of desired values per Scope sequence.   .����  �    Status                           2?   �  �    Instrument Handle                2� G  �  x    Channel                          3L G� �  x    Scope Points                       	               1    	           a    In the default state (OFF), each measurement sequence from the sensor is averaged over several sequences. Since the measured values of a sequence may be closer to each other in time than the measurements, several measurement sequences with a slight time offset are also superimposed on the desired sequence. With the state turned ON - this effect can be switched off, which may increase the measurement speed. This ensures that the measured values of an individual sequence are immediately delivered.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:REAL ON | OFF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     |    This control sets the state of real-time measurement.

Valid Values:
VI_TRUE  (1) - On 
VI_FALSE (0) - Off (Default Value)   6�����  �    Status                           ;$   �  �    Instrument Handle                ;� G  �  x    Channel                          <1 G �       Realtime                           	               1    On VI_TRUE Off VI_FALSE    �    This function reads the state of real-time measurement setting.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:REAL?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     }    This control returns the state of real-time measurement.

Valid Values:
VI_TRUE (1) - On (Default Value)
VI_FALSE (0) - Off   >e����  �    Status                           B�   �  �    Instrument Handle                C/ G  �  x    Channel                          C� G} �  �    Realtime                           	               1    	            �    This function sets the time to be covered by the Scope sequence.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:TIME    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the value of scope time.

Valid Range:
0.1e-3 to 0.3 s

Default Value: 0.01 s

Notes:
(1) Actual valid range depends on sensor used   E�����  �    Status                           I�   �  �    Instrument Handle                J� G  �  x    Channel                          J� F � �  x    Scope Time                         	               1    0.01    �    This function reads the value of the time to be covered by the Scope sequence.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:TRAC:TIME?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     :    This control returns the value of scope time in seconds.   MF����  �    Status                           Qq   �  �    Instrument Handle                R G  �  x    Channel                          R~ G� �  x    Scope Time                         	               1    	           �    This function can be used to automatically determine a value for filter bandwidth.

Remote-control command(s):
SENS:TRAC:AVER:COUN:AUTO ON|OFF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1        This control activates or deactivates automatic determination of a value for filter bandwidth.
If the automatic switchover is activated with the ON parameter, the sensor always defines a suitable filter length.

Valid Values:
VI_FALSE (0) - Off
VI_TRUE  (1) - On (Default Value)   TM����  �    Status                           Xx   �  �    Instrument Handle                Y G  �  x    Channel                          Y� G � �       Auto Enabled                       	               1   On VI_TRUE Off VI_FALSE    �    This function queries the setting of automatic switchover of filter bandwidth.

Remote-control command(s):
SENS:TRAC:AVER:COUN:AUTO?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     P    This control returns the setting of automatic switchover of filter bandwidth.
   \7����  �    Status                           `b   �  �    Instrument Handle                a G  �  x    Channel                          ao G� �  x    Auto Enabled                       	               1    	                This function sets an upper time limit can be set via (maximum time). It should never be exceeded. Undesired long measurement times can thus be prevented if the automatic filter length switchover is on.

Remote-control command(s):
SENS:TRAC:AVER:COUN:AUTO:MTIM    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the upper time limit (maximum time to fill the filter).

Valid Range:

NRP-21: 0.01 - 999.99
FSH-Z1: 0.01 - 999.99

Default Value: 4.0

Notes:
(1) This value is not range checked, the actual range depends on sensor used.   c�����  �    Status                           g�   �  �    Instrument Handle                h� G  �  x    Channel                          i G � �  x    Upper Time Limit                   	               1    4.0    �    This function queries an upper time limit (maximum time to fill the filter).

Remote-control command(s):
SENS:TRAC:AVER:COUN:AUTO:MTIM    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     M    This control returns an upper time limit (maximum time to fill the filter).   k{����  �    Status                           o�   �  �    Instrument Handle                pE G  �  x    Channel                          p� G� �  x    Upper Time Limit                   	               1    	           �    This function sets the maximum noise ratio in the measurement result.

Remote-control command(s):
SENS:TRAC:AVER:COUN:AUTO:NSR    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the maximum noise ratio in the measurement result. The value is set in dB.

Valid Range:

NRP-Z21: 0.0 - 1.0
FSH-Z1:  0.0 - 1.0

Default Value: 0.1

Notes:
(1) This value is not range checked; the actual range depends on sensor used.   r�����  �    Status                           v�   �  �    Instrument Handle                wO G  �  x    Channel                          w� G � �  x    Maximum Noise Ratio                	               1    0.1    w    This function queries the maximum noise signal ratio value.

Remote-control command(s):
SENS:TRAC:AVER:COUN:AUTO:NSR?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     :    This control returns a maximum noise signal ratio in dB.   z1����  �    Status                           ~\   �  �    Instrument Handle                ~� G  �  x    Channel                          i G� �  x    Maximum Noise Ratio                	               1    	          *    This function defines the number of significant places for linear units and the number of decimal places for logarithmic units which should be free of noise in the measurement result. This setting does not affect the setting of display.

Remote-control command(s):
SENS:AVER:COUN:AUTO:RES 1 ... 4    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    8    This control defines the number of significant places for linear units and the number of decimal places for logarithmic units which should be free of noise in the measurement result.

Valid Range:
1 to 4

Default Value: 3

Notes:
(1) Actual range depend on sensor used and may vary from the range stated above.   ������  �    Status                           ��   �  �    Instrument Handle                �� G  �  x    Channel                          �
 G � �  x    Resolution                         	               1    3    �    This function returns the number of significant places for linear units and the number of decimal places for logarithmic units which should be free of noise in the measurement result. 

Remote-control command(s):
SENS:AVER:COUN:AUTO:RES?    $    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors
     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the number of significant places for linear units and the number of decimal places for logarithmic units which should be free of noise in the measurement result.

Valid Range:
1 to 4   �/����  �    Status                           �[   �  �    Instrument Handle                �� G  �  x    Channel                          �h G� �  x    Resolution                         	               1    	            �    This function selects a method by which the automatic filter length switchover can operate.

Remote-control command(s):
SENS:TRAC:AVER:COUN:AUTO:TYPE RES | NSR    U    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control selects a method by which the automatic filter length switchover can operate.

Valid Values:
RSNRPZ_AUTO_COUNT_TYPE_RESOLUTION (0) - Resolution (Default Value)
RSNRPZ_AUTO_COUNT_TYPE_NSR (1) - Noise Ratio   ������  �    Status                           �8   �  �    Instrument Handle                �� G  �  x    Channel                          �E G � � x    Method                             	               1               TResolution RSNRPZ_AUTO_COUNT_TYPE_RESOLUTION Noise Ratio RSNRPZ_AUTO_COUNT_TYPE_NSR    �    This function returns a method by which the automatic filter length switchover can operate.

Remote-control command(s):
SENS:TRAC:AVER:COUN:AUTO:TYPE?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns a method by which the automatic filter length switchover can operate.

Valid Values:
Resolution (RSNRPZ_AUTO_COUNT_TYPE_RESOLUTION)
Noise Ratio (RSNRPZ_AUTO_COUNT_TYPE_NSR)   �����  �    Status                           �?   �  �    Instrument Handle                �� G  �  x    Channel                          �L G� �  x    Method                             	               1    	               This function activates or deactivates the automatic equivalent sampling if the resolution of the trace measurement is configured lower than a sample period.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:ESAM:AUTO    U    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control activates or deactivates the automatic equivalent sampling if the resolution of the trace measurement is configured lower than a sample period.

Valid Values:
VI_TRUE  (1) - On (Default Value)
VI_FALSE (0) - Off   �����  �    Status                           �w   �  �    Instrument Handle                � G  �  x    Channel                          �� G � �e      Scope Equivalent Sampling          	               1   On VI_TRUE Off VI_FALSE       This function returns the state of the automatic equivalent sampling if the resolution of the trace measurement is configured lower than a sample period.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:ESAM:AUTO?    U    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the state of the automatic equivalent sampling if the resolution of the trace measurement is configured lower than a sample period.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   �}����  �    Status                           ��   �  �    Instrument Handle                �y G  �  x    Channel                          �� G � �  `    Scope Equivalent Sampling          	               1    	           K    This function turns on or off the automatic pulse measurement feature. When traceMeasurements is set to on, the sensor tries to compute the pulse parameters for the current measured trace.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:STAT ON | OFF
SENS:TRAC:MEAS:AUTO ON | OFF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control switches the automatic pulse measurement feature.

Valid Values:
VI_TRUE  (1) - On (Default Value)
VI_FALSE (0) - Off   �����  �    Status                           �0   �  �    Instrument Handle                �� G  �  x    Channel                          �= G � �       Trace Measurements                 	               1   On VI_TRUE Off VI_FALSE    �    This function queries the state of the automatic pulse measurement feature.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:STAT?
SENS:TRAC:MEAS:TRAN:AUTO?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the state of the automatic pulse measurement feature.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   ������  �    Status                           ��   �  �    Instrument Handle                �n G  �  x    Channel                          �� G� �  `    Trace Measurements                 	               1    	            �    This function selects the algorithm for detecting the top and the base level of the pulsed signal.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:ALG HIST | INT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    �    This control selects the algorithm for detecting the top and the base level of the pulsed signal.

Valid Values:
RSNRPZ_SCOPE_MEAS_ALG_HIST (0) - Histogram (Default Value)
RSNRPZ_SCOPE_MEAS_ALG_INT  (1) - Integral

Note(s):

(1) Histogram - The Histogram Algorithm computes the pulse levels analysing the Histogram of the trace data. Toplevel and Baselevel are the bins with the maximum number of hits in the upper and the lower half of the histogram.
If  the signal has too much noise that there is no maximum bin, the algorithm returns the min and max peak sample values as base and top level.

(2) Integration - The Integration Algorithm tries to find the pulse top power by fitting a reference rectangle pulse into the pulse by doing the integration of the pulse power and the according voltages. This algorithm should be used if the energy content of the complete pulse (including rising and falling edges) is needed and not only the most probable top level.   �6����  �    Status                           �a   �  �    Instrument Handle                �  G  �  x    Channel                          �n G � � `    Algorithm                          	               1               KHistogram RSNRPZ_SCOPE_MEAS_ALG_HIST Integration RSNRPZ_SCOPE_MEAS_ALG_INT    �    This function queries selected algorithm for detecting the top and the base level of the pulsed signal.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:ALG?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns selected algorithm for detecting the top and the base level of the pulsed signal.

Valid Values:
RSNRPZ_SCOPE_MEAS_ALG_HIST (0) - Histogram
RSNRPZ_SCOPE_MEAS_ALG_INT  (1) - Integral   �V����  �    Status                           с   �  �    Instrument Handle                �  G  �  x    Channel                          Ҏ G� �  `    Algorithm                          	               1    	               This function defines the thresholds of the reference and transition levels that are used for the calculation  of the pulse's time parameter.
The duration reference level is used to calculate pulse duration and pulse period, the transition low and high levels are used to calculate the pulse transition�s rise/fall time and their occurrences.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:DEF:DUR:REF 
SENS:TRAC:MEAS:DEF:TRAN:LREF
SENS:TRAC:MEAS:DEF:TRAN:HREF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control defines duration reference level used to calculate pulse duration and pulse period.

Valid Range:
0.0 - 100.0 %

Default Value: 50.0 %
     �    This control defines transition low level used to calculate the pulse transition's rise time and its occurrences.

Valid Range:
0.0 - 100.0 %

Default Value: 10.0 %     �    This control defines transition high level used to calculate the pulse transition's fall time and its occurrences.

Valid Range:
0.0 - 100.0 %

Default Value: 90.0 %   �`����  �    Status                           ڋ   �  �    Instrument Handle                �* G  �  x    Channel                          ۘ G � �  `    Duration Ref                     �6 G2 �  `    Transition Low Ref               �� G� �  `    Transition High Ref                	               1    50.0    10.0    90.0   ;    This function queries the thresholds of the reference and transition levels that are used for the calculation  of the pulse's time parameter.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:DEF:DUR:REF? 
SENS:TRAC:MEAS:DEF:TRAN:LREF?
SENS:TRAC:MEAS:DEF:TRAN:HREF?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     L    This control defines duration reference level.

Valid Range:
0.0 - 100.0 %     H    This control returns transition low level.

Valid Range:
0.0 - 100.0 %     I    This control returns transition high level.

Valid Range:
0.0 - 100.0 %   �A����  �    Status                           �l   �  �    Instrument Handle                � G  �  x    Channel                          �y G � �  `    Duration Ref                     �� G2 �  `    Transition Low Ref               � G� �  `    Transition High Ref                	               1    	           	           	              This function defines measurement time which sets the duration of analysing the current trace for the pulse parameters. The measurement time could be used together with the measurement offset time to select the second (or any other) pulse in the trace and not the whole trace.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENSe:TRACe:MEAS:TIME    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    l    The measurement time is used to set the duration of analysing the current trace for the pulse parameters. The measurement time could be used together with the measurement offset time to select the second (or any other) pulse in the trace and not the whole trace.

To disable this "time gate" set the measurement time to 0.0.

Valid Range:
-

Default Value: 0.0 s   �l����  �    Status                           �   �  �    Instrument Handle                �6 G  �  x    Channel                          � G � �  x    Meas Time                          	               1    0.0    �    This function returns the measurement time.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENSe:TRACe:MEAS:TIME?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     ,    This control returns the measurement time.   �����  �    Status                           ��   �  �    Instrument Handle                �q G  �  x    Channel                          �� G� �  x    Meas Time                          	               1    	          |    This function defines offset time used to set the start point of analysing the current trace for the pulse parameters. The offset time could be used to start analysis from the second (or any other) pulse occurrence in the trace and not from the beginning of the trace.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENSe:TRACe:MEAS:OFFS:TIME    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    =    This control defines offset time used to set the start point of analysing the current trace for the pulse parameters. The offset time could be used to start analysis from the second (or any other) pulse occurrence in the trace and not from the beginning of the trace.

Valid Range:
0 - 0.99 s

Default Value: 0.0 s
   ������  �    Status                           ��   �  �    Instrument Handle                �V G  �  x    Channel                          �� G � �  `    Offset Time                        	               1    0.0    �    This function queries offset time used to set the start point of analysing the current trace for the pulse parameters.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENSe:TRACe:MEAS:OFFS:TIME?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     w    This control returns offset time used to set the start point of analysing the current trace for the pulse parameters.   �����  �    Status                              �  �    Instrument Handle                � G  �  x    Channel                            G� �  `    Offset Time                        	               1    	          �    This function returns the calculated pulse time parameters of the last recorded trace. If a parameter could not be calculated the returned value is NAN. The Sensor takes the time values when the trace crosses the reference level points for duration and period calculation.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:PULS:DCYC?
SENS:TRAC:MEAS:PULS:DUR?
SENS:TRAC:MEAS:PULS:PER?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     [    This control returns duty cycle value. Duty Cycle = (pulse duration / pulse period) * 100     �    This control returns pulse duration value. Pulse Duration is the time between the positive and the negative transition of one pulse.     }    This control returns pulse period value. Pulse Period is the time between two consecutive transitions of the same polarity.   
M����  �    Status                           x   �  �    Instrument Handle                 G  �  x    Channel                          � G � �  `    Duty Cycle                       � G9 �  `    Pulse Duration                   v G� �  `    Pulse Period                       	               1    	           	           	              This function returns the transition parameters of the last examined trace data.
The NRP Sensor always searches for the first rising edge and the first falling edge in the trace. If offset time is set greater than  zero the algorithm searches the edges from this time in the trace.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:TRAN:POS:DUR?
SENS:TRAC:MEAS:TRAN:POS:OCC?
SENS:TRAC:MEAS:TRAN:POS:OVER?
SENS:TRAC:MEAS:TRAN:NEG:DUR?
SENS:TRAC:MEAS:TRAN:NEG:OCC?
SENS:TRAC:MEAS:TRAN:NEG:OVER?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    Selects measured transition.

Valid Values:
RSNRPZ_SLOPE_POSITIVE (0) - Positive (Default Value)
RSNRPZ_SLOPE_NEGATIVE (1) - Negative     �    This control returns transition duration value. The positive transition duration is measured from the point when the trace crosses the low reference level until it reaches the high reference level. Negative transition is vice versa.     �    This control returns transition occurence value. The positive transition occurrence is the absolut time of the trace when it crosses the medial reference level.    �    This control returns overshoot value. The overshoot measures the height of the local maximum (minimum) following a rising (falling) transition. Overshoot is calculated in percent of the pulse amplitude (top level - base level).

Overshoot (pos) = 100 * (local maximum - top level) / (top level - base level)
Overshoot (neg) = 100 * (base level - local minimum) / (top level - base level)   �����  �    Status                           �   �  �    Instrument Handle                b G  �  x    Channel                          � G � � `    Slope                            _ G3 �  `    Duration                         Q G� �  `    Occurence                        � � � �  `    Overshoot                          	               1               >Positive RSNRPZ_SLOPE_POSITIVE Negative RSNRPZ_SLOPE_NEGATIVE    	           	           	              This function returns the average power, the minimum level and the maximum level of the analysed trace in Watt.

Note(s):
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:POW:AVG?
SENS:TRAC:MEAS:POW:MIN?
SENS:TRAC:MEAS:POW:MAX?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     +    This control returns average power value.     ,    This control returns min peak power value.     ,    This control returns max peak power value.    �����  �    Status                           $�   �  �    Instrument Handle                %b G  �  x    Channel                          %� G � �  `    Average                          & G9 �  `    Min Peak                         &7 G� �  `    Max Peak                           	               1    	           	           	          R    This function returns the pulse top level and the pulse base level in watt. Both levels are calculated with the algorithm that was set with the rsnrpz_scope_meas_setMeasAlgorithm(...)  function.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:POW:PULS:TOP?
SENS:TRAC:MEAS:POW:PULS:BASE?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     '    This control returns top level value.     (    This control returns base level value.   )<����  �    Status                           -g   �  �    Instrument Handle                . G  �  x    Channel                          .t G � �  `    Top Level                        .� G9 �  `    Base Level                         	               1    	           	          �    This function returns the calculated reference level in Watt at the defined thresholds of the last recorded trace. The thresholds in percent are defined with the function  rsnrpz_scope_meas_setLevelThresholds(�) of the pulse amplitude.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:POW:LREF?
SENS:TRAC:MEAS:POW:HREF?
SENS:TRAC:MEAS:POW:REF?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     A    This control returns absolute power at the 10% amplitude level.     A    This control returns absolute power at the 90% amplitude level.     E    This control returns the absolute power at the 50% amplitude level.   1�����  �    Status                           5�   �  �    Instrument Handle                6e G  �  x    Channel                          6� G � �  `    Low Ref Level                    7 G9 �  `    High Ref Level                   7e G� �  `    Duration Ref Level                 	               1    	           	           	          �    This function activates or deactivates the automatic equivalent sampling mode during automatic pulse analysis.
If equivalent sampling is enabled, the sensor tries to measure the time parameters (mainly rise/fall times) of the pulse with a high resolution by doing equivalent sampling.
To do the equivalent sampling a periodic signal is mandatory. The sensor decides automatically if equivalent  sampling is possible. To get the resolution of the measured time parameter the function "rsnrpz_scope_meas_getSamplePeriod" could be used.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:TRANS:ESAM:AUTO    U    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control activates or deactivates the automatic equivalent sampling mode during automatic pulse analysis.

Valid Values:
VI_TRUE  (1) - On (Default Value)
VI_FALSE (0) - Off   ;�����  �    Status                           @   �  �    Instrument Handle                @� G  �  x    Channel                          A$ G � �       Scope Meas Equiv Sampling          	               1   On VI_TRUE Off VI_FALSE    �    This function returns the state of the automatic equivalent sampling mode during automatic pulse analysis.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:TRANS:ESAM:AUTO?    U    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the state of the automatic equivalent sampling mode during automatic pulse analysis.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   C�����  �    Status                           H'   �  �    Instrument Handle                H� G  �  x    Channel                          I4 G � �  `    Scope Meas Equiv Sampling          	               1    	           9    This function returns the sample period (in s) of the last pulse analysis. This parameter is a good indicator if the equivalent sampling mode of measuring the rise and fall times was successful or not.

Note:
1) This function is only available for NRP-Z81.

Remote-control command(s):
SENS:TRAC:MEAS:TRANS:SPER?    U    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     L    This function returns the sample period (in s) of the last pulse analysis.   L����  �    Status                           Pn   �  �    Instrument Handle                Q G  �  x    Channel                          Q{ G� �  x    Sample Period                      	               1    	           �    This function configures the parameters of internal trigger system.

Remote-control command(s):
TRIG:DEL:AUTO ON
TRIG:ATR OFF
TRIG:COUN 1
TRIG:DEL 0.0
TRIG:HOLD 0.0
TRIG:HYST 3DB
TRIG:LEV <value>
TRIG:SLOP POS | NEG
TRIG:SOUR INT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control determines the power (in W) a trigger signal must exceed before a trigger event is detected.

Valid Range:
0.1e-6 to 0.2 W

Default Value:
1.0e-6 W

Notes:
(1) Actual valid range depends on sensor used     �    This control determines whether the rising (POSitive) or the falling (NEGative) edge of the signal is used for triggering.

Valid Values:
RSNRPZ_SLOPE_POSITIVE (0) - Positive (Default Value)
RSNRPZ_SLOPE_NEGATIVE (1) - Negative   S�����  �    Status                           W�   �  �    Instrument Handle                X} G  �  x    Channel                          X� G � �  x    Trigger Level                    Y� G � x    Trigger Slope                      	               1    1.0e-6               >Positive RSNRPZ_SLOPE_POSITIVE Negative RSNRPZ_SLOPE_NEGATIVE    �    This function configures the parameters of external trigger system.

Remote-control command(s):
TRIG:DEL <value>
TRIG:SOUR EXT
TRIG:COUN 1
TRIG:ATR OFF
TRIG:HOLD 0.0
TRIG:DEL:AUTO ON    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets a the delay (in seconds) between the trigger event and the beginning of the actual measurement (integration).

Valid Range:
-5.0e-3 to 100.0 s

Default Value:
0.0 s

Notes:
(1) Actual valid range depends on sensor used   \�����  �    Status                           a   �  �    Instrument Handle                a� G  �  x    Channel                          b% G � �  x    Trigger Delay                      	               1    0.0   �    This function performs triggering and ensures that the sensor directly changes from the WAIT_FOR_TRG state to the MEASURING state irrespective of the selected trigger source. A trigger delay set with TRIG:DEL is ignored but not the automatic delay determined when TRIG:DEL:AUTO:ON is set.
When the trigger source is HOLD, a measurement can only be started with TRIG.

Remote-control command(s):
TRIG:IMM    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1   e�����  �    Status                           i�   �  �    Instrument Handle                jr G  �  x    Channel                            	               1       This function ensures (if parameter is set to On) by means of an automatically determined delay that a measurement is started only after the sensor has settled. This is important when thermal sensors are used.

Remote-control command(s):
TRIG:DEL:AUTO ON | OFF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control enables or disables automatic determination of delay.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)   l�����  �    Status                           p�   �  �    Instrument Handle                ql G  �  x    Channel                          q� G � �f      Auto Delay                         	               1    On VI_TRUE Off VI_FALSE    c    This function reads the setting of auto delay feature.

Remote-control command(s):
TRIG:DEL:AUTO?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     k    This control returns the state of Auto Delay feature.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   s�����  �    Status                           x   �  �    Instrument Handle                x� G  �  x    Channel                          y G� �  x    Auto Delay                         	               1    	           `    This function turns On or Off the auto trigger feature. When auto trigger is set to On, the WAIT_FOR_TRG state is automatically exited when no trigger event occurs within a period that corresponds to the reciprocal of the display update rate.

Note:
  
1) This function is not available for NRP-Z51.

Remote-control command(s):
TRIG:ATR:STAT ON | OFF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     x    This control enables or disables the Auto Trigger.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)   {�����  �    Status                           �   �  �    Instrument Handle                �� G  �  x    Channel                          � G � �r      Auto Trigger                       	               1    On VI_TRUE Off VI_FALSE    �    This function reads the state of Auto Trigger.

Note:
  
1) This function is not available for NRP-Z51.

Remote-control command(s):
TRIG:ATR:STAT?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     d    This control returns the state of Auto Trigger.

Valid Values:
VI_TRUE (1) - On
VI_FALSE (0) - Off   �9����  �    Status                           �d   �  �    Instrument Handle                � G  �  x    Channel                          �q G� �  x    Auto Trigger                       	               1    	            �    This function sets the number of measurement cycles to be  performed when the measurement is started with INIT.

Remote-control command(s):
TRIG:COUN    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the number of measurement cycles to be  performed when the measurement is started with INIT.

Valid Range:
1 to 2147483646

Default Value:
1

Notes:
(1) Actual valid range depends on sensor used   �q����  �    Status                           ��   �  �    Instrument Handle                �; G  �  x    Channel                          �� G � �  x    Trigger Count                      	               1    1    �    This function reads the number of measurement cycles to be  performed when the measurement is started with INIT.

Remote-control command(s):
TRIG:COUN?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     s    This control returns the number of measurement cycles to be  performed when the measurement is started with INIT.   �����  �    Status                           �A   �  �    Instrument Handle                �� G  �  x    Channel                          �N G� �  x    Trigger Count                      	               1    	            �    This function defines the delay between the trigger event and the beginning of the actual measurement (integration).

Remote-control command(s):
TRIG:DEL    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    /    This control sets a the delay (in seconds) between the trigger event and the beginning of the actual measurement (integration).

Valid Range:
NRP-Z21: -5.0e-3 to 100.0 s
NRP-Z51:  0.0    to 100.0 s
FSH-Z1:  -5.0e-3 to 100.0 s

Default Value:
0.0 s

Notes:
(1) Actual valid range depends on sensor used   �a����  �    Status                           ��   �  �    Instrument Handle                �+ G  �  x    Channel                          �� G � �  x    Trigger Delay                      	               1    0.0    �    This function reads value of the delay (in seconds) between the trigger event and the beginning of the actual measurement (integration).

Remote-control command(s):
TRIG:DEL?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns value of the delay (in seconds) between the trigger event and the beginning of the actual measurement (integration).   �x����  �    Status                           ��   �  �    Instrument Handle                �B G  �  x    Channel                          �� G� �  x    Trigger Delay                      	               1    	           �    This function defines a period after a trigger event within which all further trigger events are ignored.

Remote-control command(s):
TRIG:HOLD    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control defines a period (in seconds) after a trigger event within which all further trigger events are ignored.

Valid Range:
0.0 - 10.0 s

Default Value:
0.0 s

Notes:
(1) Actual valid range depends on sensor used   ������  �    Status                           ��   �  �    Instrument Handle                �� G  �  x    Channel                          �	 G � �  x    Trigger Holdoff                    	               1    0.0    �    This function returns the value of a period after a trigger event within which all further trigger events are ignored.

Remote-control command(s):
TRIGger[1..4]:HOLDoff?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the value of a period (in seconds) after a trigger event within which all further trigger events are ignored.   ������  �    Status                           ��   �  �    Instrument Handle                �\ G  �  x    Channel                          �� G� �  x    Trigger Holdoff                    	               1    	          B    This function is used to specify how far the signal level has to drop below the trigger level before a new signal edge can be detected as a trigger event. Thus, this command can be used to eliminate the effects of noise in the signal on the transition filters of the trigger system.

Remote-control command(s):
TRIG:HYST    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control defines the trigger hysteresis in dB.

Valid Range:
0.0 to 10.0 dB

Default Value: 0.0 dB

Notes:
(1) Actual valid range depends on sensor used   ������  �    Status                           ��   �  �    Instrument Handle                �_ G  �  x    Channel                          �� G � �  x    Trigger Hysteresis                 	               1    0.0    ]    This function reads the value of trigger hysteresis.

Remote-control command(s):
TRIG:HYST?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     =    This control returns the value of trigger hysteresis in dB.   ������  �    Status                           ��   �  �    Instrument Handle                Ē G  �  x    Channel                          �  G� �  x    Trigger Hysteresis                 	               1    	           �    This function determines the power a trigger signal must exceed before a trigger event is detected. This setting is only used for internal trigger signal source.

Remote-control command(s):
TRIG:LEV    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1        This control determines the power (in W) a trigger signal must exceed before a trigger event is detected.

Valid Range:
NRP-Z21: 0.1e-6  to 0.2 W
NRP-Z51: 0.25e-6 to 0.1 W
FSH-Z1:  0.1e-6  to 0.2 W

Default Value:
1.0e-6 W

Notes:
(1) Actual valid range depends on sensor used   �
����  �    Status                           �5   �  �    Instrument Handle                �� G  �  x    Channel                          �B G � �  x    Trigger Level                      	               1    1.0e-6    �    This function reads the power a trigger signal must exceed before a trigger event is detected.

Remote-control command(s):
TRIG:LEV?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     h    This control returns the power (in W) a trigger signal must exceed before a trigger event is detected.   ������  �    Status                           �   �  �    Instrument Handle                ӫ G  �  x    Channel                          � G� �  x    Trigger Level                      	               1    	           �    This function determines whether the rising (POSitive) or the falling (NEGative) edge of the signal is used for triggering.

Remote-control command(s):
TRIG:SLOP POSitive | NEGative    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control determines whether the rising (POSitive) or the falling (NEGative) edge of the signal is used for triggering.

Valid Values:
RSNRPZ_SLOPE_POSITIVE (0) - Positive (Default Value)
RSNRPZ_SLOPE_NEGATIVE (1) - Negative   �=����  �    Status                           �h   �  �    Instrument Handle                � G  �  x    Channel                          �u G � � x    Trigger Slope                      	               1               >Positive RSNRPZ_SLOPE_POSITIVE Negative RSNRPZ_SLOPE_NEGATIVE    �    This function reads whether the rising (POSitive) or the falling (NEGative) edge of the signal is used for triggering.

Remote-control command(s):
TRIG:SLOP?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns whether the rising (POSitive) or the falling (NEGative) edge of the signal is used for triggering.

Valid Values:
RSNRPZ_SLOPE_POSITIVE (0) - Positive
RSNRPZ_SLOPE_NEGATIVE (1) - Negative   �?����  �    Status                           �j   �  �    Instrument Handle                �	 G  �  x    Channel                          �w G� �  x    Trigger Slope                      	               1    	            �    This function sets the trigger signal source for the WAIT_FOR_TRG state.

Remote-control command(s):
TRIG:SOUR BUS | EXT | HOLD | IMM | INT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    �    This control selects the trigger signal source for the WAIT_FOR_TRG state.

Valid Values:
RSNRPZ_TRIGGER_SOURCE_BUS       (0) - Bus 
RSNRPZ_TRIGGER_SOURCE_EXTERNAL  (1) - External
RSNRPZ_TRIGGER_SOURCE_HOLD      (2) - Hold
RSNRPZ_TRIGGER_SOURCE_IMMEDIATE (3) - Immediate (Default Value)
RSNRPZ_TRIGGER_SOURCE_INTERNAL  (4) - Internal

Notes:
(1) Bus: The trigger event is initiated by TRIG:IMM or *TRG. In this case, the setting for Trigger Slope is meaningless.

(2) External: Triggering is performed with an external signal applied to the trigger connector. The Trigger Slope setting determines whether the rising or the falling edge of the signal is to be used for triggering. Waiting for a trigger event can be skipped by Immediate Trigger.

(3) Hold: A measurement can only be triggered when Immediate Trigger is executed.

(4) Immediate: The sensor does not remain in the WAIT_FOR_TRG state but immediately changes to the MEASURING state.

(5) Internal: The sensor determines the trigger time by means of the signal to be measured. When this signal exceeds the power set by Trigger Level, the measurement is started after the time set by Trigger Delay. Similar to External Trigger, waiting for a trigger event can also be skipped by Immediate Trigger.   ������  �    Status                           �   �  �    Instrument Handle                � G  �  x    Channel                          � G � � x    Trigger Source                     	               1              �Bus RSNRPZ_TRIGGER_SOURCE_BUS External RSNRPZ_TRIGGER_SOURCE_EXTERNAL Hold RSNRPZ_TRIGGER_SOURCE_HOLD Immediate RSNRPZ_TRIGGER_SOURCE_IMMEDIATE Internal RSNRPZ_TRIGGER_SOURCE_INTERNAL External 2 RSNRPZ_TRIGGER_SOURCE_EXTERNAL2    q    This function gets the trigger signal source for the WAIT_FOR_TRG state.

Remote-control command(s):
TRIG:SOUR?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    o    This control returns the trigger signal source for the WAIT_FOR_TRG state.

Valid Values:
RSNRPZ_TRIGGER_SOURCE_BUS       (0) - Bus
RSNRPZ_TRIGGER_SOURCE_EXTERNAL  (1) - External
RSNRPZ_TRIGGER_SOURCE_HOLD      (2) - Hold
RSNRPZ_TRIGGER_SOURCE_IMMEDIATE (3) - Immediate
RSNRPZ_TRIGGER_SOURCE_INTERNAL  (4) - Internal
RSNRPZ_TRIGGER_SOURCE_EXTERNAL2 (5) - External 2   �Z����  �    Status                           ��   �  �    Instrument Handle                �$ G  �  x    Channel                          �� G� �  x    Trigger Source                     	               1    	           =    This function defines the dropout time value. With a positive (negative) trigger slope, the dropout time is the minimum time for which the signal must be below (above) the power level defined by rsnrpz_trigger_setLevel and rsnrpz_trigger_setHysteresis before triggering can occur again. As with the Holdoff parameter, unwanted trigger events can be excluded. The set dropout time only affects the internal trigger source.
The dropout time parameter is useful when dealing with, for example, GSM signals with several active slots.

Remote-control command(s):
TRIGger:DTIMe    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     `    This control defines the dropout time value.

Valid Range:
0.0 to 10.0 s

Default Value:
0.0 s   �C����  �    Status                            n   �  �    Instrument Handle                 G  �  x    Channel                          { G � �  x    Dropout Time                       	               1    0.0    Z    This function queries the dropout time value.

Remote-control command(s):
TRIGger:DTIMe?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     J    This control returns the dropout time value.

Valid Range:
0.0 to 10.0 s   5����  �    Status                           `   �  �    Instrument Handle                � G  �  x    Channel                          m G � �  x    Dropout Time                       	               1    	          �    This function can be used to configure an R&S NRP-Z81 power sensor as the trigger master, enabling it to output a digital trigger signal in sync with its own trigger event. This makes it possible to synchronize several sensors (see rsnrpz_trigger_setSyncState) and to perform measurements in sync with a signal at very low power, which normally would not allow signal triggering. The trigger signal which is output has a length of 1Rs and the positive slope coincides with the physical trigger point. At present, it can be distributed to other R&S NRP-Zxx sensors only via the R&S NRP base unit and not via the R&S NRP-Z3/-Z4 interface adapter.
Generally, the trigger master is set to internal triggering (signal triggering) (the BUS and IMMEDIATE settings can also be used); the sensors acting as trigger slaves must be set to external triggering and positive trigger slope.
With the R&S NRP-Z81 power sensor, digital trigger signals are sent and received via a single differential line pair, the trigger bus. Only one instrument on the trigger bus can act as the trigger master. If the application is time-critical, the trigger-signal delay from the master to a slave must be taken into account.

Remote-control command(s):
TRIG:MAST:STAT ON | OFF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     v    This control enables or disables trigger master.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)   �����  �    Status                           �   �  �    Instrument Handle                i G  �  x    Channel                          � G � �       State                              	               1    On VI_TRUE Off VI_FALSE    \    This function queries state of trigger master.

Remote-control command(s):
TRIG:MAST:STAT?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     c    This control returns state of trigger master.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   �����  �    Status                           �   �  �    Instrument Handle                � G  �  x    Channel                          � G � �  `    State                              	               1    	           �    This function can be used to synchronize the sensors connected to the trigger bus. Synchronization is achieved by enabling the
trigger signal only when all the sensors are in the WAIT_FOR_TRIGGER state (wired-OR). This ensures that the measurements are started simultaneously and also that repetitions due to averaging start at the same time. It must be ensured that the number of repetitions is the same for all the sensors involved in the measurement. Otherwise, the trigger bus will be blocked by any sensor that has completed its measurements before the others and has returned to the IDLE state.

Remote-control command(s):
TRIG:SYNC:STAT ON | OFF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     ~    This control enables or disables sensor synchronization.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)   �����  �    Status                           #   �  �    Instrument Handle                #� G  �  x    Channel                          $# G � �       State                              	               1    On VI_TRUE Off VI_FALSE    d    This function queries state of sensor synchronization.

Remote-control command(s):
TRIG:SYNC:STAT?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     k    This control returns state of sensor synchronization.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   &����  �    Status                           *D   �  �    Instrument Handle                *� G  �  x    Channel                          +Q G � �  `    State                              	               1    	            l    This function returns selected information on a sensor.

Remote-control command(s):
SYST:INFO? <Info Type>    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    �    This control specifies which info should be retrieved from the sensor.

Valid Values:
 "Manufacturer"
 "Type"
 "Stock Number"
 "Serial"
 "HWVersion"
 "HWVariant"
 "SW Build"
 "Technology"
 "Function"
 "MinPower"
 "MaxPower" 
 "MinFreq"
 "MaxFreq"
 "Resolution"
 "Impedance"
 "Coupling"
 "Cal. Abs."
 "Cal. Refl."
 "Cal. S-Para."
 "Cal. Misc."
 "Cal. Temp."
 "Cal. Lin."
 "SPD Mnemonic"

Default Value:
""     T    This control defines the size of array 'Info'.

Valid Range:
-

Default Value:
100     >    This control returns requested informations from the sensor.   --����  �    Status                           1X   �  �    Instrument Handle                1� G  �  x    Channel                          2e G � �  x    Info Type                        4 G� �  x    Array Size                       4_ �  � �    Info                               	               1    ""        	           Y    This function returns header and value of a certain line within the result of the SYST:INFO? query 
SYST:INFO? query returns an array of strings, where every line denotes a certain sensor parameter.
-- For example, SYST:INFO? could return 
� � � Manufacturer:Rohde & Schwarz 
� � � Type:NRP-Z85 
� � � Stock Number:1411.7501.02 
� � � Serial:900003 
� � � HWVersion:000000000 
� � � HWVariant:000000000 
� � � SW Build:01.37 
� � � FPGA Build:TS:28;SC:22;ST:22 
� � � Technology:Diode 
� � � Function:Power Terminating 
� � � MinPower:1e-09 
� � � MaxPower:0.1 
� � � MinFreq:5e+07 
� � � MaxFreq:4e+10 
� � � :: 
� � � :: 
� � � � � �
In this example a call of rsnrpz_chan_infoHeader() with a parameterNb = 6 would return the 6th line, which contains the sensor Firmware version (--> "SW Build:01.37" in this case).

Remote-control command(s):
SYST:INFO?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1         This control defines the position of parameter header to be retrieved.

Valid Range:
0 to (count of headers - 1)

Default Value:
0

Notes:
(1) Only Minimum value of the parameter is checked. Maximum value depends on sensor used and can be retrieved by function rsnrpz_chan_infosCount().     V    This control defines the size of array 'Header'.

Valid Range:
-

Default Value:
100     2    This control returns specified parameter header.   9o����  �    Status                           =�   �  �    Instrument Handle                >9 G  �  x    Channel                          >� G � �  x    Parameter Number                 ?� G� �  x    Array Size                       @- �  � �    Header                             	               1    0        	            �    This function returns the number of lines (strings) which are returned by a SYST:INFO? query on the selected channel. 
See also rsnrpz_chan_infoHeader() for more information.

Remote-control command(s):
SYST:INFO?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     P    This control returns the number of available info headers for selected sensor.   B�����  �    Status                           F�   �  �    Instrument Handle                Gx G  �  x    Channel                          G� G� �  x    Count                              	               1    	            �    This function sets status update time, which influences USB traffic during sensor's waiting for trigger.

Note:

1) This function is available only for NRP-Z81.

Remote-control command(s):
SYST:SUT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets status update time, which influences USB traffic during sensor's waiting for trigger.

Valid Range:
0.0 to 10.0 s

Default Value: 100.0e-4 s   J����  �    Status                           N-   �  �    Instrument Handle                N� G  �  x    Channel                          O: G� �  x    Status Update Time                 	               1    	100.0e-4    �    This function gets status update time.

Note:

1) This function is available only for NRP-Z81.

Remote-control command(s):
SYST:SUT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     F    This control returns status update time.

Valid Range:
0.0 to 10.0 s   Qd����  �    Status                           U�   �  �    Instrument Handle                V. G  �  x    Channel                          V� G� �  x    Status Update Time                 	               1    	           �    This function sets result update time, which influences USB traffic if sensor is in continuous sweep mode.

Note:

1) This function is available only for NRP-Z81.

Remote-control command(s):
SYST:RUT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets result update time, which influences USB traffic if sensor is in continuous sweep mode.

Valid Range:
0.0 to 10.0 s

Default Value: 0.1 s   X�����  �    Status                           \�   �  �    Instrument Handle                ]z G  �  x    Channel                          ]� G� �  x    Result Update Time                 	               1    0.1    �    This function gets result update time.

Note:

1) This function is available only for NRP-Z81.

Remote-control command(s):
SYST:RUT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     C    This control gets result update time.

Valid Range:
0.0 to 10.0 s   `
����  �    Status                           d5   �  �    Instrument Handle                d� G  �  x    Channel                          eB G� �  x    Result Update Time                 	               1    	          L    This function does internal test measurements with enabled and disabled heater and returns the power difference between both measurements.
The result of this test is used to determine the long time drift of the power sensor.

Note:

1) This function is available only for NRP-Z56 and NRP-Z57.

Remote-control command(s):
CAL:TEST?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     p    This control returns the power difference between internal test measurements with enabled and disabled heater.   g�����  �    Status                           l   �  �    Instrument Handle                l� G  �  x    Channel                          m G� �  x    Calib Test                         	               1    	          =    This function  first does an internal heater test with CAL:TEST and returns the relative deviation between the test result and the result that was measured in the calibration lab during sensor calibration.

Note:

1) This function is available only for NRP-Z56 and NRP-Z57.

Remote-control command(s):
CAL:TEST:DEV?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the relative deviation between the test result and the result that was measured in the calibration lab during sensor calibration.   o�����  �    Status                           s�   �  �    Instrument Handle                t� G  �  x    Channel                          t� G� �  x    Test Deviation                     	               1    	           �    This function returns the heater test result that was measured in the calibration lab during sensor calibration.

Note:

1) This function is available only for NRP-Z56 and NRP-Z57.

Remote-control command(s):
CAL:TEST:REF?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     q    This control returns the heater test result that was measured in the calibration lab during sensor calibration.   wu����  �    Status                           {�   �  �    Instrument Handle                |? G  �  x    Channel                          |� G� �  x    Test Reference                     	               1    	           �    This function immediately sets selected sensor to the IDLE state. Measurements in progress are interrupted. If INIT:CONT ON is set, a new measurement is immediately started since the trigger system is not influenced.

Remote-control command(s):
ABOR    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1   ����  �    Status                           �I   �  �    Instrument Handle                �� G  �  x    Channel                            	               1   �    This function starts a single-shot measurement on selected channel. The respective sensor goes to the INITIATED state. The command is completely executed when the sensor returns to the IDLE state. The command is ignored when the sensor is not in the IDLE state or when continuous measurements are selected (INIT:CONT ON). The command is only fully executed when the measurement is completed and the trigger system has again reached the IDLE state. INIT is the only remote control command that permits overlapping execution. Other commands can be received and processed while the command is being executed.

Remote-control command(s):
STAT:OPER:MEAS?
INITiate[1..4]    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1   ������  �    Status                           ��   �  �    Instrument Handle                �v G  �  x    Channel                            	               1    �    This function selects either single-shot or continuous (free-running) measurement cycles.

Remote-control command(s):
INIT:CONT ON | OFF    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control enables or disables the continuous measurement mode.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off (Default Value)   �*����  �    Status                           �U   �  �    Instrument Handle                �� G  �  x    Channel                          �b G � �       Continuous Initiate                	               1    On VI_TRUE Off VI_FALSE    �    This function returns whether single-shot or continuous (free-running) measurement is selected.

Remote-control command(s):
INIT:CONT?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     l    This control returns the state of continuous initiate.

Valid Values:
VI_TRUE  (1) - On
VI_FALSE (0) - Off   ������  �    Status                           ��   �  �    Instrument Handle                �O G  �  x    Channel                          �� G� �  x    Continuous Initiate                	               1    	           Z    From the point of view of the R&S NRP basic unit, the sensors are stand-alone measuring devices. They communicate with the R&S NRP via a command set complying with SCPI.
This function prompts the basic unit to send an *RST to the respective sensor. Measurements in progress are interrupted.

Remote-control command(s):
SYSTem:SENSor[1..4]:RESet    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1   ������  �    Status                           ��   �  �    Instrument Handle                �R G  �  x    Channel                            	               1       If the signal to be measured has modulation sections just above the video bandwidth of the sensor used, measurement errors might be caused due to aliasing effects. In this case, the sampling rate of the sensor can be set to a safe lower value (Sampling Frequency 2). However, the measurement time required to obtain noise-free results is extended compared to the normal sampling rate (Sampling Frequency 1).

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:SAMP FREQ1 | FREQ2    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control selects the sampling frequency.

Valid Values:
RSNRPZ_SAMPLING_FREQUENCY1 (1) - Sampling Frq 1 (High) (Default Value)
RSNRPZ_SAMPLING_FREQUENCY2 (2) - Sampling Frq 2 (Low)   ������  �    Status                           ��   �  �    Instrument Handle                �J G  �  x    Channel                          �� G � � x    Sampling Frequency                 	               1               aSampling Frq 1 (High) RSNRPZ_SAMPLING_FREQUENCY1 Sampling Frq 2 (Low) RSNRPZ_SAMPLING_FREQUENCY2    �    This function returns the selected sampling frequency.

Note:

1) This function is not available for NRP-Z51.

Remote-control command(s):
SENS:SAMP?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns the selected sampling frequency.

Valid Values:
RSNRPZ_SAMPLING_FREQUENCY1 (1) - Sampling Frq 1 (High)
RSNRPZ_SAMPLING_FREQUENCY2 (2) - Sampling Frq 2 (Low)   �q����  �    Status                           ��   �  �    Instrument Handle                �; G  �  x    Channel                          �� G� �  x    Sampling Frequency                 	               1    	               This function starts zeroing of the selected sensor using the signal at the sensor input. Zeroing is an asynchronous operation which will require a couple of seconds. Therefore, after starting the function, the user should poll the current execution status by continuously calling rsnrpz_chan_isZeroComplete(). As soon as the zeroing has finished, the result of the operation can be queried by a call to rsnrpz_error_query(). See the example code below.

Note: The sensor must be disconnected from all power sources. If the signal at the input considerably deviates from 0 W, the sensor aborts the zero calibration and raises an error condition. The rsnrpz driver queues the error for later retrieval by the rsnrpz_error_query() function.

Example code

bool Zero( ViSession lSesID )
{
  const int CH1 = 1;
  ViStatus lStat = VI_SUCCESS;
  ViBoolean bZeroComplete = VI_FALSE;
  ViInt32 iErrorCode = VI_SUCCESS;
  ViChar szErrorMsg[256];
  /* Start zeroing the sensor */
  lStat = rsnrpz_chan_zero( lSesID, CH1 );
  if ( lStat != VI_SUCCESS )
  {
    fprintf( stderr, "Error 0x%08x in rsnrpz_chan_zero()", lStat );
    return false;
  }
  while ( bZeroComplete == VI_FALSE )
  {
    lStat = rsnrpz_chan_isZeroComplete( lSesID, CH1, &bZeroComplete );
    if ( bZeroComplete )
    {
      rsnrpz_error_query( lSesID, &iErrorCode, szErrorMsg );
      fprintf( stderr, "Zero-Cal.: error %d, %s\n\n", iErrorCode, szErrorMsg );
      break;
    }
    else 
      SLEEP( 200 );
  }
  return iErrorCode == 0;
}

Remote-control command(s):
STAT:OPER:MEAS?
CAL:ZERO:AUTO ONCE    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1   �����  �    Status                           ��   �  �    Instrument Handle                �I G  �  x    Channel                            	               1   ]    This function performs zeroing using the signal at the sensor input. The sensor must be disconnected from all power sources. If the signal at the input considerably deviates from 0 W, an error message is issued and the function is aborted.

Note(s):

(1) This function is valid only for NRP-Z81.

Remote-control command(s):
CAL:ZERO:AUTO LFR | UFR        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    M    This control selects type of advanced zeroing.

Valid Values:
RSNRPZ_ZERO_LFR (0) - Low Frequencies
RSNRPZ_ZERO_UFR (1) - High Frequencies

Default Value: RSNRPZ_ZERO_LFR (0)

Note(s):

(1) Low Frequencies - Does zeroing only for low frequencies (< 500 MHZ)

(2) High Frequencies - Does zeroing for higher Frequencies (>= 500 MHz).   ������  �    Status                           ��   �  �    Instrument Handle                Ɛ G E �  x    Channel                          �� G � � x    Zeroing                            	               1               ALow Frequencies RSNRPZ_ZERO_LFR High Frequencies RSNRPZ_ZERO_UFR   (    This function should be used for polling whether a previously started zero calibration has already finished. Zero calibration is an asynchronous operation and may take some seconds until it completes. See the example code under rsnrpz_chan_zero() on how to conduct a sensor zeroing calibration.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     w    This control returns the state of the zeroing of the sensor.

Valid Values:
Complete (VI_TRUE)
In Progress (VI_FALSE)   ʼ����  �    Status                           ��   �  �    Instrument Handle                φ G  �  x    Channel                          �� G� �  x    Zeroing Complete                   	               1    	            5    This function returns the state of the measurement.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     m    This control returns the state of the measurement.

Valid Values:
Complete (VI_TRUE)
In Progress (VI_FALSE)   ѥ����  �    Status                           ��   �  �    Instrument Handle                �o G  �  x    Channel                          �� G� �  x    Measurement Complete               	               1    	            �    This function performs a sensor test and returns a list of strings separated by commas. The contents of this test protocol is sensor-specific. For its meaning, please refer to the sensor documentation.

Remote-control command(s):
TEST:SENS?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     6    This control returns the result string of self-test.   �A����  �    Status                           �l   �  �    Instrument Handle                � G  �  x    Channel                          �y G� �  x    Result                             	               1    	            �    This function selects which measurement results are to be made available in the Trace mode.

Note(s):

(1) This functions is available only for NRP-Z81

Remote-control command(s):
SENSe:AUXiliary NONE | MINMAX | RNDMAX    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    �    This control selects which measurement results are to be made available in the Trace mode.

Valid Values:
RSNRPZ_AUX_NONE   (0) - None
RSNRPZ_AUX_MINMAX (1) - Min Max
RSNRPZ_AUX_RNDMAX (2) - Rnd Max

Note(s):

(1) None - only the average power of the associated samples

(2) Min Max - provides the maximum and minimum as well

(3) Rnd Max - provides the maximum and a random sample.   ������  �    Status                           �   �  �    Instrument Handle                �Z G  �  x    Channel                          �� G � � x    Auxiliary Value                    	               1               INone RSNRPZ_AUX_NONE Min Max RSNRPZ_AUX_MINMAX Rnd Max RSNRPZ_AUX_RNDMAX    �    This function queries which measurement results are available in the Trace mode.

Note(s):

(1) This functions is available only for NRP-Z81

Remote-control command(s):
SENSe:AUXiliary?    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control returns which measurement results are available in the Trace mode.

Valid Values:
RSNRPZ_AUX_NONE   (0) - None (Default Value)
RSNRPZ_AUX_MINMAX (1) - Min Max
RSNRPZ_AUX_RNDMAX (2) - Rnd Max   �T����  �    Status                           �   �  �    Instrument Handle                � G  �  x    Channel                          � G � �  x    Auxiliary Value                    	               1    	            �    This function initiates an acquisition on the channels that you specifies in channel parameter.  It then waits for the acquisition to complete, and returns the measurement for the channel you specify.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    _    Pass the maximum length of time in which to allow the read measurement operation to complete.    

If the operation does not complete within this time interval, the function returns the RSNRPZ_ERROR_MAX_TIME_EXCEEDED error code.  When this occurs, you can call rsnrpz_chan_abort to cancel the read measurement operation and return the sensor to the Idle state.

Units:  milliseconds.  

Defined Values:
RSNRPZ_VAL_MAX_TIME_INFINITE
RSNRPZ_VAL_MAX_TIME_IMMEDIATE

Default Value: 5000 (ms)

Notes:

(1) The Maximum Time parameter applies only to this function.  It has no effect on other timeout parameters.         Returns single measurement.   �(����  �    Status                           �S   �  �    Instrument Handle                �� P * �  x    Channel                          �` P � �  x    Timeout (ms)                     �� P| �  x    Measurement                        	               1    5000    	          '    This function returns the measurement the sensor acquires for the channel you specify.  The measurement is from an acquisition that you previously initiated.  

You use the rsnrpz_chan_initiate function to start an acquisition on the channels that you specify. You use the rsnrpz_chan_isMeasurementComplete function to determine when the acquisition is complete.

You can call the rsnrpz_meass_readMeasurement function instead of the rsnrpz_chan_initiate function.  The rsnrpz_meass_readMeasurement function starts an acquisition, waits for the acquisition to complete, and returns the measurement for the channel you specify.

Note:

1) If the acquisition has not be initialized or measurement is still in progress and value is not available, function returns an error( RSNRPZ_ERROR_MEAS_NOT_AVAILABLE ).    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1         Returns single measurement.   �M����  �    Status                           x   �  �    Instrument Handle                 F ( �  x    Channel                          � Fz �  x    Measurement                        	               1    	           �    This function initiates an acquisition on the channels that you specifies in channel parameter.  It then waits for the acquisition to complete, and returns the measurement for the channel you specify.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    v    Pass the maximum length of time in which to allow the read measurement operation to complete.    

If the operation does not complete within this time interval, the function returns the RSNRPZ_ERROR_MAX_TIME_EXCEEDED error code.  When this occurs, you can call rsnrpz_chan_abort to cancel the read measurement operation and return the sensor to the Idle state.

Units:  milliseconds.  

Defined Values:
RSNRPZ_VAL_MAX_TIME_INFINITE             RSNRPZ_VAL_MAX_TIME_IMMEDIATE           

Default Value: 5000 (ms)

Notes:

(1) The Maximum Time parameter applies only to this function.  It has no effect on other timeout parameters.     W    Pass the number of elements in the Measurement Array parameter.

Default Value: None
     =    Returns the measurement buffer that the sensor acquires.  
     X    Indicates the number of points the function places in the Measurement Array parameter.   q����  �    Status                           �   �  �    Instrument Handle                	; N , �  x    Channel                          	� N � �  x    Maximum Time (ms)                ' � , �  x    Buffer Size                      � � � �  x    Measurement Array                � �� �  x    Read Count                         	               1    5000        	            	           9    This function returns the buffer measurement the sensor acquires for the channel you specify.  The measurement is from an acquisition that you previously initiated.  

You use the rsnrpz_chan_initiate function to start an acquisition on the channels that you specify. You use the rsnrpz_chan_isMeasurementComplete function to determine when the acquisition is complete.

You can call the rsnrpz_meas_readBufferMeasurement function instead of the rsnrpz_chan_initiate function.  The rsnrpz_meass_readBufferMeasurement function starts an acquisition, waits for the acquisition to complete, and returns the measurement for the channel you specify.

Note:

1) If the acquisition has not be initialized or measurement is still in progress and value is not available, function returns an error( RSNRPZ_ERROR_MEAS_NOT_AVAILABLE ).    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     W    Pass the number of elements in the Measurement Array parameter.

Default Value: None
     =    Returns the measurement buffer that the sensor acquires.  
     Y    Indicates the number of points the function places in the Measurement Array parameter.
   ����  �    Status                           C   �  �    Instrument Handle                � O 2 �  x    Channel                          P � 2 �  x    Array Size                       � � � �  x    Measurement Array                � �� �  x    Read Count                         	               1        	            	           �    Triggers a BUS event. If the sensor is in the WAIT_FOR_TRG state and the source for the trigger source is set to BUS, the sensor enters the MEASURING state. This function invalidates all current measuring results. A query of measurement data following this function will thus always return the measured value determined in response to this function.

Remote-control command(s):
*TRG    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1   L����  �    Status                           w   �  �    Instrument Handle                  = � �  x    Channel                            	               1       This function initiates an acquisition on the channels that you specifies in channel parameter. It then waits for the acquisition to complete, and returns the auxiliary measurement for the channel you specify.

Note(s):

(1) If SENSE:AUX is set to None, this function returns error.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    _    Pass the maximum length of time in which to allow the read measurement operation to complete.    

If the operation does not complete within this time interval, the function returns the RSNRPZ_ERROR_MAX_TIME_EXCEEDED error code.  When this occurs, you can call rsnrpz_chan_abort to cancel the read measurement operation and return the sensor to the Idle state.

Units:  milliseconds.  

Defined Values:
RSNRPZ_VAL_MAX_TIME_INFINITE
RSNRPZ_VAL_MAX_TIME_IMMEDIATE

Default Value: 5000 (ms)

Notes:

(1) The Maximum Time parameter applies only to this function.  It has no effect on other timeout parameters.         Returns single measurement.     1    This control returns the first Auxiliary value.     2    This control returns the second Auxiliary value.   "\����  �    Status                           &�   �  �    Instrument Handle                '& P * �  x    Channel                          '� P � �  x    Timeout (ms)                     )� P{ �  x    Measurement                      *  �{ �  x    Aux 1                            *Y �{ �  x    Aux 2                              	               1    5000    	           	           	          h    This function returns the measurement the sensor acquires for the channel you specify.  The measurement is from an acquisition that you previously initiated.  

You use the rsnrpz_chan_initiate function to start an acquisition on the channels that you specify. You use the rsnrpz_chan_isMeasurementComplete function to determine when the acquisition is complete.

You can call the rsnrpz_meass_readMeasurement function instead of the rsnrpz_chan_initiate function.  The rsnrpz_meass_readMeasurement function starts an acquisition, waits for the acquisition to complete, and returns the measurement for the channel you specify.

Note(s):

1) If the acquisition has not be initialized or measurement is still in progress and value is not available, function returns an error( RSNRPZ_ERROR_MEAS_NOT_AVAILABLE ).

2) If SENSE:AUX is set to None, this function returns error.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    _    Pass the maximum length of time in which to allow the read measurement operation to complete.    

If the operation does not complete within this time interval, the function returns the RSNRPZ_ERROR_MAX_TIME_EXCEEDED error code.  When this occurs, you can call rsnrpz_chan_abort to cancel the read measurement operation and return the sensor to the Idle state.

Units:  milliseconds.  

Defined Values:
RSNRPZ_VAL_MAX_TIME_INFINITE
RSNRPZ_VAL_MAX_TIME_IMMEDIATE

Default Value: 5000 (ms)

Notes:

(1) The Maximum Time parameter applies only to this function.  It has no effect on other timeout parameters.         Returns single measurement.     1    This control returns the first Auxiliary value.     2    This control returns the second Auxiliary value.   /�����  �    Status                           3�   �  �    Instrument Handle                4� P * �  x    Channel                          4� P � �  x    Timeout (ms)                     7V P{ �  x    Measurement                      7{ �{ �  x    Aux 1                            7� �{ �  x    Aux 2                              	               1    5000    	           	           	           �    This function initiates an acquisition on the channels that you specifies in channel parameter.  It then waits for the acquisition to complete, and returns the measurement for the channel you specify.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    v    Pass the maximum length of time in which to allow the read measurement operation to complete.    

If the operation does not complete within this time interval, the function returns the RSNRPZ_ERROR_MAX_TIME_EXCEEDED error code.  When this occurs, you can call rsnrpz_chan_abort to cancel the read measurement operation and return the sensor to the Idle state.

Units:  milliseconds.  

Defined Values:
RSNRPZ_VAL_MAX_TIME_INFINITE             RSNRPZ_VAL_MAX_TIME_IMMEDIATE           

Default Value: 5000 (ms)

Notes:

(1) The Maximum Time parameter applies only to this function.  It has no effect on other timeout parameters.     W    Pass the number of elements in the Measurement Array parameter.

Default Value: None
     =    Returns the measurement buffer that the sensor acquires.  
     7    Returns the Aux 1 buffer that the sensor acquires.  
     7    Returns the Aux 2 buffer that the sensor acquires.  
     X    Indicates the number of points the function places in the Measurement Array parameter.   :t����  �    Status                           >�   �  �    Instrument Handle                ?> N , �  x    Channel                          ?� N � �  x    Maximum Time (ms)                B* N� �  x    Buffer Size                      B� � , �  x    Measurement Array                B� � � �  x    Aux 1 Array                      C �� �  x    Aux 2 Array                      CL � � �  x    Read Count                         	               1    5000        	            	            	            	           w    This function returns the buffer measurement the sensor acquires for the channel you specify.  The measurement is from an acquisition that you previously initiated.  

You use the rsnrpz_chan_initiate function to start an acquisition on the channels that you specify. You use the rsnrpz_chan_isMeasurementComplete function to determine when the acquisition is complete.

You can call the rsnrpz_meas_readBufferMeasurement function instead of the rsnrpz_chan_initiate function.  The rsnrpz_meass_readBufferMeasurement function starts an acquisition, waits for the acquisition to complete, and returns the measurement for the channel you specify.

Note:

1) If the acquisition has not be initialized or measurement is still in progress and value is not available, function returns an error( RSNRPZ_ERROR_MEAS_NOT_AVAILABLE ).

2) If SENSE:AUX is set to None, this function returns error.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    v    Pass the maximum length of time in which to allow the read measurement operation to complete.    

If the operation does not complete within this time interval, the function returns the RSNRPZ_ERROR_MAX_TIME_EXCEEDED error code.  When this occurs, you can call rsnrpz_chan_abort to cancel the read measurement operation and return the sensor to the Idle state.

Units:  milliseconds.  

Defined Values:
RSNRPZ_VAL_MAX_TIME_INFINITE             RSNRPZ_VAL_MAX_TIME_IMMEDIATE           

Default Value: 5000 (ms)

Notes:

(1) The Maximum Time parameter applies only to this function.  It has no effect on other timeout parameters.     W    Pass the number of elements in the Measurement Array parameter.

Default Value: None
     =    Returns the measurement buffer that the sensor acquires.  
     7    Returns the Aux 1 buffer that the sensor acquires.  
     7    Returns the Aux 2 buffer that the sensor acquires.  
     X    Indicates the number of points the function places in the Measurement Array parameter.   IY����  �    Status                           M�   �  �    Instrument Handle                N# N , �  x    Channel                          N� N � �  x    Maximum Time (ms)                Q N� �  x    Buffer Size                      Qn � , �  x    Measurement Array                Q� � � �  x    Aux 1 Array                      Q� �� �  x    Aux 2 Array                      R1 � � �  x    Read Count                         	               1    5000        	            	            	            	            ?    This function resets the R&S NRPZ registry to default values.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None   U����  �    Status                           Y1   �  �    Instrument Handle                  	                  This function switches state checking of the instrument (reading of the Standard Event Register and checking it for error) status subsystem. Driver functions are using state checking which is by default enabled.

Note:

(1) In debug mode enable state checking.

(2) For better bus throughput and instruments performance disable state checking.

(3) When state checking is disabled driver does not check if correct instrument model or option is used with each of the functions. This might cause unexpected behaviour of the instrument.
    �    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
BFFC0002  Parameter 2 (State Checking) out of range.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    This control switches instrument state checking On or Off.

Valid Range:
VI_FALSE (0) - Off
VI_TRUE  (1) - On (Default Value)
   \j����  �    Status                           aX   �  �    Instrument Handle                a� G	 �       State Checking                     	              On VI_TRUE Off VI_FALSE       This function resets the instrument to a known state and sends initialization commands to the instrument that set any necessary programmatic variables such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
    $    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors      �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None   do����  �    Status                           h�   �  �    Instrument Handle                  	               X    This function runs the instrument's self test routine and returns the test result(s).
    �    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
BFFC0002  Parameter 2 (Self-Test Result) NULL pointer.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    This control contains the value returned from the instrument self test.  Zero means success.  For any other code, see the device's operator's manual.
     �    This control contains the string returned from the self test. See the device's operation manual for an explanation of the string's contents.

Notes:

(1) The array must contain at least 256 elements ViChar[256].   j����  �    Status                           o   �  �    Instrument Handle                o� = 2 �  `    Self Test Result                 pC = � � ,    Self-Test Message                  	               	           	            G    This function reads an error code from the instrument's error queue.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
BFFC0002  Parameter 2 (Error Code) NULL pointer.
BFFC0003  Parameter 3 (Error Message) NULL pointer.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     N    This control returns the error code read from the instrument's error queue.
     �    This control returns the error message string read from the instrument's error message queue.

Notes:

(1) The array must contain at least 256 elements ViChar[256].   rk����  �    Status                           w�   �  �    Instrument Handle                x( = 2 �  `    Error Code                       x~ = � � ,    Error Message                      	               	            	            �    This function takes the Status Code returned by the instrument driver functions, interprets it and returns it as a user readable string.     �    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
3FFF0085  Unknown status code - VI_WARN_UNKNOWN_STATUS
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  VI_NULL     t    This control accepts the Status Code returned from the instrument driver functions.

Default Value:
0 - VI_SUCCESS     �    This control returns the interpreted Status Code as a user readable message string.

Notes:

(1) The array must contain at least 256 elements ViChar[256].   z�����  �    Status                           �   �  �    Instrument Handle                �M =  �  `    Status Code                      �� = � � �    Message                            	           VI_NULL    0    	            �    This function returns the DRIVER revision (only). Although a parameter for the INSTRUMENT revision exists, the instrument revision is NOT set by this function, but an empty string is always returned for the instrument revision.    �    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
3FFC0105  Revision query not supported - VI_WARN_NSUP_REV_QUERY

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    This control returns the Instrument Driver Software Revision.

Notes:

(1) The array must contain at least 256 elements ViChar[256].     �    This control returns the Instrument Firmware Revision.

Notes:

(1) Because instrument does not support firmware revision the array is set to empty string or ignored if used VI_NULL.   �V����  �    Status                           �E   �  �    Instrument Handle                �� = 2 �  �    Instrument Driver Revision       �r =, �  �    Firmware Revision                  	               	                    VI_NULL    �    This function returns the number of currently connected sensors.

Due to syntax definitions the first parameter must be of type 'ViSession', but it is not used and should be chosen as 0.    �    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
3FFF0085  Unknown status code - VI_WARN_UNKNOWN_STATUS
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  VI_NULL     @    This control returns the number of currently connected sensors   ������  �    Status                           ��   �  �    Instrument Handle                �� G � �  `    Sensor Count                       	           VI_NULL    	           �    This function returns the name/descriptor of a connected sensor.

Channel is �1...n � where 'n' is the number of connected sensors. 
'n' is evaluated by a call to rsnrpz_GetSensorCount() 
� � � � � � � � � � � � � � � � � � � � � �
The char arrays pointed to by pszSensorName, pszSensorType and pszSensorSerial should provide room for 128 characters.
� � � �
Due to syntax definitions the first parameter must be of type 'ViSession', but it is not used and should be chosen as 0.    �    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
3FFF0085  Unknown status code - VI_WARN_UNKNOWN_STATUS
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  VI_NULL     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     t    This control returns selected sensor's name.

Note(s):

(1) The array has to have allocated at least 128 elements.     t    This control returns selected sensor's type.

Note(s):

(1) The array has to have allocated at least 128 elements.     }    This control returns selected sensor's serial number.

Note(s):

(1) The array has to have allocated at least 128 elements.   �~����  �    Status                           �n   �  �    Instrument Handle                � G 2 �  `    Channel                          �~ G � �  `    Sensor Name                      �� G/ �  `    Sensor Type                      �v G� �  `    Sensor Serial                      	           VI_NULL    1    	            	            	           �    Sets a User Selected Sensor Name. This function is for the "new" sensor generation only (NRPxxS[N], NRPxxA[N], NRPxxT[N]).
Sets a name of the sensors according to the users requirements. The name specified by 'pName' will be displayed on the WebGUI of the network sensors. The sensor name given here is independent from the hostname of the sensor. However, if the sensor name is not yet specified it defaults to the hostname.

Remote-control command(s):
SYST:NAME    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     P    This control sets the sensor name.

Valid Range:
any string

Default Value:
""   �R����  �    Status                           �}   �  �    Instrument Handle                � G  �  x    Channel                          �� G � �  x    Name                               	               1    ""    Z    This function returns the sensor name.

Remote-control command(s):
SENS:POW:TSL:AVG:COUN    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1         Returns the sensor name.
     N    Sets the allocated size of Name buffer.

Valid Values:
>0

Default Value: 10   �3����  �    Status                           �^   �  �    Instrument Handle                �� G  �  x    Channel                          �k G� �  x    Name                             �� �� �  `    Max Length                         	               1    	            10    L    This function sets the led mode.

Remote-control command(s):
SYST:LED:MODE    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    3    This control sets the led mode.

Valid Range:
RSNRPZ_LEDMODE_USER   (1) - User Settings
RSNRPZ_LEDMODE_SENSOR (2) - Sensor Functions

Default Value:
RSNRPZ_LEDMODE_USER   (1)

Note(s):
(1) User Settings - LED is controlled by user-settings

(2) Sensor Functions - LED is controlled by the sensor-functions   �h����  �    Status                           ��   �  �    Instrument Handle                �2 G  �  x    Channel                          �� G � � x    Mode                               	               1               HUser Settings RSNRPZ_LEDMODE_USER Sensor Function RSNRPZ_LEDMODE_SENSOR    O    This function returns the led mode.

Remote-control command(s):
SYST:LED:MODE    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1        Returns the led mode.

Returned Values:
RSNRPZ_LEDMODE_USER   (1) - User Settings
RSNRPZ_LEDMODE_SENSOR (2) - Sensor Functions

Note(s):
(1) User Settings - LED is controlled by user-settings

(2) Sensor Functions - LED is controlled by the sensor-functions   �r����  �    Status                           ��   �  �    Instrument Handle                �< G  �  x    Channel                          �� G � �  x    Mode                               	               1    	            L    This function sets the led color.

Remote-control command(s):
SYST:LED:COL    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    This control sets the led color.

Valid Range:
0 to 16777215

Default Value:
0

Note(s):
(1) Colore is 24-bit value which represents RGB values in the form of 0x00rrggbb, where rr, gg and
bb are 8 bit values for red, green and blue respectively.   ������  �    Status                           �)   �  �    Instrument Handle                �� G  �  x    Channel                          �6 G � �  x    Color                              	               1    0    A    Returns the led color.

Remote-control command(s):
SYST:LED:COL    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    Returns the led color.

Valid Range:
0 to 16777215 in hex format 0x00FFFFFF


Note(s):
(1) Colore is 24-bit value which represents RGB values in the form of 0x00rrggbb, where rr, gg and
bb are 8 bit values for red, green and blue respectively.   �l����  �    Status                           ȗ   �  �    Instrument Handle                �6 G  �  x    Channel                          ɤ G � �  x    Color                              	               1    	           P    This function sets the master port.

Remote-control command(s):
TRIG:MAST:PORT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1    !    This control sets the master port.

Valid Range:
RSNRPZ_PORT_EXT1 (1) - IO Signal
RSNRPZ_PORT_EXT2 (5) - TRIG 2 IO Signal

Default Value:
RSNRPZ_PORT_EXT1   (1)

Note(s):
(1) IO Signal - using the I/O signal on the Host-Interface connector

(2) TRIG2 I/O signal - using TRIG2 I/O signal
   ������  �    Status                           �   �  �    Instrument Handle                и G  �  x    Channel                          �& G � � x    Port                               	               1               <IO Signal RSNRPZ_PORT_EXT1 TRIG2 IO Signal RSNRPZ_PORT_EXT2    E    Returns the master port.

Remote-control command(s):
TRIG:MAST:PORT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    Returns the master port.

Returned Values:
RSNRPZ_PORT_EXT1 (1) - IO Signal
RSNRPZ_PORT_EXT2 (5) - TRIG 2 IO Signal

Note(s):
(1) IO Signal - using the I/O signal on the Host-Interface connector

(2) TRIG2 I/O signal - using TRIG2 I/O signal
   ������  �    Status                           ��   �  �    Instrument Handle                ؚ G  �  x    Channel                          � G � �  x    Port                               	               1    	            N    This function sets the sync port.

Remote-control command(s):
TRIG:SYNC:PORT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1        This control sets the sync port.

Valid Range:
RSNRPZ_PORT_EXT1 (1) - IO Signal
RSNRPZ_PORT_EXT2 (5) - TRIG 2 IO Signal

Default Value:
RSNRPZ_PORT_EXT1   (1)

Note(s):
(1) IO Signal - using the I/O signal on the Host-Interface connector

(2) TRIG2 I/O signal - using TRIG2 I/O signal
   �O����  �    Status                           �z   �  �    Instrument Handle                � G  �  x    Channel                          �� G � � x    Port                               	               1               <IO Signal RSNRPZ_PORT_EXT1 TRIG2 IO Signal RSNRPZ_PORT_EXT2    C    Returns the sync port.

Remote-control command(s):
TRIG:SYNC:PORT    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     f    This control defines the channel number.

Valid Range:
1 to max available channels

Default Value: 1     �    Returns the sync port.

Returned Values:
RSNRPZ_PORT_EXT1 (1) - IO Signal
RSNRPZ_PORT_EXT2 (5) - TRIG 2 IO Signal

Note(s):
(1) IO Signal - using the I/O signal on the Host-Interface connector

(2) TRIG2 I/O signal - using TRIG2 I/O signal
   �-����  �    Status                           �X   �  �    Instrument Handle                �� G  �  x    Channel                          �e G � �  x    Port                               	               1    	           8    Starting with revision 3.2.1.0 of this driver, the underlying low level library has been made usable by multiple applications concurrently. A sensor which is already in use by another running application cannot by initialized by a different In this case the rsnrpz_init() function would return a status NRP_ERROR_SENSOR_IN_USE (0xC0000022). 

rsnrpz_getUsageMap() can be used to get a textual description of the current sensor & application relationship. For a sensor which is already in use, the application which holds the sensor, is shown in the usage map. This information can, for example, be presented to a user. 

Due to syntax definitions the first parameter must be of type 'ViSession', but it is not used and should be chosen as 0 

The textual usage map is returned via a char buffer 'map' which should be supplied by the caller. 'maxLen' should be set to the size of the user's buffer in order to limit the amount of data which will be copied to 'map'.
If 'retLen' is not NULL, the current length of the usage map is returned here (which may be longer than 'maxLen'.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     *    Returns how big the full list would be.
     F    Returns a list of used sensors and their corresponding applications.     i    Defines size of the array pointed to by 'cp Map'.

Valid Values:
no range checking

Default Value: 1024   �����  �    Status                           �   �  �    Instrument Handle                �^ F� �  x    Ret Len                          � F % �  �    Map                              �� F � �  �    Max Len                            	               	            	            1024    U    This functions provides information about whether an NRP-Z5 is connected to the PC.    �    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
3FFF0085  Unknown status code - VI_WARN_UNKNOWN_STATUS
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  VI_NULL     h    This control returns whether NRP-Z5 is available on PC.

Valid Values:
0 - Not Available
1 - Available   ������  �    Status                           ��   �  �    Instrument Handle                �w G � �  `    Availability                       	           VI_NULL    	            �    If the above status function (= NrpGetDeviceStatusZ5() ) indicates that there is an NRP-Z5, this function supplies information about the connected devices at its ports A...D (using 'iPortIdx' = 0...3).    �    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
3FFF0085  Unknown status code - VI_WARN_UNKNOWN_STATUS
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  VI_NULL     �    This control selects the port.

Valid Values:
RSNRPZ_Z5_PORT_A (0) - A
RSNRPZ_Z5_PORT_B (1) - B
RSNRPZ_Z5_PORT_C (2) - C
RSNRPZ_Z5_PORT_D (3) - D

Default Value: RSNRPZ_Z5_PORT_A (0)     t    This control returns selected sensor's name.

Note(s):

(1) The array has to have allocated at least 128 elements.     t    This control returns selected sensor's type.

Note(s):

(1) The array has to have allocated at least 128 elements.     }    This control returns selected sensor's serial number.

Note(s):

(1) The array has to have allocated at least 128 elements.     j    Returns whether device is connected.

Valid Values:
VI_FALSE (0) - Disconnected
VI_TRUE  (1) - Connected   �|����  �    Status                           l   �  �    Instrument Handle                 G 2 � `    Port                             � G � �  `    Sensor Name                      J G/ �  `    Sensor Type                      � G� �  `    Sensor Serial                    K � � �  `    Connected                          	           VI_NULL               LA RSNRPZ_Z5_PORT_A B RSNRPZ_Z5_PORT_B C RSNRPZ_Z5_PORT_C D RSNRPZ_Z5_PORT_D    	            	            	            	           �    This function performs the following initialization actions and assigned specified sesnor to channel 1:

- Opens a session to the specified device using the interface and address specified in the Resource Name control.

- Performs an identification query on the sensor.

- Resets the instrument to a known state.

- Sends initialization commands to the sensor

- Returns an Instrument Handle which is used to differentiate between different sessions of this instrument driver.    E    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0011  Instrument returned invalid response to ID Query
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings

BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors
    #    This control specifies if an ID Query is sent to the instrument during the initialization procedure.

Valid Range:
VI_FALSE (0) - Skip Query
VI_TRUE  (1) - Do Query (Default Value)

Notes:
   
(1) Under normal circumstances the ID Query ensures that the instrument initialized is the type supported by this driver. However circumstances may arise where it is undesirable to send an ID Query to the instrument.  In those cases; set this control to "Skip Query" and this function will initialize the selected interface, without doing an ID Query.
     �    This control selects the port.

Valid Values:
RSNRPZ_Z5_PORT_A (0) - A
RSNRPZ_Z5_PORT_B (1) - B
RSNRPZ_Z5_PORT_C (2) - C
RSNRPZ_Z5_PORT_D (3) - D

Default Value: RSNRPZ_Z5_PORT_A (0)    H    This control specifies if the instrument is to be reset to its power-on settings during the initialization procedure.

Valid Range:
VI_FALSE (0) - Don't Reset
VI_TRUE  (1) - Reset Device (Default Value)

Notes:

(1) If you do not want the instrument reset. Set this control to "Don't Reset" while initializing the instrument.
    7    This control returns an Instrument Handle that is used in all subsequent function calls to differentiate between different sessions of this instrument driver.

Notes:

(1) Each time this function is invoked a Unique Session is opened.  It is possible to have more than one session open for the same resource.
  ���� 
 2��                                          	�����  �    Status                            X  �       ID Query                         0 W P � `    Port                             � [� �      Reset Device                     @ � � �  }    Instrument Handle                  DWarning: The driver requires NRP Toolkit installed on your computer    	         % Do Query VI_TRUE Skip Query VI_FALSE               LA RSNRPZ_Z5_PORT_A B RSNRPZ_Z5_PORT_B C RSNRPZ_Z5_PORT_C D RSNRPZ_Z5_PORT_D  * Reset Device VI_TRUE Don't Reset VI_FALSE    	           A    This function disconnect all channels and close driver session.    #    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred. To obtain a text description of the status code, call the rsnrpz_error_message function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None   ����  �    Status                           @   �  �    Instrument Handle                  	            ����         
�  'M             K.        init                                                                                                                                    ����         )`  /#             K.        chans_abort                                                                                                                             ����         /�  5�             K.        chans_getCount                                                                                                                          ����         6m  =�             K.        chans_initiate                                                                                                                          ����         >?  I             K.        chans_zero                                                                                                                              ����         I}  O�             K.        chans_isZeroingComplete                                                                                                                 ����         P�  U�             K.        chans_isMeasurementComplete                                                                                                             ����         V�  `�             K.        chan_mode                                                                                                                               ����         b�  j�             K.        timing_configureExclude                                                                                                                 ����         k�  r�             K.        timing_setTimingExcludeStart                                                                                                            ����         s�  y�             K.        timing_getTimingExcludeStart                                                                                                            ����         z�  ��             K.        timing_setTimingExcludeStop                                                                                                             ����         ��  �             K.        timing_getTimingExcludeStop                                                                                                             ����         �  �l             K.        bandwidth_setBw                                                                                                                         ����         �Z  �D             K.        bandwidth_getBw                                                                                                                         ����         �9  ��             K)        bandwidth_getBwList                                                                                                                     ����         ��  �<             K.        avg_configureAvgAuto                                                                                                                    ����         �*  ��             K.        avg_configureAvgNSRatio                                                                                                                 ����         ��  �<             K.        avg_configureAvgManual                                                                                                                  ����         �*  �
             K.        avg_setAutoEnabled                                                                                                                      ����         �  �             K.        avg_getAutoEnabled                                                                                                                      ����         �  �B             K.        avg_setAutoMaxMeasuringTime                                                                                                             ����         �2  �A             K.        avg_getAutoMaxMeasuringTime                                                                                                             ����         �6  ��             K.        avg_setAutoNoiseSignalRatio                                                                                                             ����         ��  ��             K.        avg_getAutoNoiseSignalRatio                                                                                                             ����         �  �[             K.        avg_setAutoResolution                                                                                                                   ����         �I  �C             K.        avg_getAutoResolution                                                                                                                   ����         �8 �             K.        avg_setAutoType                                                                                                                         ����        9 	�             K.        avg_getAutoType                                                                                                                         ����        
� ;             K.        avg_setCount                                                                                                                            ����        ) �             K.        avg_getCount                                                                                                                            ����        � �             K.        avg_setEnabled                                                                                                                          ����         � &�             K.        avg_getEnabled                                                                                                                          ����        '� .�             K.        avg_setSlot                                                                                                                             ����        /� 6              K.        avg_getSlot                                                                                                                             ����        7 =�             K.        avg_setTerminalControl                                                                                                                  ����        ?4 E�             K.        avg_getTerminalControl                                                                                                                  ����        F� L7             K.        avg_reset                                                                                                                               ����        L� Sy             K.        range_setAutoEnabled                                                                                                                    ����        T} Z�             K.        range_getAutoEnabled                                                                                                                    ����        [� c             K.        range_setCrossoverLevel                                                                                                                 ����        d j             K.        range_getCrossoverLevel                                                                                                                 ����        j� q�             K.        range_setRange                                                                                                                          ����        r� y             K.        range_getRange                                                                                                                          ����        z ��             K.        corr_configureCorrections                                                                                                               ����        �� �;             K.        chan_setCorrectionFrequency                                                                                                             ����        �. ��             K.        chan_getCorrectionFrequency                                                                                                             ����        �� ��             K.        chan_setCorrectionFrequencyStep                                                                                                         ����        �� �n             K.        chan_getCorrectionFrequencyStep                                                                                                         ����        �c �s             K.        chan_setCorrectionFrequencySpacing                                                                                                      ����        �� �~             K.        chan_getCorrectionFrequencySpacing                                                                                                      ����        �s �M             K.        corr_setOffset                                                                                                                          ����        �= ĝ             K.        corr_getOffset                                                                                                                          ����        Œ ˿             K.        corr_setOffsetEnabled                                                                                                                   ����        �� ��             K.        corr_getOffsetEnabled                                                                                                                   ����        �� �b             K.        corr_setSParamDeviceEnabled                                                                                                             ����        �f ��             K.        corr_getSParamDeviceEnabled                                                                                                             ����        � �n             K.        corr_setSParamDevice                                                                                                                    ����        �\ �             K.        corr_getSParamDevice                                                                                                                    ����        � �             K.        corr_getSParamDevList                                                                                                                   ����        �6 P             K.        chan_configureSourceGammaCorr                                                                                                           ����        � 
Q             K.        chan_setSourceGammaMagnitude                                                                                                            ����        A l             K.        chan_getSourceGammaMagnitude                                                                                                            ����        a �             K.        chan_setSourceGammaPhase                                                                                                                ����        �               K.        chan_getSourceGammaPhase                                                                                                                ����         � '�             K.        chan_setSourceGammaCorrEnabled                                                                                                          ����        (� .�             K.        chan_getSourceGammaCorrEnabled                                                                                                          ����        /� 7>             K.        chan_configureReflectGammaCorr                                                                                                          ����        8j ?�             K.        chan_setReflectionGammaMagn                                                                                                             ����        @� Ge             K.        chan_getReflectionGammaMagn                                                                                                             ����        HZ Oo             K.        chan_setReflectionGammaPhase                                                                                                            ����        P_ W             K.        chan_getReflectionGammaPhase                                                                                                            ����        W� ^9             K.        chan_setReflectionGammaUncertainty                                                                                                      ����        _) eW             K.        chan_getReflectionGammaUncertainty                                                                                                      ����        fL mN             K.        corr_configureDutyCycle                                                                                                                 ����        n� v             K.        corr_setDutyCycle                                                                                                                       ����        v� }             K.        corr_getDutyCycle                                                                                                                       ����        }� �e             K.        corr_setDutyCycleEnabled                                                                                                                ����        �i �j             K.        corr_getDutyCycleEnabled                                                                                                                ����        �_ ��             K.        chan_setContAvAperture                                                                                                                  ����        �� ��             K.        chan_getContAvAperture                                                                                                                  ����        �{ �|             K.        chan_setContAvSmoothingEnabled                                                                                                          ����        �� ��             K.        chan_getContAvSmoothingEnabled                                                                                                          ����        �� ��             K.        chan_setContAvBufferedEnabled                                                                                                           ����        �� ��             K.        chan_getContAvBufferedEnabled                                                                                                           ����        �� ��             K.        chan_setContAvBufferSize                                                                                                                ����        �� ��             K.        chan_getContAvBufferSize                                                                                                                ����        �� �_             K.        chan_getContAvBufferCount                                                                                                               ����        �T �%             K.        chan_getContAvBufferInfo                                                                                                                ����        ڎ ��             K.        chan_setBurstDropoutTolerance                                                                                                           ����        �� ��             K.        chan_getBurstDropoutTolerance                                                                                                           ����        �� ��             K.        chan_setBurstChopperEnabled                                                                                                             ����        �� ��             K.        chan_getBurstChopperEnabled                                                                                                             ����        �� �             K.        stat_confTimegate                                                                                                                       ����        ( �             K.        stat_confScale                                                                                                                          ����        * �             K.        stat_setOffsetTime                                                                                                                      ����        �              K.        stat_getOffsetTime                                                                                                                      ����         $�             K.        stat_setTime                                                                                                                            ����        %v +�             K.        stat_getTime                                                                                                                            ����        ,� 3�             K.        stat_setMidOffset                                                                                                                       ����        4 ;0             K.        stat_getMidOffset                                                                                                                       ����        <% BF             K.        stat_setMidLength                                                                                                                       ����        C6 I,             K.        stat_getMidLength                                                                                                                       ����        J! Q�             K.        stat_setScaleRefLevel                                                                                                                   ����        R� Zh             K.        stat_getScaleRefLevel                                                                                                                   ����        [] a�             K.        stat_setScaleRange                                                                                                                      ����        b� i0             K.        stat_getScaleRange                                                                                                                      ����        j% q�             K.        stat_setScalePoints                                                                                                                     ����        r� x�             K.        stat_getScalePoints                                                                                                                     ����        y� �W             K.        stat_getScaleWidth                                                                                                                      ����        �L �             K.        tslot_configureTimeSlot                                                                                                                 ����        �2 ��             K.        tslot_setTimeSlotCount                                                                                                                  ����        �� �K             K.        tslot_getTimeSlotCount                                                                                                                  ����        �@ ��             K.        tslot_setTimeSlotWidth                                                                                                                  ����        �� �-             K.        tslot_getTimeSlotWidth                                                                                                                  ����        �" ��             K.        tslot_setTimeSlotMidOffset                                                                                                              ����        �| ��             K.        tslot_getTimeSlotMidOffset                                                                                                              ����        �� �y             K.        tslot_setTimeSlotMidLength                                                                                                              ����        �i Ɲ             K.        tslot_getTimeSlotMidLength                                                                                                              ����        ǒ �u             K.        tslot_setTimeSlotChopperEnabled                                                                                                         ����        �y Հ             K.        tslot_getTimeSlotChopperEnabled                                                                                                         ����        �u ��             K.        scope_configureScope                                                                                                                    ����        � �(             K.        scope_fastZero                                                                                                                          ����        � �             K.        scope_setAverageEnabled                                                                                                                 ����        � �{             K.        scope_getAverageEnabled                                                                                                                 ����        �p �'             K.        scope_setAverageCount                                                                                                                   ����        �              K.        scope_getAverageCount                                                                                                                   ����        	 �             K.        scope_setAverageTerminalControl                                                                                                         ����        = �             K.        scope_getAverageTerminalControl                                                                                                         ����        � �             K.        scope_setOffsetTime                                                                                                                     ����        ~ $�             K.        scope_getOffsetTime                                                                                                                     ����        %� ,s             K.        scope_setPoints                                                                                                                         ����        -c 3�             K.        scope_getPoints                                                                                                                         ����        4� <�             K.        scope_setRealtimeEnabled                                                                                                                ����        =� D"             K.        scope_getRealtimeEnabled                                                                                                                ����        E K�             K.        scope_setTime                                                                                                                           ����        L� R�             K.        scope_getTime                                                                                                                           ����        S� Z�             K.        scope_setAutoEnabled                                                                                                                    ����        [� a�             K.        scope_getAutoEnabled                                                                                                                    ����        b� i�             K.        scope_setAutoMaxMeasuringTime                                                                                                           ����        j� q             K.        scope_getAutoMaxMeasuringTime                                                                                                           ����        q� x�             K.        scope_setAutoNoiseSignalRatio                                                                                                           ����        y� �             K.        scope_getAutoNoiseSignalRatio                                                                                                           ����        �� �J             K.        scope_setAutoResolution                                                                                                                 ����        �8 �=             K.        scope_getAutoResolution                                                                                                                 ����        �2 �(             K.        scope_setAutoType                                                                                                                       ����        �t �             K.        scope_getAutoType                                                                                                                       ����        � �n             K.        scope_setEquivalentSampling                                                                                                             ����        �r ��             K.        scope_getEquivalentSampling                                                                                                             ����        �� ��             K.        scope_meas_setMeasEnabled                                                                                                               ����        �� �d             K.        scope_meas_getMeasEnabled                                                                                                               ����        �Y �;             K.        scope_meas_setMeasAlgorithm                                                                                                             ����        �~ �b             K.        scope_meas_getMeasAlgorithm                                                                                                             ����        �W ݓ             K.        scope_meas_setLevelThresholds                                                                                                           ����        �� �n             K.        scope_meas_getLevelThresholds                                                                                                           ����        �� �             K.        scope_meas_setTime                                                                                                                      ����        � �             K.        scope_meas_getTime                                                                                                                      ����        �  	             K.        scope_meas_setOffsetTime                                                                                                                ����         � �             K.        scope_meas_getOffsetTime                                                                                                                ����        � �             K.        scope_meas_getPulseTimes                                                                                                                ����        r �             K.        scope_meas_getPulseTransition                                                                                                           ����        � &k             K.        scope_meas_getPulsePower                                                                                                                ����        '� .�             K.        scope_meas_getPulseLevels                                                                                                               ����        0	 7�             K.        scope_meas_getPulseReferenceLevels                                                                                                      ����        9) A�             K.        scope_meas_setEquivalentSampling                                                                                                        ����        B� I�             K.        scope_meas_getEquivalentSampling                                                                                                        ����        J� Q�             K.        scope_meas_getSamplePeriod                                                                                                              ����        R� Z�             K.        trigger_configureInternal                                                                                                               ����        \- c             K.        trigger_configureExternal                                                                                                               ����        d j�             K.        trigger_immediate                                                                                                                       ����        k� rj             K.        trigger_setAutoDelayEnabled                                                                                                             ����        sn y�             K.        trigger_getAutoDelayEnabled                                                                                                             ����        zy ��             K.        trigger_setAutoTriggerEnabled                                                                                                           ����        �� ��             K.        trigger_getAutoTriggerEnabled                                                                                                           ����        �� ��             K.        trigger_setCount                                                                                                                        ����        �u ��             K.        trigger_getCount                                                                                                                        ����        �� ��             K.        trigger_setDelay                                                                                                                        ����        �� �C             K.        trigger_getDelay                                                                                                                        ����        �8 ��             K.        trigger_setHoldoff                                                                                                                      ����        �� �V             K.        trigger_getHoldoff                                                                                                                      ����        �K �s             K.        trigger_setHysteresis                                                                                                                   ����        �c �E             K.        trigger_getHysteresis                                                                                                                   ����        �: �`             K.        trigger_setLevel                                                                                                                        ����        �S ԉ             K.        trigger_getLevel                                                                                                                        ����        �~ �b             K.        trigger_setSlope                                                                                                                        ����        ݘ �Q             K.        trigger_getSlope                                                                                                                        ����        �F �             K.        trigger_setSource                                                                                                                       ����        �� �	             K.        trigger_getSource                                                                                                                       ����        �� �             K.        trigger_setDropoutTime                                                                                                                  ����        � �             K.        trigger_getDropoutTime                                                                                                                  ����        	� U             K.        trigger_setMasterState                                                                                                                  ����        Y `             K.        trigger_getMasterState                                                                                                                  ����        U $�             K.        trigger_setSyncState                                                                                                                    ����        %� +�             K.        trigger_getSyncState                                                                                                                    ����        ,� 4�             K.        chan_info                                                                                                                               ����        6 @g             K.        chan_infoHeader                                                                                                                         ����        A� H>             K.        chan_infosCount                                                                                                                         ����        I3 O�             K.        system_setStatusUpdateTime                                                                                                              ����        P� V�             K.        system_getStatusUpdateTime                                                                                                              ����        W� ^�             K.        system_setResultUpdateTime                                                                                                              ����        _} e�             K.        system_getResultUpdateTime                                                                                                              ����        f� m�             K.        calib_test                                                                                                                              ����        n{ u�             K.        calib_getTestDeviation                                                                                                                  ����        v� }&             K.        calib_getTestReference                                                                                                                  ����        ~ �V             K.        chan_abort                                                                                                                              ����        �
 ��             K.        chan_initiate                                                                                                                           ����        �� ��             K.        chan_setInitContinuousEnabled                                                                                                           ����        �� �1             K.        chan_getInitContinuousEnabled                                                                                                           ����        �& ��             K.        chan_reset                                                                                                                              ����        �t �z             K.        chan_setSamplingFrequency                                                                                                               ����        �� �d             K.        chan_getSamplingFrequency                                                                                                               ����        �Y ��             K.        chan_zero                                                                                                                               ����        �k �S             K.        chan_zeroAdvanced                                                                                                                       ����        Ɍ �s             K.        chan_isZeroComplete                                                                                                                     ����        �h �R             K.        chan_isMeasurementComplete                                                                                                              ����        �G ޷             K.        chan_selfTest                                                                                                                           ����        ߬ �P             K.        chan_setAuxiliary                                                                                                                       ����        � �a             K.        chan_getAuxiliary                                                                                                                       ����        �V ��             K.        meass_readMeasurement                                                                                                                   ����        � �             K.        meass_fetchMeasurement                                                                                                                  ����        � +             K.        meass_readBufferMeasurement                                                                                                             ����        � U             K.        meass_fetchBufferMeasurement                                                                                                            ����        �  �             K.        meass_sendSoftwareTrigger                                                                                                               ����        !8 *�             K.        meass_readMeasurementAux                                                                                                                ����        ,G 7�             K.        meass_fetchMeasurementAux                                                                                                               ����        9� C�         	    K.        meass_readBufferMeasurementAux                                                                                                          ����        E� R�         	    K.        meass_fetchBufferMeasurementAux                                                                                                         ����        T� Y�             K.        status_preset                                                                                                                           ����        ZJ b             K.        errorCheckState                                                                                                                         ����        cI i:             K.        reset                                                                                                                                   ����        i� q              K.        self_test                                                                                                                               ����        r y,             K.        error_query                                                                                                                             ����        z( �m             K.        error_message                                                                                                                           ����        �i �2             K.        revision_query                                                                                                                          ����        �5 ��             K.        GetSensorCount                                                                                                                          ����        �� ��             K.        GetSensorInfo                                                                                                                           ����        �y ��             K.        setSensorName                                                                                                                           ����        �� ��             K.        getSensorName                                                                                                                           ����        � ��             K.        setLedMode                                                                                                                              ����        � ��             K.        getLedMode                                                                                                                              ����        �� �5             K.        setLedColor                                                                                                                             ����        �# ʡ             K.        getLedColor                                                                                                                             ����        ˖ �O             K.        trigger_setMasterPort                                                                                                                   ����        Ӄ �             K.        trigger_getMasterPort                                                                                                                   ����        �� �             K.        trigger_setSyncPort                                                                                                                     ����        �� �_             K.        trigger_getSyncPort                                                                                                                     ����        �T �O             K.        getUsageMap                                                                                                                             ����        �� ��             K.        GetDeviceStatusZ5                                                                                                                       ����        �� �             K.        GetDeviceInfoZ5                                                                                                                         ����        �              K.        initZ5                                                                                                                                  ����        � �             K.        close                                                                                                                                         R&S NRPZ Power Sensor                                                                �Initialize                                                                        ����Channels                                                                             �Abort                                                                                �Count                                                                                �Initiate                                                                             �Zero                                                                                 �Get Zeroing Complete State                                                           �Get Measurement Complete State                                                    ����Channel                                                                              �Measurement Mode                                                                  ����Timing                                                                               �Configure Exclude                                                                 ����Low-Level                                                                            �Set Timing Exclude Start                                                             �Get Timing Exclude Start                                                             �Set Timing Exclude Stop                                                              �Get Timing Exclude Stop                                                           ����Bandwidth                                                                            �Set Video Bandwidth                                                                  �Get Video Bandwidth                                                                  �Get Video Bandwidth List                                                          ����Averaging                                                                            �Configure Averaging Auto                                                             �Configure Averaging NS Ratio                                                         �Configure Averaging Manual                                                        ����Low-Level                                                                            �Set Auto Averaging State                                                             �Get Auto Averaging State                                                             �Set Auto Max Measuring Time                                                          �Get Auto Max Measuring Time                                                          �Set Auto Noise Signal Ratio                                                          �Get Auto Noise Signal Ratio                                                          �Set Auto Resolution                                                                  �Get Auto Resolution                                                                  �Set Auto Type                                                                        �Get Auto Type                                                                        �Set Averaging Count                                                                  �Get Averaging Count                                                                  �Set Averaging State                                                                  �Get Averaging State                                                                  �Set Timeslot                                                                         �Get Timeslot                                                                         �Set Terminal Control                                                                 �Get Terminal Control                                                                 �Reset                                                                             ����Range                                                                             ����Low-Level                                                                            �Set Auto Range State                                                                 �Get Auto Range State                                                                 �Set Crossover Level                                                                  �Get Crossover Level                                                                  �Set Range                                                                            �Get Range                                                                         ����Corrections                                                                          �Configure Corrections                                                                �Set Correction Frequency                                                             �Get Correction Frequency                                                             �Set Correction Frequency Step                                                        �Get Correction Frequency Step                                                        �Set Correction Frequency Spacing                                                     �Get Correction Frequency Spacing                                                  ����Offset                                                                               �Set Offset                                                                           �Get Offset                                                                           �Set Offset State                                                                     �Get Offset State                                                                  ����S-Parameter                                                                          �Set S-Parameter Device State                                                         �Get S-Parameter Device State                                                         �Set S-Parameter Device                                                               �Get S-Parameter Device                                                               �Get S-Parameter Device List                                                       ����Source Gamma Correction                                                              �Configure Source Gamma Corr                                                       ����Low-Level                                                                            �Set Source Gamma Magnitude                                                           �Get Source Gamma Magnitude                                                           �Set Source Gamma Phase                                                               �Get Source Gamma Phase                                                               �Set Source Gamma Corr State                                                          �Get Source Gamma Corr State                                                       ����Reflection Gamma Correction                                                          �Configure Reflection Gamma Corr                                                   ����Low-Level                                                                            �Set Reflection Gamma Magnitude                                                       �Get Reflection Gamma Magnitude                                                       �Set Reflection Gamma Phase                                                           �Get Reflection Gamma Phase                                                           �Set Reflection Gamma Uncertainty                                                     �Get Reflection Gamma Uncertainty                                                  ����Duty Cycle                                                                           �Configure Duty Cycle                                                              ����Low-Level                                                                            �Set Duty Cycle                                                                       �Get Duty Cycle                                                                       �Set Duty Cycle State                                                                 �Get Duty Cycle State                                                              ����ContAv                                                                               �Set ContAv Aperture                                                                  �Get ContAv Aperture                                                                  �Set ContAv Smoothing State                                                           �Get ContAv Smoothing State                                                        ����Buffered ContAv                                                                      �Set Buffered ContAv State                                                            �Get Buffered ContAv State                                                            �Set ContAv Buffer Size                                                               �Get ContAv Buffer Size                                                               �Get ContAv Buffer Count                                                              �Get ContAv Buffer Info                                                            ����BurstAv                                                                              �Set Burst Drop-Out Tolerance                                                         �Get Burst Drop-Out Tolerance                                                         �Set Burst Chopper State                                                              �Get Burst Chopper State                                                           ����Statistics                                                                           �Configure Statistics Timegate                                                        �Configure Statistics Scale                                                        ����Low-Level                                                                            �Set Statistics Offset Time                                                           �Get Statistics Offset Time                                                           �Set Statistics Time                                                                  �Get Statistics Time                                                                  �Set Statistics Mid Offset                                                            �Get Statistics Mid Offset                                                            �Set Statistics Mid Length                                                            �Get Statistics Mid Length                                                            �Set Statistics Scale Ref Level                                                       �Get Statistics Scale Ref Level                                                       �Set Statistics Scale Range                                                           �Get Statistics Scale Range                                                           �Set Statistics Scale Points                                                          �Get Statistics Scale Points                                                          �Get Statistics Scale Width                                                        ����Timeslot                                                                             �Configure Timeslot                                                                ����Low-Level                                                                            �Set Time Slot Count                                                                  �Get Time Slot Count                                                                  �Set Time Slot Width                                                                  �Get Time Slot Width                                                                  �Set Time Slot Mid Offset                                                             �Get Time Slot Mid Offset                                                             �Set Time Slot Mid Length                                                             �Get Time Slot Mid Length                                                             �Set Time Slot Chopper State                                                          �Get Time Slot Chopper State                                                       ����Scope                                                                                �Configure Scope                                                                      �Fast Zero                                                                         ����Low-Level                                                                            �Set Scope Averaging State                                                            �Get Scope Averaging State                                                            �Set Scope Average Count                                                              �Get Scope Average Count                                                              �Set Scope Terminal Control                                                           �Get Scope Terminal Control                                                           �Set Scope Offset Time                                                                �Get Scope Offset Time                                                                �Set Scope Points                                                                     �Get Scope Points                                                                     �Set Scope Realtime State                                                             �Get Scope Realtime State                                                             �Set Scope Time                                                                       �Get Scope Time                                                                       �Set Scope Auto Averaging State                                                       �Get Scope Auto Averaging State                                                       �Set Scope Auto Max Meas Time                                                         �Get Scope Auto Max Meas Time                                                         �Set Scope Auto NSR                                                                   �Get Scope Auto NSR                                                                   �Set Scope Auto Resolution                                                            �Get Scope Auto Resolution                                                            �Set Scope Auto Type                                                                  �Get Scope Auto Type                                                                  �Set Scope Equivalent Sampling                                                        �Get Scope Equivalent Sampling                                                     ����Pulse Analysis Measurement                                                           �Set Scope Measurements State                                                         �Get Scope Measurements State                                                         �Set Scope Measurements Algorithm                                                     �Get Scope Measurements Algorithm                                                     �Set Scope Measurements Level Thresholds                                              �Get Scope Measurements Level Thresholds                                              �Set Scope Measurements Time                                                          �Get Scope Measurements Time                                                          �Set Scope Measurements Offset Time                                                   �Get Scope Measurements Offset Time                                                   �Get Scope Measurements Pulse Times                                                   �Get Scope Measurements Pulse Transition                                              �Get Scope Measurements Pulse Power                                                   �Get Scope Measurements Pulse Levels                                                  �Get Scope Measurements Pulse Reference Levels                                        �Set Scope Measurement Equivalent Sampling                                            �Get Scope Measurement Equivalent Sampling                                            �Get Scope Measurement Sample Period                                               ����Trigger                                                                              �Configure Internal                                                                   �Configure External                                                                   �Immediate Trigger                                                                 ����Low-Level                                                                            �Set Trigger Auto Delay State                                                         �Get Trigger Auto Delay State                                                         �Set Auto Trigger State                                                               �Get Auto Trigger State                                                               �Set Trigger Count                                                                    �Get Trigger Count                                                                    �Set Trigger Delay                                                                    �Get Trigger Delay                                                                    �Set Trigger Holdoff                                                                  �Get Trigger Holdoff                                                                  �Set Trigger Hysteresis                                                               �Get Trigger Hysteresis                                                               �Set Trigger Level                                                                    �Get Trigger Level                                                                    �Set Trigger Slope                                                                    �Get Trigger Slope                                                                    �Set Trigger Source                                                                   �Get Trigger Source                                                                   �Set Dropout Time                                                                     �Get Dropout Time                                                                     �Set Trigger Master State                                                             �Get Trigger Master State                                                             �Set Trigger Synchronization State                                                    �Get Trigger Synchronization State                                                 ����Sensor Info                                                                          �Sensor Info                                                                          �Sensors Info Header                                                                  �Sensors Info Count                                                                ����System                                                                               �Set Status Update Time                                                               �Get Status Update Time                                                               �Set Result Update Time                                                               �Get Result Update Time                                                            ����Calibration                                                                          �Test                                                                                 �Get Test Deviation                                                                   �Get Test Reference                                                                   �Abort                                                                                �Initiate                                                                             �Set Initiate Continuous State                                                        �Get Initiate Continuous State                                                        �Reset                                                                                �Set Sampling Frequency                                                               �Get Sampling Frequency                                                               �Zero                                                                                 �Advanced Zero                                                                        �Get Zeroing Complete State                                                           �Get Measurement Complete State                                                       �Sensor Self Test                                                                     �Set Auxiliary Value                                                                  �Get Auxiliary Value                                                               ����Measurement                                                                          �Read Measurement                                                                     �Fetch Measurement                                                                    �Read Buffer Data                                                                     �Fetch Buffer Data                                                                    �Send Software Trigger                                                                �Read Measurement Aux                                                                 �Fetch Measurement Aux                                                                �Read Buffer Data Aux                                                                 �Fetch Buffer Data Aux                                                             ����Status                                                                               �Preset                                                                              kUtility Functions                                                                    �State Checking                                                                       �Reset                                                                                �Self-Test                                                                            �Error-Query                                                                          �Error Message                                                                        �Revision Query                                                                       �Get Sensor Count                                                                     �Get Sensor Info                                                                      �Set Sensor Name                                                                      �Get Sensor Name                                                                      �Set Led Mode                                                                         �Get Led Mode                                                                         �Set Led Color                                                                        �Get Led Color                                                                        �Set Master Port                                                                      �Get Master Port                                                                      �Set Sync Port                                                                        �Get Sync Port                                                                        �Get Usage Map                                                                       
lNRP-Z5                                                                               �Get Device Status Z5                                                                 �Get Device Info Z5                                                                   �Initialize Z5                                                                        �Close                                                                           