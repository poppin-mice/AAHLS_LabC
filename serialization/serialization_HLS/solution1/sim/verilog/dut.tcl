
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set src_buff__dst_buff_group [add_wave_group src_buff__dst_buff(axi_master) -into $cinoutgroup]
set rdata_group [add_wave_group "Read Channel" -into $src_buff__dst_buff_group]
set wdata_group [add_wave_group "Write Channel" -into $src_buff__dst_buff_group]
set ctrl_group [add_wave_group "Handshakes" -into $src_buff__dst_buff_group]
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_BUSER -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_BID -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_BRESP -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_RRESP -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_RUSER -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_RID -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_RDATA -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARUSER -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARREGION -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARQOS -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARPROT -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARBURST -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARLEN -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARID -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARADDR -into $rdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_WUSER -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_WID -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_WSTRB -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_WDATA -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWUSER -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWREGION -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWQOS -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWPROT -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWBURST -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWLEN -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWID -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWADDR -into $wdata_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/m_axi_gmem_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(wire) -into $cinputgroup]
add_wave /apatb_dut_top/AESL_inst_dut/src_sz -into $return_group -radix hex
set src_buff__dst_buff_group [add_wave_group src_buff__dst_buff(axi_slave) -into $cinputgroup]
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_BRESP -into $src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_BREADY -into $src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_BVALID -into $src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_RRESP -into $src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_RDATA -into $src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_RREADY -into $src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_RVALID -into $src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_ARREADY -into $src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_ARVALID -into $src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_ARADDR -into $src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_WSTRB -into $src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_WDATA -into $src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_WREADY -into $src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_WVALID -into $src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_AWREADY -into $src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_AWVALID -into $src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_AWADDR -into $src_buff__dst_buff_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_dut_top/AESL_inst_dut/ap_start -into $blocksiggroup
add_wave /apatb_dut_top/AESL_inst_dut/ap_done -into $blocksiggroup
add_wave /apatb_dut_top/AESL_inst_dut/ap_idle -into $blocksiggroup
add_wave /apatb_dut_top/AESL_inst_dut/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_dut_top/AESL_inst_dut/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_dut_top/AESL_inst_dut/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_dut_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_dut_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_dut_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_dut_top/LENGTH_src_buff -into $tb_portdepth_group -radix hex
add_wave /apatb_dut_top/LENGTH_src_sz -into $tb_portdepth_group -radix hex
add_wave /apatb_dut_top/LENGTH_dst_buff -into $tb_portdepth_group -radix hex
add_wave /apatb_dut_top/LENGTH_gmem -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_src_buff__dst_buff_group [add_wave_group src_buff__dst_buff(axi_master) -into $tbcinoutgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_src_buff__dst_buff_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_src_buff__dst_buff_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_src_buff__dst_buff_group]
add_wave /apatb_dut_top/gmem_BUSER -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_BID -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_BRESP -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_RRESP -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_RUSER -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_RID -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_RDATA -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_ARUSER -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARREGION -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARQOS -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARPROT -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARBURST -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARLEN -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARID -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARADDR -into $rdata_group -radix hex
add_wave /apatb_dut_top/gmem_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_WUSER -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_WID -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_WSTRB -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_WDATA -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_AWUSER -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWREGION -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWQOS -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWPROT -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWBURST -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWLEN -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWID -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWADDR -into $wdata_group -radix hex
add_wave /apatb_dut_top/gmem_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/gmem_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(wire) -into $tbcinputgroup]
add_wave /apatb_dut_top/src_sz -into $tb_return_group -radix hex
set tb_src_buff__dst_buff_group [add_wave_group src_buff__dst_buff(axi_slave) -into $tbcinputgroup]
add_wave /apatb_dut_top/control_BRESP -into $tb_src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/control_BREADY -into $tb_src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_BVALID -into $tb_src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_RRESP -into $tb_src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/control_RDATA -into $tb_src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/control_RREADY -into $tb_src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_RVALID -into $tb_src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_ARREADY -into $tb_src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_ARVALID -into $tb_src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_ARADDR -into $tb_src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/control_WSTRB -into $tb_src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/control_WDATA -into $tb_src_buff__dst_buff_group -radix hex
add_wave /apatb_dut_top/control_WREADY -into $tb_src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_WVALID -into $tb_src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_AWREADY -into $tb_src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_AWVALID -into $tb_src_buff__dst_buff_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_AWADDR -into $tb_src_buff__dst_buff_group -radix hex
save_wave_config dut.wcfg
run all
quit

