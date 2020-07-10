//==============================================================================
//
// Title:      rsnrpz_clang_Continuous_Average_Example
// Purpose:    Demonstration example on how to use rsnrpz instrument driver
//             to set the cursor, trace waveform and read cursor distances
// Notes:      To run the example you need to install rsnrpz VXI Plug&Play
//             instrument driver version 3.4.1.0 or later.
//             Default locations of instrument driver files on 32bit Windows:
//             C:\Program Files (x86)\IVI Foundation\VISA\WinNT\rsnrpz\rsnrpz.fp
//             C:\Program Files (x86)\IVI Foundation\VISA\WinNT\include\rsnrpz.h
//             C:\Program Files (x86)\IVI Foundation\VISA\WinNT\lib\msc\rsnrpz_32.lib
//             Default locations of instrument driver files on 64bit Windows:
//             C:\Program Files\IVI Foundation\VISA\Win64\rsnrpz\rsnrpz.fp
//             C:\Program Files\IVI Foundation\VISA\Win64\include\rsnrpz.h
//             C:\Program Files\IVI Foundation\VISA\Win64\lib\msc\rsnrpz_64.lib
//
// Created on: 09/2016 by Miloslav Macko.
// Copyright:  Rohde & Schwarz GmbH & Co. KG. All Rights Reserved.
//
//==============================================================================

//==============================================================================
// Include files
#include <rsnrpz.h>
#include <stdio.h>
#include <math.h>

//==============================================================================
// Constants
#define STRING_LENGTH 512  

//==============================================================================
// Types

//==============================================================================
// Static global variables
static ViString  gs_sResourceName = "USB::0xAAD::*?";
static ViBoolean gs_hIDQuery = VI_TRUE;
static ViBoolean gs_hResetDevice = VI_TRUE;

//==============================================================================
// Global variables
ViSession g_Session = 0;

//==============================================================================
// Global functions
/// HIFN Checks for instrument error
/// HIRET Error code
/// HIPAR status/Status code to be checked, returned from instrument driver function call
ViStatus checkError(ViStatus status)
{
	ViChar  error_message[STRING_LENGTH];
	ViChar  error_buffer[STRING_LENGTH * 2];
	ViChar* p2buf;

	if (status < VI_SUCCESS)
	{
		rsnrpz_error_message(g_Session, status, error_message);
		p2buf = error_buffer + sprintf(error_buffer, "Primary Error: 0x%08X, %s\n", status, error_message);
		
		rsnrpz_close(g_Session);
		printf("\nERROR!\n\n");
		printf(error_buffer);
		printf("\nPress ENTER to continue...");
		(void)getchar();

	}
	return status;
}

//==============================================================================
// Macros
#define CHECKERR(fCal) \
    if (status = checkError((fCal)), status < VI_SUCCESS) \
        return status; else

/// HIFN  The main entry-point function.
/// HIRET Returns 0 if successful. Otherwise returns instrument driver error 
/// HIRET code
int main (void)
{
	int measurementsCount = 10;
	double measValue;
	ViStatus status = VI_SUCCESS;
	ViChar   serror_message [256] = "No Error";
	ViChar	 sensorName[256], sensorType[256], sensorSN[256];
	ViBoolean measComplete = VI_FALSE;
	ViReal64 result;
  
  printf ("Initializing instrument '%s' ... ", gs_sResourceName);
  CHECKERR(rsnrpz_init(gs_sResourceName, gs_hIDQuery, gs_hResetDevice, &g_Session));
  printf ("success.\n\n");
  
  printf ("Reading sensor info ...\n");
  CHECKERR(rsnrpz_GetSensorInfo(g_Session, 1, sensorName, sensorType, sensorSN));
  printf ("Connected sensor name: %s\n", sensorName);
  printf ("Connected sensor type: %s\n", sensorType);
  printf ("Connected sensor serial number: %s\n", sensorSN);
  
  CHECKERR(rsnrpz_chan_mode(g_Session, 1, RSNRPZ_SENSOR_MODE_CONTAV)); //Continuous average mode non-buffered
  CHECKERR(rsnrpz_chan_setCorrectionFrequency(g_Session, 1, 100E6)); //correction frequency 100MHz
  CHECKERR(rsnrpz_avg_setAutoEnabled(g_Session, 1, VI_FALSE)); //auto averaging OFF
  CHECKERR(rsnrpz_avg_configureAvgManual(g_Session, 1, 4)); //average count 4 samples

  CHECKERR(rsnrpz_chan_setContAvAperture(g_Session, 1, 100E-6)); //integration time of 100us
  CHECKERR(rsnrpz_trigger_setSource(g_Session, 1, RSNRPZ_TRIGGER_SOURCE_IMMEDIATE)); //trigger immediate
  CHECKERR(rsnrpz_chan_setContAvSmoothingEnabled(g_Session, 1, VI_TRUE)); //smoothing of the results using a low-pass filter

  printf("\nMeasured values in dBm:\n");
  for (int i = 0; i < measurementsCount; i++)
  {
	  //start the measurement
	  CHECKERR(rsnrpz_chans_initiate(g_Session));

	  //wait until the measurement is ready
	  do
	  {
		  CHECKERR(rsnrpz_chan_isMeasurementComplete(g_Session, 1, &measComplete));
	  } while (!measComplete);

	  if (measComplete)
	  {
		  CHECKERR(rsnrpz_meass_fetchMeasurement(g_Session, 1, &result)); //fetch the result in Watts
		  measValue = 10 * log(fabs(result)) / log(10.0) + 30.0; //Watt to dBm
		  printf("%0.3f, ", measValue);
	  }
  }
    
  printf ("\n\nClosing the session to instrument '%s' ... ", gs_sResourceName);
  CHECKERR(rsnrpz_close(g_Session));
  printf ("success.\n\n");
  
  printf ("\nPress ENTER to continue...");
  (void) getchar();
  
  return status;
}

