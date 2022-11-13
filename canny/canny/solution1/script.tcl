############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project canny
set_top canny
add_files canny.cpp -cflags "-I."
add_files canny.hpp -cflags "-I."
add_files -tb src.txt -cflags "-I. -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb dst.txt -cflags "-I. -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb canny_test.cpp -cflags "-I. -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vitis
set_part {xc7z020-clg400-1}
create_clock -period 4.8 -name default
config_interface -m_axi_alignment_byte_size 64 -m_axi_latency 64 -m_axi_max_widen_bitwidth 512
config_rtl -register_reset_num 3
set_clock_uncertainty 0
source "./canny/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -format ip_catalog
