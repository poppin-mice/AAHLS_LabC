// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xcanny.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCanny_CfgInitialize(XCanny *InstancePtr, XCanny_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCanny_Start(XCanny *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_AP_CTRL) & 0x80;
    XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XCanny_IsDone(XCanny *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XCanny_IsIdle(XCanny *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XCanny_IsReady(XCanny *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XCanny_Continue(XCanny *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_AP_CTRL) & 0x80;
    XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XCanny_EnableAutoRestart(XCanny *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XCanny_DisableAutoRestart(XCanny *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_AP_CTRL, 0);
}

void XCanny_Set_upperThresh(XCanny *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_UPPERTHRESH_DATA, Data);
}

u32 XCanny_Get_upperThresh(XCanny *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_UPPERTHRESH_DATA);
    return Data;
}

void XCanny_Set_lowerThresh(XCanny *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_LOWERTHRESH_DATA, Data);
}

u32 XCanny_Get_lowerThresh(XCanny *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_LOWERTHRESH_DATA);
    return Data;
}

void XCanny_InterruptGlobalEnable(XCanny *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_GIE, 1);
}

void XCanny_InterruptGlobalDisable(XCanny *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_GIE, 0);
}

void XCanny_InterruptEnable(XCanny *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_IER);
    XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_IER, Register | Mask);
}

void XCanny_InterruptDisable(XCanny *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_IER);
    XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_IER, Register & (~Mask));
}

void XCanny_InterruptClear(XCanny *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XCanny_WriteReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_ISR, Mask);
}

u32 XCanny_InterruptGetEnabled(XCanny *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_IER);
}

u32 XCanny_InterruptGetStatus(XCanny *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XCanny_ReadReg(InstancePtr->Control_BaseAddress, XCANNY_CONTROL_ADDR_ISR);
}

