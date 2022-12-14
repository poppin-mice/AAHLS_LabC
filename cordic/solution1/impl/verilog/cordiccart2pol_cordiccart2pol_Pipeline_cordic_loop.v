// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        select_ln1697,
        select_ln1697_1,
        x_cordic_V_1_out,
        x_cordic_V_1_out_ap_vld,
        theta_out_V_out,
        theta_out_V_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [14:0] select_ln1697;
input  [14:0] select_ln1697_1;
output  [14:0] x_cordic_V_1_out;
output   x_cordic_V_1_out_ap_vld;
output  [14:0] theta_out_V_out;
output   theta_out_V_out_ap_vld;

reg ap_idle;
reg x_cordic_V_1_out_ap_vld;
reg theta_out_V_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln36_fu_124_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [3:0] angles_V_address0;
reg    angles_V_ce0;
wire   [11:0] angles_V_q0;
wire    ap_block_pp0_stage0_11001;
reg   [3:0] i_1_reg_291;
reg   [0:0] icmp_ln36_reg_296;
wire   [0:0] tmp_fu_167_p3;
reg   [0:0] tmp_reg_305;
reg   [11:0] angles_V_load_reg_310;
wire   [14:0] x_cordic_V_3_fu_199_p3;
reg   [14:0] x_cordic_V_3_reg_315;
wire   [14:0] y_cordic_V_2_fu_207_p3;
reg   [14:0] y_cordic_V_2_reg_320;
wire   [63:0] trunc_ln1534_cast5_fu_136_p1;
wire    ap_block_pp0_stage0;
reg   [14:0] theta_out_V_fu_46;
wire   [14:0] theta_out_V_3_fu_233_p3;
wire    ap_loop_init;
reg   [14:0] x_cordic_V_fu_50;
reg   [14:0] ap_sig_allocacmp_x_cordic_V_load_1;
reg   [14:0] p_Val2_s_fu_54;
reg   [14:0] ap_sig_allocacmp_p_Val2_load;
reg   [3:0] i_fu_58;
wire   [3:0] add_ln36_fu_130_p2;
reg   [3:0] ap_sig_allocacmp_i_1;
wire    ap_block_pp0_stage0_01001;
wire   [14:0] zext_ln1534_fu_152_p1;
wire   [14:0] r_V_fu_155_p2;
wire   [14:0] r_V_1_fu_161_p2;
wire   [14:0] x_cordic_V_2_fu_187_p2;
wire   [14:0] x_cordic_V_1_fu_175_p2;
wire   [14:0] y_cordic_V_1_fu_193_p2;
wire   [14:0] y_cordic_V_fu_181_p2;
wire   [14:0] zext_ln859_fu_218_p1;
wire   [14:0] theta_out_V_2_fu_227_p2;
wire   [14:0] theta_out_V_1_fu_221_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop_angles_V_ROM_AUTO_1R #(
    .DataWidth( 12 ),
    .AddressRange( 11 ),
    .AddressWidth( 4 ))
angles_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(angles_V_address0),
    .ce0(angles_V_ce0),
    .q0(angles_V_q0)
);

cordiccart2pol_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln36_fu_124_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_58 <= add_ln36_fu_130_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_58 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            p_Val2_s_fu_54 <= select_ln1697;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            p_Val2_s_fu_54 <= y_cordic_V_2_reg_320;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            theta_out_V_fu_46 <= 15'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            theta_out_V_fu_46 <= theta_out_V_3_fu_233_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            x_cordic_V_fu_50 <= select_ln1697_1;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            x_cordic_V_fu_50 <= x_cordic_V_3_reg_315;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        angles_V_load_reg_310 <= angles_V_q0;
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        i_1_reg_291 <= ap_sig_allocacmp_i_1;
        icmp_ln36_reg_296 <= icmp_ln36_fu_124_p2;
        tmp_reg_305 <= ap_sig_allocacmp_p_Val2_load[32'd14];
        x_cordic_V_3_reg_315 <= x_cordic_V_3_fu_199_p3;
        y_cordic_V_2_reg_320 <= y_cordic_V_2_fu_207_p3;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        angles_V_ce0 = 1'b1;
    end else begin
        angles_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln36_fu_124_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_1 = 4'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_58;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_sig_allocacmp_p_Val2_load = y_cordic_V_2_reg_320;
    end else begin
        ap_sig_allocacmp_p_Val2_load = p_Val2_s_fu_54;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_sig_allocacmp_x_cordic_V_load_1 = x_cordic_V_3_reg_315;
    end else begin
        ap_sig_allocacmp_x_cordic_V_load_1 = x_cordic_V_fu_50;
    end
end

always @ (*) begin
    if (((icmp_ln36_reg_296 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        theta_out_V_out_ap_vld = 1'b1;
    end else begin
        theta_out_V_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln36_reg_296 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        x_cordic_V_1_out_ap_vld = 1'b1;
    end else begin
        x_cordic_V_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln36_fu_130_p2 = (ap_sig_allocacmp_i_1 + 4'd1);

assign angles_V_address0 = trunc_ln1534_cast5_fu_136_p1;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln36_fu_124_p2 = ((ap_sig_allocacmp_i_1 == 4'd11) ? 1'b1 : 1'b0);

assign r_V_1_fu_161_p2 = $signed(ap_sig_allocacmp_x_cordic_V_load_1) >>> zext_ln1534_fu_152_p1;

assign r_V_fu_155_p2 = $signed(ap_sig_allocacmp_p_Val2_load) >>> zext_ln1534_fu_152_p1;

assign theta_out_V_1_fu_221_p2 = (zext_ln859_fu_218_p1 + theta_out_V_fu_46);

assign theta_out_V_2_fu_227_p2 = (theta_out_V_fu_46 - zext_ln859_fu_218_p1);

assign theta_out_V_3_fu_233_p3 = ((tmp_reg_305[0:0] == 1'b1) ? theta_out_V_2_fu_227_p2 : theta_out_V_1_fu_221_p2);

assign theta_out_V_out = theta_out_V_fu_46;

assign tmp_fu_167_p3 = ap_sig_allocacmp_p_Val2_load[32'd14];

assign trunc_ln1534_cast5_fu_136_p1 = ap_sig_allocacmp_i_1;

assign x_cordic_V_1_fu_175_p2 = (r_V_fu_155_p2 + ap_sig_allocacmp_x_cordic_V_load_1);

assign x_cordic_V_1_out = x_cordic_V_fu_50;

assign x_cordic_V_2_fu_187_p2 = (ap_sig_allocacmp_x_cordic_V_load_1 - r_V_fu_155_p2);

assign x_cordic_V_3_fu_199_p3 = ((tmp_fu_167_p3[0:0] == 1'b1) ? x_cordic_V_2_fu_187_p2 : x_cordic_V_1_fu_175_p2);

assign y_cordic_V_1_fu_193_p2 = (r_V_1_fu_161_p2 + ap_sig_allocacmp_p_Val2_load);

assign y_cordic_V_2_fu_207_p3 = ((tmp_fu_167_p3[0:0] == 1'b1) ? y_cordic_V_1_fu_193_p2 : y_cordic_V_fu_181_p2);

assign y_cordic_V_fu_181_p2 = (ap_sig_allocacmp_p_Val2_load - r_V_1_fu_161_p2);

assign zext_ln1534_fu_152_p1 = i_1_reg_291;

assign zext_ln859_fu_218_p1 = angles_V_load_reg_310;

endmodule //cordiccart2pol_cordiccart2pol_Pipeline_cordic_loop
