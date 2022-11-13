// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xcanny.h"

extern XCanny_Config XCanny_ConfigTable[];

XCanny_Config *XCanny_LookupConfig(u16 DeviceId) {
	XCanny_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCANNY_NUM_INSTANCES; Index++) {
		if (XCanny_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XCanny_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCanny_Initialize(XCanny *InstancePtr, u16 DeviceId) {
	XCanny_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCanny_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCanny_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

