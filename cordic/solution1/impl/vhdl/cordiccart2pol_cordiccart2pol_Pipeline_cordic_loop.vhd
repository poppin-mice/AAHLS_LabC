-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    select_ln1697 : IN STD_LOGIC_VECTOR (14 downto 0);
    select_ln1697_1 : IN STD_LOGIC_VECTOR (14 downto 0);
    x_cordic_V_1_out : OUT STD_LOGIC_VECTOR (14 downto 0);
    x_cordic_V_1_out_ap_vld : OUT STD_LOGIC;
    theta_out_V_out : OUT STD_LOGIC_VECTOR (14 downto 0);
    theta_out_V_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv15_0 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_B : STD_LOGIC_VECTOR (3 downto 0) := "1011";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln36_fu_124_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal angles_V_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal angles_V_ce0 : STD_LOGIC;
    signal angles_V_q0 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal i_1_reg_291 : STD_LOGIC_VECTOR (3 downto 0);
    signal icmp_ln36_reg_296 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_fu_167_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_305 : STD_LOGIC_VECTOR (0 downto 0);
    signal angles_V_load_reg_310 : STD_LOGIC_VECTOR (11 downto 0);
    signal x_cordic_V_3_fu_199_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal x_cordic_V_3_reg_315 : STD_LOGIC_VECTOR (14 downto 0);
    signal y_cordic_V_2_fu_207_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal y_cordic_V_2_reg_320 : STD_LOGIC_VECTOR (14 downto 0);
    signal trunc_ln1534_cast5_fu_136_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal theta_out_V_fu_46 : STD_LOGIC_VECTOR (14 downto 0);
    signal theta_out_V_3_fu_233_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal x_cordic_V_fu_50 : STD_LOGIC_VECTOR (14 downto 0);
    signal ap_sig_allocacmp_x_cordic_V_load_1 : STD_LOGIC_VECTOR (14 downto 0);
    signal p_Val2_s_fu_54 : STD_LOGIC_VECTOR (14 downto 0);
    signal ap_sig_allocacmp_p_Val2_load : STD_LOGIC_VECTOR (14 downto 0);
    signal i_fu_58 : STD_LOGIC_VECTOR (3 downto 0);
    signal add_ln36_fu_130_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_sig_allocacmp_i_1 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln1534_fu_152_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal r_V_fu_155_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal r_V_1_fu_161_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal x_cordic_V_2_fu_187_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal x_cordic_V_1_fu_175_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal y_cordic_V_1_fu_193_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal y_cordic_V_fu_181_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal zext_ln859_fu_218_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal theta_out_V_2_fu_227_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal theta_out_V_1_fu_221_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (3 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (11 downto 0) );
    end component;


    component cordiccart2pol_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    angles_V_U : component cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R
    generic map (
        DataWidth => 12,
        AddressRange => 11,
        AddressWidth => 4)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => angles_V_address0,
        ce0 => angles_V_ce0,
        q0 => angles_V_q0);

    flow_control_loop_pipe_sequential_init_U : component cordiccart2pol_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    i_fu_58_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln36_fu_124_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_fu_58 <= add_ln36_fu_130_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_58 <= ap_const_lv4_0;
                end if;
            end if; 
        end if;
    end process;

    p_Val2_s_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    p_Val2_s_fu_54 <= select_ln1697;
                elsif ((ap_enable_reg_pp0_iter2 = ap_const_logic_1)) then 
                    p_Val2_s_fu_54 <= y_cordic_V_2_reg_320;
                end if;
            end if; 
        end if;
    end process;

    theta_out_V_fu_46_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    theta_out_V_fu_46 <= ap_const_lv15_0;
                elsif ((ap_enable_reg_pp0_iter2 = ap_const_logic_1)) then 
                    theta_out_V_fu_46 <= theta_out_V_3_fu_233_p3;
                end if;
            end if; 
        end if;
    end process;

    x_cordic_V_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    x_cordic_V_fu_50 <= select_ln1697_1;
                elsif ((ap_enable_reg_pp0_iter2 = ap_const_logic_1)) then 
                    x_cordic_V_fu_50 <= x_cordic_V_3_reg_315;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                angles_V_load_reg_310 <= angles_V_q0;
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                i_1_reg_291 <= ap_sig_allocacmp_i_1;
                icmp_ln36_reg_296 <= icmp_ln36_fu_124_p2;
                tmp_reg_305 <= ap_sig_allocacmp_p_Val2_load(14 downto 14);
                x_cordic_V_3_reg_315 <= x_cordic_V_3_fu_199_p3;
                y_cordic_V_2_reg_320 <= y_cordic_V_2_fu_207_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln36_fu_130_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_1) + unsigned(ap_const_lv4_1));
    angles_V_address0 <= trunc_ln1534_cast5_fu_136_p1(4 - 1 downto 0);

    angles_V_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            angles_V_ce0 <= ap_const_logic_1;
        else 
            angles_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln36_fu_124_p2)
    begin
        if (((icmp_ln36_fu_124_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter1_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, i_fu_58)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_i_1 <= ap_const_lv4_0;
        else 
            ap_sig_allocacmp_i_1 <= i_fu_58;
        end if; 
    end process;


    ap_sig_allocacmp_p_Val2_load_assign_proc : process(ap_enable_reg_pp0_iter2, y_cordic_V_2_reg_320, ap_block_pp0_stage0, p_Val2_s_fu_54)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            ap_sig_allocacmp_p_Val2_load <= y_cordic_V_2_reg_320;
        else 
            ap_sig_allocacmp_p_Val2_load <= p_Val2_s_fu_54;
        end if; 
    end process;


    ap_sig_allocacmp_x_cordic_V_load_1_assign_proc : process(ap_enable_reg_pp0_iter2, x_cordic_V_3_reg_315, ap_block_pp0_stage0, x_cordic_V_fu_50)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            ap_sig_allocacmp_x_cordic_V_load_1 <= x_cordic_V_3_reg_315;
        else 
            ap_sig_allocacmp_x_cordic_V_load_1 <= x_cordic_V_fu_50;
        end if; 
    end process;

    icmp_ln36_fu_124_p2 <= "1" when (ap_sig_allocacmp_i_1 = ap_const_lv4_B) else "0";
    r_V_1_fu_161_p2 <= std_logic_vector(shift_right(signed(ap_sig_allocacmp_x_cordic_V_load_1),to_integer(unsigned('0' & zext_ln1534_fu_152_p1(15-1 downto 0)))));
    r_V_fu_155_p2 <= std_logic_vector(shift_right(signed(ap_sig_allocacmp_p_Val2_load),to_integer(unsigned('0' & zext_ln1534_fu_152_p1(15-1 downto 0)))));
    theta_out_V_1_fu_221_p2 <= std_logic_vector(unsigned(zext_ln859_fu_218_p1) + unsigned(theta_out_V_fu_46));
    theta_out_V_2_fu_227_p2 <= std_logic_vector(unsigned(theta_out_V_fu_46) - unsigned(zext_ln859_fu_218_p1));
    theta_out_V_3_fu_233_p3 <= 
        theta_out_V_2_fu_227_p2 when (tmp_reg_305(0) = '1') else 
        theta_out_V_1_fu_221_p2;
    theta_out_V_out <= theta_out_V_fu_46;

    theta_out_V_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, icmp_ln36_reg_296)
    begin
        if (((icmp_ln36_reg_296 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            theta_out_V_out_ap_vld <= ap_const_logic_1;
        else 
            theta_out_V_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    tmp_fu_167_p3 <= ap_sig_allocacmp_p_Val2_load(14 downto 14);
    trunc_ln1534_cast5_fu_136_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i_1),64));
    x_cordic_V_1_fu_175_p2 <= std_logic_vector(unsigned(r_V_fu_155_p2) + unsigned(ap_sig_allocacmp_x_cordic_V_load_1));
    x_cordic_V_1_out <= x_cordic_V_fu_50;

    x_cordic_V_1_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, icmp_ln36_reg_296)
    begin
        if (((icmp_ln36_reg_296 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            x_cordic_V_1_out_ap_vld <= ap_const_logic_1;
        else 
            x_cordic_V_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    x_cordic_V_2_fu_187_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_x_cordic_V_load_1) - unsigned(r_V_fu_155_p2));
    x_cordic_V_3_fu_199_p3 <= 
        x_cordic_V_2_fu_187_p2 when (tmp_fu_167_p3(0) = '1') else 
        x_cordic_V_1_fu_175_p2;
    y_cordic_V_1_fu_193_p2 <= std_logic_vector(unsigned(r_V_1_fu_161_p2) + unsigned(ap_sig_allocacmp_p_Val2_load));
    y_cordic_V_2_fu_207_p3 <= 
        y_cordic_V_1_fu_193_p2 when (tmp_fu_167_p3(0) = '1') else 
        y_cordic_V_fu_181_p2;
    y_cordic_V_fu_181_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_p_Val2_load) - unsigned(r_V_1_fu_161_p2));
    zext_ln1534_fu_152_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_1_reg_291),15));
    zext_ln859_fu_218_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(angles_V_load_reg_310),15));
end behav;
