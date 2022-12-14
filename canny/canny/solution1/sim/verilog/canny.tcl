
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set upperThresh__lowerThresh__return_group [add_wave_group upperThresh__lowerThresh__return(axi_slave) -into $cinoutgroup]
add_wave /apatb_canny_top/AESL_inst_canny/interrupt -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_BRESP -into $upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_BREADY -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_BVALID -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_RRESP -into $upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_RDATA -into $upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_RREADY -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_RVALID -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_ARREADY -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_ARVALID -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_ARADDR -into $upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_WSTRB -into $upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_WDATA -into $upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_WREADY -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_WVALID -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_AWREADY -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_AWVALID -into $upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/s_axi_control_AWADDR -into $upperThresh__lowerThresh__return_group -radix hex
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $coutputgroup]
add_wave /apatb_canny_top/AESL_inst_canny/dst_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/dst_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/dst_TDATA -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $cinputgroup]
add_wave /apatb_canny_top/AESL_inst_canny/src_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/src_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/AESL_inst_canny/src_TDATA -into $return_group -radix hex
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_canny_top/AESL_inst_canny/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_canny_top/AESL_inst_canny/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_canny_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_canny_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_canny_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_canny_top/LENGTH_src -into $tb_portdepth_group -radix hex
add_wave /apatb_canny_top/LENGTH_dst -into $tb_portdepth_group -radix hex
add_wave /apatb_canny_top/LENGTH_upperThresh -into $tb_portdepth_group -radix hex
add_wave /apatb_canny_top/LENGTH_lowerThresh -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_upperThresh__lowerThresh__return_group [add_wave_group upperThresh__lowerThresh__return(axi_slave) -into $tbcinoutgroup]
add_wave /apatb_canny_top/control_INTERRUPT -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_BRESP -into $tb_upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/control_BREADY -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_BVALID -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_RRESP -into $tb_upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/control_RDATA -into $tb_upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/control_RREADY -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_RVALID -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_ARREADY -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_ARVALID -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_ARADDR -into $tb_upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/control_WSTRB -into $tb_upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/control_WDATA -into $tb_upperThresh__lowerThresh__return_group -radix hex
add_wave /apatb_canny_top/control_WREADY -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_WVALID -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_AWREADY -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_AWVALID -into $tb_upperThresh__lowerThresh__return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/control_AWADDR -into $tb_upperThresh__lowerThresh__return_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(axis) -into $tbcoutputgroup]
add_wave /apatb_canny_top/dst_TREADY -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/dst_TVALID -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/dst_TDATA -into $tb_return_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(axis) -into $tbcinputgroup]
add_wave /apatb_canny_top/src_TREADY -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/src_TVALID -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_canny_top/src_TDATA -into $tb_return_group -radix hex
save_wave_config canny.wcfg
run all
quit

