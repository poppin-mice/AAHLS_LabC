// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R_H__
#define __cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 12;
  static const unsigned AddressRange = 11;
  static const unsigned AddressWidth = 4;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R_ram) {
        ram[0] = "0b110010010001";
        ram[1] = "0b011101101011";
        ram[2] = "0b001111101011";
        ram[3] = "0b000111111101";
        ram[4] = "0b000100000000";
        ram[5] = "0b000010000000";
        ram[6] = "0b000001000000";
        ram[7] = "0b000000100000";
        ram[8] = "0b000000010000";
        ram[9] = "0b000000001000";
        ram[10] = "0b000000000100";


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();
   }


void prc_write_0()
{
    if (ce0.read() == sc_dt::Log_1) 
    {
            if(address0.read().is_01() && address0.read().to_uint()<AddressRange)
              q0 = ram[address0.read().to_uint()];
            else
              q0 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R) {


static const unsigned DataWidth = 12;
static const unsigned AddressRange = 11;
static const unsigned AddressWidth = 4;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R_ram* meminst;


SC_CTOR(cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R) {
meminst = new cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R_ram("cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R() {
    delete meminst;
}


};//endmodule
#endif
