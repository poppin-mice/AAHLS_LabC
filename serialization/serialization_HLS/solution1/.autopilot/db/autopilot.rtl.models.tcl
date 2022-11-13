set SynModuleInfo {
  {SRCNAME dut_Pipeline_VITIS_LOOP_40_2 MODELNAME dut_Pipeline_VITIS_LOOP_40_2 RTLNAME dut_dut_Pipeline_VITIS_LOOP_40_2
    SUBMODULES {
      {MODELNAME dut_flow_control_loop_pipe_sequential_init RTLNAME dut_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME dut_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME dut_Pipeline_VITIS_LOOP_63_3_VITIS_LOOP_64_4 MODELNAME dut_Pipeline_VITIS_LOOP_63_3_VITIS_LOOP_64_4 RTLNAME dut_dut_Pipeline_VITIS_LOOP_63_3_VITIS_LOOP_64_4}
  {SRCNAME dut_Pipeline_VITIS_LOOP_88_5_VITIS_LOOP_89_6 MODELNAME dut_Pipeline_VITIS_LOOP_88_5_VITIS_LOOP_89_6 RTLNAME dut_dut_Pipeline_VITIS_LOOP_88_5_VITIS_LOOP_89_6}
  {SRCNAME dut_Pipeline_VITIS_LOOP_112_7_VITIS_LOOP_113_8 MODELNAME dut_Pipeline_VITIS_LOOP_112_7_VITIS_LOOP_113_8 RTLNAME dut_dut_Pipeline_VITIS_LOOP_112_7_VITIS_LOOP_113_8}
  {SRCNAME dut_Pipeline_VITIS_LOOP_132_9_VITIS_LOOP_133_10 MODELNAME dut_Pipeline_VITIS_LOOP_132_9_VITIS_LOOP_133_10 RTLNAME dut_dut_Pipeline_VITIS_LOOP_132_9_VITIS_LOOP_133_10}
  {SRCNAME dut_Pipeline_VITIS_LOOP_153_11_VITIS_LOOP_154_12 MODELNAME dut_Pipeline_VITIS_LOOP_153_11_VITIS_LOOP_154_12 RTLNAME dut_dut_Pipeline_VITIS_LOOP_153_11_VITIS_LOOP_154_12}
  {SRCNAME dut_Pipeline_VITIS_LOOP_164_13 MODELNAME dut_Pipeline_VITIS_LOOP_164_13 RTLNAME dut_dut_Pipeline_VITIS_LOOP_164_13}
  {SRCNAME dut_Pipeline_VITIS_LOOP_177_14 MODELNAME dut_Pipeline_VITIS_LOOP_177_14 RTLNAME dut_dut_Pipeline_VITIS_LOOP_177_14}
  {SRCNAME dut_Pipeline_VITIS_LOOP_192_15_VITIS_LOOP_193_16 MODELNAME dut_Pipeline_VITIS_LOOP_192_15_VITIS_LOOP_193_16 RTLNAME dut_dut_Pipeline_VITIS_LOOP_192_15_VITIS_LOOP_193_16}
  {SRCNAME dut_Pipeline_VITIS_LOOP_204_17 MODELNAME dut_Pipeline_VITIS_LOOP_204_17 RTLNAME dut_dut_Pipeline_VITIS_LOOP_204_17}
  {SRCNAME dut_Pipeline_VITIS_LOOP_231_20 MODELNAME dut_Pipeline_VITIS_LOOP_231_20 RTLNAME dut_dut_Pipeline_VITIS_LOOP_231_20}
  {SRCNAME dut MODELNAME dut RTLNAME dut IS_TOP 1
    SUBMODULES {
      {MODELNAME dut_mul_32s_5ns_32_2_1 RTLNAME dut_mul_32s_5ns_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME dut_var_string_length_RAM_AUTO_1R1W RTLNAME dut_var_string_length_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dut_gmem_m_axi RTLNAME dut_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME dut_control_s_axi RTLNAME dut_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
