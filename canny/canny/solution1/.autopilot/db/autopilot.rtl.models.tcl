set SynModuleInfo {
  {SRCNAME canny_Pipeline_read_img MODELNAME canny_Pipeline_read_img RTLNAME canny_canny_Pipeline_read_img
    SUBMODULES {
      {MODELNAME canny_flow_control_loop_pipe_sequential_init RTLNAME canny_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME canny_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME canny_Pipeline_idx_idy MODELNAME canny_Pipeline_idx_idy RTLNAME canny_canny_Pipeline_idx_idy
    SUBMODULES {
      {MODELNAME canny_mux_2544_32_1_1 RTLNAME canny_mux_2544_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME canny_mux_325_32_1_1 RTLNAME canny_mux_325_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME canny_mux_315_32_1_1 RTLNAME canny_mux_315_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME canny_mux_2511_32_1_1 RTLNAME canny_mux_2511_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME canny_sdiv_16ns_11s_10_20_1 RTLNAME canny_sdiv_16ns_11s_10_20_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 19 ALLOW_PRAGMA 1}
      {MODELNAME canny_mul_mul_17s_7s_17_4_1 RTLNAME canny_mul_mul_17s_7s_17_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME canny_mul_mul_17s_6ns_17_4_1 RTLNAME canny_mul_mul_17s_6ns_17_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME canny_mac_muladd_17s_7s_17ns_17_4_1 RTLNAME canny_mac_muladd_17s_7s_17ns_17_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME canny_mac_muladd_17s_6ns_17ns_17_4_1 RTLNAME canny_mac_muladd_17s_6ns_17ns_17_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME canny_mac_mul_sub_17s_6ns_17ns_17_4_1 RTLNAME canny_mac_mul_sub_17s_6ns_17ns_17_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME canny_ama_addmuladd_17s_17s_6ns_17ns_17_4_1 RTLNAME canny_ama_addmuladd_17s_17s_6ns_17ns_17_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME canny_mul_mul_11s_11s_22_4_1 RTLNAME canny_mul_mul_11s_11s_22_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME canny_mac_muladd_11s_11s_22s_22_4_1 RTLNAME canny_mac_muladd_11s_11s_22s_22_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME canny_Pipeline_rest_result MODELNAME canny_Pipeline_rest_result RTLNAME canny_canny_Pipeline_rest_result}
  {SRCNAME canny MODELNAME canny RTLNAME canny IS_TOP 1
    SUBMODULES {
      {MODELNAME canny_control_s_axi RTLNAME canny_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME canny_regslice_both RTLNAME canny_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME canny_regslice_both_U}
    }
  }
}
