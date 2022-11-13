set SynModuleInfo {
  {SRCNAME cordiccart2pol_Pipeline_cordic_loop MODELNAME cordiccart2pol_Pipeline_cordic_loop RTLNAME cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop
    SUBMODULES {
      {MODELNAME cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R RTLNAME cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cordiccart2pol_flow_control_loop_pipe_sequential_init RTLNAME cordiccart2pol_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME cordiccart2pol_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME cordiccart2pol MODELNAME cordiccart2pol RTLNAME cordiccart2pol IS_TOP 1}
}
