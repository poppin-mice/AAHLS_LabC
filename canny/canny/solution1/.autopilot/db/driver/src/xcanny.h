// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XCANNY_H
#define XCANNY_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xcanny_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XCanny_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XCanny;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XCanny_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XCanny_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XCanny_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XCanny_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XCanny_Initialize(XCanny *InstancePtr, u16 DeviceId);
XCanny_Config* XCanny_LookupConfig(u16 DeviceId);
int XCanny_CfgInitialize(XCanny *InstancePtr, XCanny_Config *ConfigPtr);
#else
int XCanny_Initialize(XCanny *InstancePtr, const char* InstanceName);
int XCanny_Release(XCanny *InstancePtr);
#endif

void XCanny_Start(XCanny *InstancePtr);
u32 XCanny_IsDone(XCanny *InstancePtr);
u32 XCanny_IsIdle(XCanny *InstancePtr);
u32 XCanny_IsReady(XCanny *InstancePtr);
void XCanny_Continue(XCanny *InstancePtr);
void XCanny_EnableAutoRestart(XCanny *InstancePtr);
void XCanny_DisableAutoRestart(XCanny *InstancePtr);

void XCanny_Set_upperThresh(XCanny *InstancePtr, u32 Data);
u32 XCanny_Get_upperThresh(XCanny *InstancePtr);
void XCanny_Set_lowerThresh(XCanny *InstancePtr, u32 Data);
u32 XCanny_Get_lowerThresh(XCanny *InstancePtr);

void XCanny_InterruptGlobalEnable(XCanny *InstancePtr);
void XCanny_InterruptGlobalDisable(XCanny *InstancePtr);
void XCanny_InterruptEnable(XCanny *InstancePtr, u32 Mask);
void XCanny_InterruptDisable(XCanny *InstancePtr, u32 Mask);
void XCanny_InterruptClear(XCanny *InstancePtr, u32 Mask);
u32 XCanny_InterruptGetEnabled(XCanny *InstancePtr);
u32 XCanny_InterruptGetStatus(XCanny *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
