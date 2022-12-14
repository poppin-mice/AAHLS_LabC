-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dut_dut_Pipeline_VITIS_LOOP_153_11_VITIS_LOOP_154_12 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_gmem_AWVALID : OUT STD_LOGIC;
    m_axi_gmem_AWREADY : IN STD_LOGIC;
    m_axi_gmem_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_WVALID : OUT STD_LOGIC;
    m_axi_gmem_WREADY : IN STD_LOGIC;
    m_axi_gmem_WDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem_WSTRB : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_WLAST : OUT STD_LOGIC;
    m_axi_gmem_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_ARVALID : OUT STD_LOGIC;
    m_axi_gmem_ARREADY : IN STD_LOGIC;
    m_axi_gmem_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_RVALID : IN STD_LOGIC;
    m_axi_gmem_RREADY : OUT STD_LOGIC;
    m_axi_gmem_RDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem_RLAST : IN STD_LOGIC;
    m_axi_gmem_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_RFIFONUM : IN STD_LOGIC_VECTOR (10 downto 0);
    m_axi_gmem_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_BVALID : IN STD_LOGIC;
    m_axi_gmem_BREADY : OUT STD_LOGIC;
    m_axi_gmem_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    dst_counter_12 : IN STD_LOGIC_VECTOR (31 downto 0);
    dst_buff : IN STD_LOGIC_VECTOR (63 downto 0);
    dst_counter_15_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    dst_counter_15_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of dut_dut_Pipeline_VITIS_LOOP_153_11_VITIS_LOOP_154_12 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv12_FA4 : STD_LOGIC_VECTOR (11 downto 0) := "111110100100";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv3_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv10_3E8 : STD_LOGIC_VECTOR (9 downto 0) := "1111101000";
    constant ap_const_lv3_3 : STD_LOGIC_VECTOR (2 downto 0) := "011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter6 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter7 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter8 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6 : BOOLEAN;
    signal ap_block_state8_pp0_stage0_iter7 : BOOLEAN;
    signal ap_block_state9_pp0_stage0_iter8 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln153_fu_165_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal gmem_blk_n_AW : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal gmem_blk_n_W : STD_LOGIC;
    signal gmem_blk_n_B : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln153_reg_401 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln153_reg_401_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln153_reg_401_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln153_reg_401_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln153_reg_401_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln153_reg_401_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln153_reg_401_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln154_fu_180_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln154_reg_405 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln153_fu_186_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal select_ln153_reg_411 : STD_LOGIC_VECTOR (2 downto 0);
    signal trunc_ln155_fu_194_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln155_reg_417 : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln155_1_fu_275_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln155_1_reg_422 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln155_1_reg_422_pp0_iter2_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal gmem_addr_reg_427 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln155_1_fu_289_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal j_fu_82 : STD_LOGIC_VECTOR (2 downto 0);
    signal j_8_fu_198_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_j_load : STD_LOGIC_VECTOR (2 downto 0);
    signal position_1_fu_86 : STD_LOGIC_VECTOR (31 downto 0);
    signal position_fu_325_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_counter_fu_90 : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_counter_11_fu_333_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_94 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln153_2_fu_248_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal indvar_flatten119_fu_98 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln153_fu_171_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_sig_allocacmp_indvar_flatten119_load : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln153_1_fu_223_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal cmp241_mid1_fu_229_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp241135_fu_235_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal shl_ln_fu_258_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal zext_ln155_1_fu_265_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal lshr_ln155_fu_269_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal j_10_cast10_fu_255_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln155_fu_279_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln155_fu_285_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln153_1_fu_241_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln159_fu_311_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln156_fu_300_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal position_5_fu_317_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_counter_10_fu_305_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter5_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter6_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter7_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component dut_flow_control_loop_pipe_sequential_init IS
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
    flow_control_loop_pipe_sequential_init_U : component dut_flow_control_loop_pipe_sequential_init
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
                elsif (((ap_loop_exit_ready_pp0_iter7_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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
                elsif (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter6_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter6 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter7_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter7 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter8_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter8 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
                end if; 
            end if;
        end if;
    end process;


    dst_counter_fu_90_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    dst_counter_fu_90 <= dst_counter_12;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    dst_counter_fu_90 <= dst_counter_11_fu_333_p3;
                end if;
            end if; 
        end if;
    end process;

    i_fu_94_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_94 <= ap_const_lv10_0;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    i_fu_94 <= select_ln153_2_fu_248_p3;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten119_fu_98_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln153_fu_165_p2 = ap_const_lv1_0))) then 
                    indvar_flatten119_fu_98 <= add_ln153_fu_171_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten119_fu_98 <= ap_const_lv12_0;
                end if;
            end if; 
        end if;
    end process;

    j_fu_82_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln153_fu_165_p2 = ap_const_lv1_0))) then 
                    j_fu_82 <= j_8_fu_198_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_82 <= ap_const_lv3_0;
                end if;
            end if; 
        end if;
    end process;

    position_1_fu_86_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    position_1_fu_86 <= ap_const_lv32_0;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    position_1_fu_86 <= position_fu_325_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                gmem_addr_reg_427 <= add_ln155_1_fu_289_p2;
                icmp_ln153_reg_401 <= icmp_ln153_fu_165_p2;
                icmp_ln153_reg_401_pp0_iter1_reg <= icmp_ln153_reg_401;
                trunc_ln155_1_reg_422 <= trunc_ln155_1_fu_275_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
                ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
                ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
                icmp_ln153_reg_401_pp0_iter2_reg <= icmp_ln153_reg_401_pp0_iter1_reg;
                icmp_ln153_reg_401_pp0_iter3_reg <= icmp_ln153_reg_401_pp0_iter2_reg;
                icmp_ln153_reg_401_pp0_iter4_reg <= icmp_ln153_reg_401_pp0_iter3_reg;
                icmp_ln153_reg_401_pp0_iter5_reg <= icmp_ln153_reg_401_pp0_iter4_reg;
                icmp_ln153_reg_401_pp0_iter6_reg <= icmp_ln153_reg_401_pp0_iter5_reg;
                trunc_ln155_1_reg_422_pp0_iter2_reg <= trunc_ln155_1_reg_422;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln153_fu_165_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln154_reg_405 <= icmp_ln154_fu_180_p2;
                select_ln153_reg_411 <= select_ln153_fu_186_p3;
                trunc_ln155_reg_417 <= trunc_ln155_fu_194_p1;
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
    add_ln153_1_fu_223_p2 <= std_logic_vector(unsigned(i_fu_94) + unsigned(ap_const_lv10_1));
    add_ln153_fu_171_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_indvar_flatten119_load) + unsigned(ap_const_lv12_1));
    add_ln155_1_fu_289_p2 <= std_logic_vector(unsigned(zext_ln155_fu_285_p1) + unsigned(dst_buff));
    add_ln155_fu_279_p2 <= std_logic_vector(unsigned(j_10_cast10_fu_255_p1) + unsigned(dst_counter_fu_90));
    add_ln159_fu_311_p2 <= std_logic_vector(unsigned(position_1_fu_86) + unsigned(ap_const_lv32_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter8, m_axi_gmem_BVALID)
    begin
                ap_block_pp0_stage0_01001 <= ((m_axi_gmem_BVALID = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter8, m_axi_gmem_AWREADY, m_axi_gmem_WREADY, m_axi_gmem_BVALID)
    begin
                ap_block_pp0_stage0_11001 <= (((m_axi_gmem_BVALID = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1)) or ((m_axi_gmem_WREADY = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((m_axi_gmem_AWREADY = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter8, m_axi_gmem_AWREADY, m_axi_gmem_WREADY, m_axi_gmem_BVALID)
    begin
                ap_block_pp0_stage0_subdone <= (((m_axi_gmem_BVALID = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1)) or ((m_axi_gmem_WREADY = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((m_axi_gmem_AWREADY = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter5 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage0_iter7 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state9_pp0_stage0_iter8_assign_proc : process(m_axi_gmem_BVALID)
    begin
                ap_block_state9_pp0_stage0_iter8 <= (m_axi_gmem_BVALID = ap_const_logic_0);
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln153_fu_165_p2)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln153_fu_165_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter7_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter7_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7, ap_enable_reg_pp0_iter8)
    begin
        if (((ap_enable_reg_pp0_iter8 = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_indvar_flatten119_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, indvar_flatten119_fu_98)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_sig_allocacmp_indvar_flatten119_load <= ap_const_lv12_0;
        else 
            ap_sig_allocacmp_indvar_flatten119_load <= indvar_flatten119_fu_98;
        end if; 
    end process;


    ap_sig_allocacmp_j_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, j_fu_82, ap_loop_init)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_sig_allocacmp_j_load <= ap_const_lv3_0;
        else 
            ap_sig_allocacmp_j_load <= j_fu_82;
        end if; 
    end process;

    cmp241135_fu_235_p2 <= "1" when (unsigned(i_fu_94) < unsigned(ap_const_lv10_3E8)) else "0";
    cmp241_mid1_fu_229_p2 <= "1" when (unsigned(add_ln153_1_fu_223_p2) < unsigned(ap_const_lv10_3E8)) else "0";
    dst_counter_10_fu_305_p2 <= std_logic_vector(unsigned(dst_counter_fu_90) + unsigned(ap_const_lv32_4));
    dst_counter_11_fu_333_p3 <= 
        dst_counter_10_fu_305_p2 when (icmp_ln156_fu_300_p2(0) = '1') else 
        dst_counter_fu_90;
    dst_counter_15_out <= dst_counter_fu_90;

    dst_counter_15_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln153_reg_401_pp0_iter6_reg)
    begin
        if (((icmp_ln153_reg_401_pp0_iter6_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            dst_counter_15_out_ap_vld <= ap_const_logic_1;
        else 
            dst_counter_15_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    gmem_blk_n_AW_assign_proc : process(ap_enable_reg_pp0_iter2, m_axi_gmem_AWREADY, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            gmem_blk_n_AW <= m_axi_gmem_AWREADY;
        else 
            gmem_blk_n_AW <= ap_const_logic_1;
        end if; 
    end process;


    gmem_blk_n_B_assign_proc : process(ap_enable_reg_pp0_iter8, m_axi_gmem_BVALID, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            gmem_blk_n_B <= m_axi_gmem_BVALID;
        else 
            gmem_blk_n_B <= ap_const_logic_1;
        end if; 
    end process;


    gmem_blk_n_W_assign_proc : process(ap_enable_reg_pp0_iter3, m_axi_gmem_WREADY, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            gmem_blk_n_W <= m_axi_gmem_WREADY;
        else 
            gmem_blk_n_W <= ap_const_logic_1;
        end if; 
    end process;

    icmp_ln153_fu_165_p2 <= "1" when (ap_sig_allocacmp_indvar_flatten119_load = ap_const_lv12_FA4) else "0";
    icmp_ln154_fu_180_p2 <= "1" when (ap_sig_allocacmp_j_load = ap_const_lv3_4) else "0";
    icmp_ln156_fu_300_p2 <= "1" when (select_ln153_reg_411 = ap_const_lv3_3) else "0";
    j_10_cast10_fu_255_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln153_reg_411),32));
    j_8_fu_198_p2 <= std_logic_vector(unsigned(select_ln153_fu_186_p3) + unsigned(ap_const_lv3_1));
    lshr_ln155_fu_269_p2 <= std_logic_vector(shift_right(unsigned(position_1_fu_86),to_integer(unsigned('0' & zext_ln155_1_fu_265_p1(31-1 downto 0)))));
    m_axi_gmem_ARADDR <= ap_const_lv64_0;
    m_axi_gmem_ARBURST <= ap_const_lv2_0;
    m_axi_gmem_ARCACHE <= ap_const_lv4_0;
    m_axi_gmem_ARID <= ap_const_lv1_0;
    m_axi_gmem_ARLEN <= ap_const_lv32_0;
    m_axi_gmem_ARLOCK <= ap_const_lv2_0;
    m_axi_gmem_ARPROT <= ap_const_lv3_0;
    m_axi_gmem_ARQOS <= ap_const_lv4_0;
    m_axi_gmem_ARREGION <= ap_const_lv4_0;
    m_axi_gmem_ARSIZE <= ap_const_lv3_0;
    m_axi_gmem_ARUSER <= ap_const_lv1_0;
    m_axi_gmem_ARVALID <= ap_const_logic_0;
    m_axi_gmem_AWADDR <= gmem_addr_reg_427;
    m_axi_gmem_AWBURST <= ap_const_lv2_0;
    m_axi_gmem_AWCACHE <= ap_const_lv4_0;
    m_axi_gmem_AWID <= ap_const_lv1_0;
    m_axi_gmem_AWLEN <= ap_const_lv32_1;
    m_axi_gmem_AWLOCK <= ap_const_lv2_0;
    m_axi_gmem_AWPROT <= ap_const_lv3_0;
    m_axi_gmem_AWQOS <= ap_const_lv4_0;
    m_axi_gmem_AWREGION <= ap_const_lv4_0;
    m_axi_gmem_AWSIZE <= ap_const_lv3_0;
    m_axi_gmem_AWUSER <= ap_const_lv1_0;

    m_axi_gmem_AWVALID_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            m_axi_gmem_AWVALID <= ap_const_logic_1;
        else 
            m_axi_gmem_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_gmem_BREADY_assign_proc : process(ap_enable_reg_pp0_iter8, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            m_axi_gmem_BREADY <= ap_const_logic_1;
        else 
            m_axi_gmem_BREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem_RREADY <= ap_const_logic_0;
    m_axi_gmem_WDATA <= trunc_ln155_1_reg_422_pp0_iter2_reg;
    m_axi_gmem_WID <= ap_const_lv1_0;
    m_axi_gmem_WLAST <= ap_const_logic_0;
    m_axi_gmem_WSTRB <= ap_const_lv1_1;
    m_axi_gmem_WUSER <= ap_const_lv1_0;

    m_axi_gmem_WVALID_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            m_axi_gmem_WVALID <= ap_const_logic_1;
        else 
            m_axi_gmem_WVALID <= ap_const_logic_0;
        end if; 
    end process;

    position_5_fu_317_p3 <= 
        add_ln159_fu_311_p2 when (select_ln153_1_fu_241_p3(0) = '1') else 
        position_1_fu_86;
    position_fu_325_p3 <= 
        position_5_fu_317_p3 when (icmp_ln156_fu_300_p2(0) = '1') else 
        position_1_fu_86;
    select_ln153_1_fu_241_p3 <= 
        cmp241_mid1_fu_229_p2 when (icmp_ln154_reg_405(0) = '1') else 
        cmp241135_fu_235_p2;
    select_ln153_2_fu_248_p3 <= 
        add_ln153_1_fu_223_p2 when (icmp_ln154_reg_405(0) = '1') else 
        i_fu_94;
    select_ln153_fu_186_p3 <= 
        ap_const_lv3_0 when (icmp_ln154_fu_180_p2(0) = '1') else 
        ap_sig_allocacmp_j_load;
    shl_ln_fu_258_p3 <= (trunc_ln155_reg_417 & ap_const_lv3_0);
    trunc_ln155_1_fu_275_p1 <= lshr_ln155_fu_269_p2(8 - 1 downto 0);
    trunc_ln155_fu_194_p1 <= select_ln153_fu_186_p3(2 - 1 downto 0);
    zext_ln155_1_fu_265_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln_fu_258_p3),32));
    zext_ln155_fu_285_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln155_fu_279_p2),64));
end behav;
