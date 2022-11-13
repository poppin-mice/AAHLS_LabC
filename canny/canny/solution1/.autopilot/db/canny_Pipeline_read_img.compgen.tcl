# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 1 \
    name src \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { src_TVALID { I 1 bit } src_TDATA { I 32 vector } src_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'src'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name img_buffer_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_out \
    op interface \
    ports { img_buffer_out { O 32 vector } img_buffer_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name img_buffer_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_1_out \
    op interface \
    ports { img_buffer_1_out { O 32 vector } img_buffer_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name img_buffer_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_2_out \
    op interface \
    ports { img_buffer_2_out { O 32 vector } img_buffer_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name img_buffer_3_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_3_out \
    op interface \
    ports { img_buffer_3_out { O 32 vector } img_buffer_3_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name img_buffer_4_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_4_out \
    op interface \
    ports { img_buffer_4_out { O 32 vector } img_buffer_4_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name img_buffer_5_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_5_out \
    op interface \
    ports { img_buffer_5_out { O 32 vector } img_buffer_5_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name img_buffer_6_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_6_out \
    op interface \
    ports { img_buffer_6_out { O 32 vector } img_buffer_6_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name img_buffer_7_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_7_out \
    op interface \
    ports { img_buffer_7_out { O 32 vector } img_buffer_7_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name img_buffer_8_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_8_out \
    op interface \
    ports { img_buffer_8_out { O 32 vector } img_buffer_8_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name img_buffer_9_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_9_out \
    op interface \
    ports { img_buffer_9_out { O 32 vector } img_buffer_9_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name img_buffer_10_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_10_out \
    op interface \
    ports { img_buffer_10_out { O 32 vector } img_buffer_10_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name img_buffer_11_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_11_out \
    op interface \
    ports { img_buffer_11_out { O 32 vector } img_buffer_11_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name img_buffer_12_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_12_out \
    op interface \
    ports { img_buffer_12_out { O 32 vector } img_buffer_12_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name img_buffer_13_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_13_out \
    op interface \
    ports { img_buffer_13_out { O 32 vector } img_buffer_13_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name img_buffer_14_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_14_out \
    op interface \
    ports { img_buffer_14_out { O 32 vector } img_buffer_14_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name img_buffer_15_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_15_out \
    op interface \
    ports { img_buffer_15_out { O 32 vector } img_buffer_15_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name img_buffer_16_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_16_out \
    op interface \
    ports { img_buffer_16_out { O 32 vector } img_buffer_16_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name img_buffer_17_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_17_out \
    op interface \
    ports { img_buffer_17_out { O 32 vector } img_buffer_17_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name img_buffer_18_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_18_out \
    op interface \
    ports { img_buffer_18_out { O 32 vector } img_buffer_18_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name img_buffer_19_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_19_out \
    op interface \
    ports { img_buffer_19_out { O 32 vector } img_buffer_19_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name img_buffer_20_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_20_out \
    op interface \
    ports { img_buffer_20_out { O 32 vector } img_buffer_20_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name img_buffer_21_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_21_out \
    op interface \
    ports { img_buffer_21_out { O 32 vector } img_buffer_21_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name img_buffer_22_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_22_out \
    op interface \
    ports { img_buffer_22_out { O 32 vector } img_buffer_22_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name img_buffer_23_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_23_out \
    op interface \
    ports { img_buffer_23_out { O 32 vector } img_buffer_23_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name img_buffer_24_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_24_out \
    op interface \
    ports { img_buffer_24_out { O 32 vector } img_buffer_24_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name img_buffer_25_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_25_out \
    op interface \
    ports { img_buffer_25_out { O 32 vector } img_buffer_25_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name img_buffer_26_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_26_out \
    op interface \
    ports { img_buffer_26_out { O 32 vector } img_buffer_26_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name img_buffer_27_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_27_out \
    op interface \
    ports { img_buffer_27_out { O 32 vector } img_buffer_27_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name img_buffer_28_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_28_out \
    op interface \
    ports { img_buffer_28_out { O 32 vector } img_buffer_28_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name img_buffer_29_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_29_out \
    op interface \
    ports { img_buffer_29_out { O 32 vector } img_buffer_29_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name img_buffer_30_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_30_out \
    op interface \
    ports { img_buffer_30_out { O 32 vector } img_buffer_30_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name img_buffer_31_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_31_out \
    op interface \
    ports { img_buffer_31_out { O 32 vector } img_buffer_31_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name img_buffer_32_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_32_out \
    op interface \
    ports { img_buffer_32_out { O 32 vector } img_buffer_32_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name img_buffer_33_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_33_out \
    op interface \
    ports { img_buffer_33_out { O 32 vector } img_buffer_33_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name img_buffer_34_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_34_out \
    op interface \
    ports { img_buffer_34_out { O 32 vector } img_buffer_34_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name img_buffer_35_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_35_out \
    op interface \
    ports { img_buffer_35_out { O 32 vector } img_buffer_35_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name img_buffer_36_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_36_out \
    op interface \
    ports { img_buffer_36_out { O 32 vector } img_buffer_36_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name img_buffer_37_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_37_out \
    op interface \
    ports { img_buffer_37_out { O 32 vector } img_buffer_37_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name img_buffer_38_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_38_out \
    op interface \
    ports { img_buffer_38_out { O 32 vector } img_buffer_38_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name img_buffer_39_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_39_out \
    op interface \
    ports { img_buffer_39_out { O 32 vector } img_buffer_39_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name img_buffer_40_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_40_out \
    op interface \
    ports { img_buffer_40_out { O 32 vector } img_buffer_40_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name img_buffer_41_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_41_out \
    op interface \
    ports { img_buffer_41_out { O 32 vector } img_buffer_41_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name img_buffer_42_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_42_out \
    op interface \
    ports { img_buffer_42_out { O 32 vector } img_buffer_42_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name img_buffer_43_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_43_out \
    op interface \
    ports { img_buffer_43_out { O 32 vector } img_buffer_43_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name img_buffer_44_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_44_out \
    op interface \
    ports { img_buffer_44_out { O 32 vector } img_buffer_44_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 47 \
    name img_buffer_45_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_45_out \
    op interface \
    ports { img_buffer_45_out { O 32 vector } img_buffer_45_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 48 \
    name img_buffer_46_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_46_out \
    op interface \
    ports { img_buffer_46_out { O 32 vector } img_buffer_46_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 49 \
    name img_buffer_47_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_47_out \
    op interface \
    ports { img_buffer_47_out { O 32 vector } img_buffer_47_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 50 \
    name img_buffer_48_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_48_out \
    op interface \
    ports { img_buffer_48_out { O 32 vector } img_buffer_48_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 51 \
    name img_buffer_49_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_49_out \
    op interface \
    ports { img_buffer_49_out { O 32 vector } img_buffer_49_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 52 \
    name img_buffer_50_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_50_out \
    op interface \
    ports { img_buffer_50_out { O 32 vector } img_buffer_50_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name img_buffer_51_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_51_out \
    op interface \
    ports { img_buffer_51_out { O 32 vector } img_buffer_51_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name img_buffer_52_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_52_out \
    op interface \
    ports { img_buffer_52_out { O 32 vector } img_buffer_52_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name img_buffer_53_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_53_out \
    op interface \
    ports { img_buffer_53_out { O 32 vector } img_buffer_53_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name img_buffer_54_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_54_out \
    op interface \
    ports { img_buffer_54_out { O 32 vector } img_buffer_54_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name img_buffer_55_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_55_out \
    op interface \
    ports { img_buffer_55_out { O 32 vector } img_buffer_55_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name img_buffer_56_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_56_out \
    op interface \
    ports { img_buffer_56_out { O 32 vector } img_buffer_56_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name img_buffer_57_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_57_out \
    op interface \
    ports { img_buffer_57_out { O 32 vector } img_buffer_57_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name img_buffer_58_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_58_out \
    op interface \
    ports { img_buffer_58_out { O 32 vector } img_buffer_58_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name img_buffer_59_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_59_out \
    op interface \
    ports { img_buffer_59_out { O 32 vector } img_buffer_59_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name img_buffer_60_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_60_out \
    op interface \
    ports { img_buffer_60_out { O 32 vector } img_buffer_60_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name img_buffer_61_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_61_out \
    op interface \
    ports { img_buffer_61_out { O 32 vector } img_buffer_61_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name img_buffer_62_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_62_out \
    op interface \
    ports { img_buffer_62_out { O 32 vector } img_buffer_62_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
    name img_buffer_63_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_63_out \
    op interface \
    ports { img_buffer_63_out { O 32 vector } img_buffer_63_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 66 \
    name img_buffer_64_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_64_out \
    op interface \
    ports { img_buffer_64_out { O 32 vector } img_buffer_64_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 67 \
    name img_buffer_65_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_65_out \
    op interface \
    ports { img_buffer_65_out { O 32 vector } img_buffer_65_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name img_buffer_66_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_66_out \
    op interface \
    ports { img_buffer_66_out { O 32 vector } img_buffer_66_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name img_buffer_67_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_67_out \
    op interface \
    ports { img_buffer_67_out { O 32 vector } img_buffer_67_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name img_buffer_68_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_68_out \
    op interface \
    ports { img_buffer_68_out { O 32 vector } img_buffer_68_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name img_buffer_69_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_69_out \
    op interface \
    ports { img_buffer_69_out { O 32 vector } img_buffer_69_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name img_buffer_70_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_70_out \
    op interface \
    ports { img_buffer_70_out { O 32 vector } img_buffer_70_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 73 \
    name img_buffer_71_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_71_out \
    op interface \
    ports { img_buffer_71_out { O 32 vector } img_buffer_71_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 74 \
    name img_buffer_72_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_72_out \
    op interface \
    ports { img_buffer_72_out { O 32 vector } img_buffer_72_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 75 \
    name img_buffer_73_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_73_out \
    op interface \
    ports { img_buffer_73_out { O 32 vector } img_buffer_73_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 76 \
    name img_buffer_74_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_74_out \
    op interface \
    ports { img_buffer_74_out { O 32 vector } img_buffer_74_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 77 \
    name img_buffer_75_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_75_out \
    op interface \
    ports { img_buffer_75_out { O 32 vector } img_buffer_75_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 78 \
    name img_buffer_76_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_76_out \
    op interface \
    ports { img_buffer_76_out { O 32 vector } img_buffer_76_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 79 \
    name img_buffer_77_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_77_out \
    op interface \
    ports { img_buffer_77_out { O 32 vector } img_buffer_77_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name img_buffer_78_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_78_out \
    op interface \
    ports { img_buffer_78_out { O 32 vector } img_buffer_78_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name img_buffer_79_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_79_out \
    op interface \
    ports { img_buffer_79_out { O 32 vector } img_buffer_79_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name img_buffer_80_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_80_out \
    op interface \
    ports { img_buffer_80_out { O 32 vector } img_buffer_80_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 83 \
    name img_buffer_81_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_81_out \
    op interface \
    ports { img_buffer_81_out { O 32 vector } img_buffer_81_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name img_buffer_82_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_82_out \
    op interface \
    ports { img_buffer_82_out { O 32 vector } img_buffer_82_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 85 \
    name img_buffer_83_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_83_out \
    op interface \
    ports { img_buffer_83_out { O 32 vector } img_buffer_83_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 86 \
    name img_buffer_84_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_84_out \
    op interface \
    ports { img_buffer_84_out { O 32 vector } img_buffer_84_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 87 \
    name img_buffer_85_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_85_out \
    op interface \
    ports { img_buffer_85_out { O 32 vector } img_buffer_85_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 88 \
    name img_buffer_86_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_86_out \
    op interface \
    ports { img_buffer_86_out { O 32 vector } img_buffer_86_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 89 \
    name img_buffer_87_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_87_out \
    op interface \
    ports { img_buffer_87_out { O 32 vector } img_buffer_87_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 90 \
    name img_buffer_88_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_88_out \
    op interface \
    ports { img_buffer_88_out { O 32 vector } img_buffer_88_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 91 \
    name img_buffer_89_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_89_out \
    op interface \
    ports { img_buffer_89_out { O 32 vector } img_buffer_89_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 92 \
    name img_buffer_90_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_90_out \
    op interface \
    ports { img_buffer_90_out { O 32 vector } img_buffer_90_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 93 \
    name img_buffer_91_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_91_out \
    op interface \
    ports { img_buffer_91_out { O 32 vector } img_buffer_91_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name img_buffer_92_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_92_out \
    op interface \
    ports { img_buffer_92_out { O 32 vector } img_buffer_92_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 95 \
    name img_buffer_93_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_93_out \
    op interface \
    ports { img_buffer_93_out { O 32 vector } img_buffer_93_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 96 \
    name img_buffer_94_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_94_out \
    op interface \
    ports { img_buffer_94_out { O 32 vector } img_buffer_94_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 97 \
    name img_buffer_95_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_95_out \
    op interface \
    ports { img_buffer_95_out { O 32 vector } img_buffer_95_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 98 \
    name img_buffer_96_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_96_out \
    op interface \
    ports { img_buffer_96_out { O 32 vector } img_buffer_96_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 99 \
    name img_buffer_97_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_97_out \
    op interface \
    ports { img_buffer_97_out { O 32 vector } img_buffer_97_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 100 \
    name img_buffer_98_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_98_out \
    op interface \
    ports { img_buffer_98_out { O 32 vector } img_buffer_98_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 101 \
    name img_buffer_99_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_99_out \
    op interface \
    ports { img_buffer_99_out { O 32 vector } img_buffer_99_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 102 \
    name img_buffer_100_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_100_out \
    op interface \
    ports { img_buffer_100_out { O 32 vector } img_buffer_100_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 103 \
    name img_buffer_101_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_101_out \
    op interface \
    ports { img_buffer_101_out { O 32 vector } img_buffer_101_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 104 \
    name img_buffer_102_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_102_out \
    op interface \
    ports { img_buffer_102_out { O 32 vector } img_buffer_102_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 105 \
    name img_buffer_103_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_103_out \
    op interface \
    ports { img_buffer_103_out { O 32 vector } img_buffer_103_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 106 \
    name img_buffer_104_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_104_out \
    op interface \
    ports { img_buffer_104_out { O 32 vector } img_buffer_104_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 107 \
    name img_buffer_105_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_105_out \
    op interface \
    ports { img_buffer_105_out { O 32 vector } img_buffer_105_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 108 \
    name img_buffer_106_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_106_out \
    op interface \
    ports { img_buffer_106_out { O 32 vector } img_buffer_106_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 109 \
    name img_buffer_107_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_107_out \
    op interface \
    ports { img_buffer_107_out { O 32 vector } img_buffer_107_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 110 \
    name img_buffer_108_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_108_out \
    op interface \
    ports { img_buffer_108_out { O 32 vector } img_buffer_108_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 111 \
    name img_buffer_109_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_109_out \
    op interface \
    ports { img_buffer_109_out { O 32 vector } img_buffer_109_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name img_buffer_110_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_110_out \
    op interface \
    ports { img_buffer_110_out { O 32 vector } img_buffer_110_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 113 \
    name img_buffer_111_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_111_out \
    op interface \
    ports { img_buffer_111_out { O 32 vector } img_buffer_111_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 114 \
    name img_buffer_112_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_112_out \
    op interface \
    ports { img_buffer_112_out { O 32 vector } img_buffer_112_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 115 \
    name img_buffer_113_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_113_out \
    op interface \
    ports { img_buffer_113_out { O 32 vector } img_buffer_113_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 116 \
    name img_buffer_114_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_114_out \
    op interface \
    ports { img_buffer_114_out { O 32 vector } img_buffer_114_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 117 \
    name img_buffer_115_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_115_out \
    op interface \
    ports { img_buffer_115_out { O 32 vector } img_buffer_115_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name img_buffer_116_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_116_out \
    op interface \
    ports { img_buffer_116_out { O 32 vector } img_buffer_116_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name img_buffer_117_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_117_out \
    op interface \
    ports { img_buffer_117_out { O 32 vector } img_buffer_117_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name img_buffer_118_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_118_out \
    op interface \
    ports { img_buffer_118_out { O 32 vector } img_buffer_118_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name img_buffer_119_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_119_out \
    op interface \
    ports { img_buffer_119_out { O 32 vector } img_buffer_119_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name img_buffer_120_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_120_out \
    op interface \
    ports { img_buffer_120_out { O 32 vector } img_buffer_120_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name img_buffer_121_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_121_out \
    op interface \
    ports { img_buffer_121_out { O 32 vector } img_buffer_121_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name img_buffer_122_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_122_out \
    op interface \
    ports { img_buffer_122_out { O 32 vector } img_buffer_122_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name img_buffer_123_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_123_out \
    op interface \
    ports { img_buffer_123_out { O 32 vector } img_buffer_123_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name img_buffer_124_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_124_out \
    op interface \
    ports { img_buffer_124_out { O 32 vector } img_buffer_124_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name img_buffer_125_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_125_out \
    op interface \
    ports { img_buffer_125_out { O 32 vector } img_buffer_125_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name img_buffer_126_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_126_out \
    op interface \
    ports { img_buffer_126_out { O 32 vector } img_buffer_126_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name img_buffer_127_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_127_out \
    op interface \
    ports { img_buffer_127_out { O 32 vector } img_buffer_127_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name img_buffer_128_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_128_out \
    op interface \
    ports { img_buffer_128_out { O 32 vector } img_buffer_128_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name img_buffer_129_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_129_out \
    op interface \
    ports { img_buffer_129_out { O 32 vector } img_buffer_129_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name img_buffer_130_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_130_out \
    op interface \
    ports { img_buffer_130_out { O 32 vector } img_buffer_130_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name img_buffer_131_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_131_out \
    op interface \
    ports { img_buffer_131_out { O 32 vector } img_buffer_131_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name img_buffer_132_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_132_out \
    op interface \
    ports { img_buffer_132_out { O 32 vector } img_buffer_132_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name img_buffer_133_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_133_out \
    op interface \
    ports { img_buffer_133_out { O 32 vector } img_buffer_133_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name img_buffer_134_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_134_out \
    op interface \
    ports { img_buffer_134_out { O 32 vector } img_buffer_134_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name img_buffer_135_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_135_out \
    op interface \
    ports { img_buffer_135_out { O 32 vector } img_buffer_135_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name img_buffer_136_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_136_out \
    op interface \
    ports { img_buffer_136_out { O 32 vector } img_buffer_136_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name img_buffer_137_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_137_out \
    op interface \
    ports { img_buffer_137_out { O 32 vector } img_buffer_137_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name img_buffer_138_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_138_out \
    op interface \
    ports { img_buffer_138_out { O 32 vector } img_buffer_138_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 141 \
    name img_buffer_139_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_139_out \
    op interface \
    ports { img_buffer_139_out { O 32 vector } img_buffer_139_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name img_buffer_140_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_140_out \
    op interface \
    ports { img_buffer_140_out { O 32 vector } img_buffer_140_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name img_buffer_141_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_141_out \
    op interface \
    ports { img_buffer_141_out { O 32 vector } img_buffer_141_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name img_buffer_142_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_142_out \
    op interface \
    ports { img_buffer_142_out { O 32 vector } img_buffer_142_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 145 \
    name img_buffer_143_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_143_out \
    op interface \
    ports { img_buffer_143_out { O 32 vector } img_buffer_143_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 146 \
    name img_buffer_144_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_144_out \
    op interface \
    ports { img_buffer_144_out { O 32 vector } img_buffer_144_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 147 \
    name img_buffer_145_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_145_out \
    op interface \
    ports { img_buffer_145_out { O 32 vector } img_buffer_145_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name img_buffer_146_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_146_out \
    op interface \
    ports { img_buffer_146_out { O 32 vector } img_buffer_146_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 149 \
    name img_buffer_147_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_147_out \
    op interface \
    ports { img_buffer_147_out { O 32 vector } img_buffer_147_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name img_buffer_148_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_148_out \
    op interface \
    ports { img_buffer_148_out { O 32 vector } img_buffer_148_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 151 \
    name img_buffer_149_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_149_out \
    op interface \
    ports { img_buffer_149_out { O 32 vector } img_buffer_149_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name img_buffer_150_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_150_out \
    op interface \
    ports { img_buffer_150_out { O 32 vector } img_buffer_150_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 153 \
    name img_buffer_151_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_151_out \
    op interface \
    ports { img_buffer_151_out { O 32 vector } img_buffer_151_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name img_buffer_152_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_152_out \
    op interface \
    ports { img_buffer_152_out { O 32 vector } img_buffer_152_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 155 \
    name img_buffer_153_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_153_out \
    op interface \
    ports { img_buffer_153_out { O 32 vector } img_buffer_153_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name img_buffer_154_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_154_out \
    op interface \
    ports { img_buffer_154_out { O 32 vector } img_buffer_154_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 157 \
    name img_buffer_155_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_155_out \
    op interface \
    ports { img_buffer_155_out { O 32 vector } img_buffer_155_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 158 \
    name img_buffer_156_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_156_out \
    op interface \
    ports { img_buffer_156_out { O 32 vector } img_buffer_156_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 159 \
    name img_buffer_157_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_157_out \
    op interface \
    ports { img_buffer_157_out { O 32 vector } img_buffer_157_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 160 \
    name img_buffer_158_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_158_out \
    op interface \
    ports { img_buffer_158_out { O 32 vector } img_buffer_158_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 161 \
    name img_buffer_159_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_159_out \
    op interface \
    ports { img_buffer_159_out { O 32 vector } img_buffer_159_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 162 \
    name img_buffer_160_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_160_out \
    op interface \
    ports { img_buffer_160_out { O 32 vector } img_buffer_160_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 163 \
    name img_buffer_161_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_161_out \
    op interface \
    ports { img_buffer_161_out { O 32 vector } img_buffer_161_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 164 \
    name img_buffer_162_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_162_out \
    op interface \
    ports { img_buffer_162_out { O 32 vector } img_buffer_162_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 165 \
    name img_buffer_163_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_163_out \
    op interface \
    ports { img_buffer_163_out { O 32 vector } img_buffer_163_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 166 \
    name img_buffer_164_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_164_out \
    op interface \
    ports { img_buffer_164_out { O 32 vector } img_buffer_164_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 167 \
    name img_buffer_165_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_165_out \
    op interface \
    ports { img_buffer_165_out { O 32 vector } img_buffer_165_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 168 \
    name img_buffer_166_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_166_out \
    op interface \
    ports { img_buffer_166_out { O 32 vector } img_buffer_166_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 169 \
    name img_buffer_167_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_167_out \
    op interface \
    ports { img_buffer_167_out { O 32 vector } img_buffer_167_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
    name img_buffer_168_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_168_out \
    op interface \
    ports { img_buffer_168_out { O 32 vector } img_buffer_168_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 171 \
    name img_buffer_169_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_169_out \
    op interface \
    ports { img_buffer_169_out { O 32 vector } img_buffer_169_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name img_buffer_170_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_170_out \
    op interface \
    ports { img_buffer_170_out { O 32 vector } img_buffer_170_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name img_buffer_171_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_171_out \
    op interface \
    ports { img_buffer_171_out { O 32 vector } img_buffer_171_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name img_buffer_172_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_172_out \
    op interface \
    ports { img_buffer_172_out { O 32 vector } img_buffer_172_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 175 \
    name img_buffer_173_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_173_out \
    op interface \
    ports { img_buffer_173_out { O 32 vector } img_buffer_173_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name img_buffer_174_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_174_out \
    op interface \
    ports { img_buffer_174_out { O 32 vector } img_buffer_174_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 177 \
    name img_buffer_175_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_175_out \
    op interface \
    ports { img_buffer_175_out { O 32 vector } img_buffer_175_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name img_buffer_176_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_176_out \
    op interface \
    ports { img_buffer_176_out { O 32 vector } img_buffer_176_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 179 \
    name img_buffer_177_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_177_out \
    op interface \
    ports { img_buffer_177_out { O 32 vector } img_buffer_177_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 180 \
    name img_buffer_178_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_178_out \
    op interface \
    ports { img_buffer_178_out { O 32 vector } img_buffer_178_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 181 \
    name img_buffer_179_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_179_out \
    op interface \
    ports { img_buffer_179_out { O 32 vector } img_buffer_179_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 182 \
    name img_buffer_180_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_180_out \
    op interface \
    ports { img_buffer_180_out { O 32 vector } img_buffer_180_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 183 \
    name img_buffer_181_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_181_out \
    op interface \
    ports { img_buffer_181_out { O 32 vector } img_buffer_181_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 184 \
    name img_buffer_182_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_182_out \
    op interface \
    ports { img_buffer_182_out { O 32 vector } img_buffer_182_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 185 \
    name img_buffer_183_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_183_out \
    op interface \
    ports { img_buffer_183_out { O 32 vector } img_buffer_183_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 186 \
    name img_buffer_184_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_184_out \
    op interface \
    ports { img_buffer_184_out { O 32 vector } img_buffer_184_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 187 \
    name img_buffer_185_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_185_out \
    op interface \
    ports { img_buffer_185_out { O 32 vector } img_buffer_185_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name img_buffer_186_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_186_out \
    op interface \
    ports { img_buffer_186_out { O 32 vector } img_buffer_186_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 189 \
    name img_buffer_187_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_187_out \
    op interface \
    ports { img_buffer_187_out { O 32 vector } img_buffer_187_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 190 \
    name img_buffer_188_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_188_out \
    op interface \
    ports { img_buffer_188_out { O 32 vector } img_buffer_188_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 191 \
    name img_buffer_189_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_189_out \
    op interface \
    ports { img_buffer_189_out { O 32 vector } img_buffer_189_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 192 \
    name img_buffer_190_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_190_out \
    op interface \
    ports { img_buffer_190_out { O 32 vector } img_buffer_190_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 193 \
    name img_buffer_191_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_191_out \
    op interface \
    ports { img_buffer_191_out { O 32 vector } img_buffer_191_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 194 \
    name img_buffer_192_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_192_out \
    op interface \
    ports { img_buffer_192_out { O 32 vector } img_buffer_192_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 195 \
    name img_buffer_193_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_193_out \
    op interface \
    ports { img_buffer_193_out { O 32 vector } img_buffer_193_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 196 \
    name img_buffer_194_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_194_out \
    op interface \
    ports { img_buffer_194_out { O 32 vector } img_buffer_194_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 197 \
    name img_buffer_195_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_195_out \
    op interface \
    ports { img_buffer_195_out { O 32 vector } img_buffer_195_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 198 \
    name img_buffer_196_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_196_out \
    op interface \
    ports { img_buffer_196_out { O 32 vector } img_buffer_196_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 199 \
    name img_buffer_197_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_197_out \
    op interface \
    ports { img_buffer_197_out { O 32 vector } img_buffer_197_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 200 \
    name img_buffer_198_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_198_out \
    op interface \
    ports { img_buffer_198_out { O 32 vector } img_buffer_198_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 201 \
    name img_buffer_199_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_199_out \
    op interface \
    ports { img_buffer_199_out { O 32 vector } img_buffer_199_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 202 \
    name img_buffer_200_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_200_out \
    op interface \
    ports { img_buffer_200_out { O 32 vector } img_buffer_200_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
    name img_buffer_201_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_201_out \
    op interface \
    ports { img_buffer_201_out { O 32 vector } img_buffer_201_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 204 \
    name img_buffer_202_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_202_out \
    op interface \
    ports { img_buffer_202_out { O 32 vector } img_buffer_202_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
    name img_buffer_203_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_203_out \
    op interface \
    ports { img_buffer_203_out { O 32 vector } img_buffer_203_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 206 \
    name img_buffer_204_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_204_out \
    op interface \
    ports { img_buffer_204_out { O 32 vector } img_buffer_204_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name img_buffer_205_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_205_out \
    op interface \
    ports { img_buffer_205_out { O 32 vector } img_buffer_205_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name img_buffer_206_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_206_out \
    op interface \
    ports { img_buffer_206_out { O 32 vector } img_buffer_206_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name img_buffer_207_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_207_out \
    op interface \
    ports { img_buffer_207_out { O 32 vector } img_buffer_207_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name img_buffer_208_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_208_out \
    op interface \
    ports { img_buffer_208_out { O 32 vector } img_buffer_208_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 211 \
    name img_buffer_209_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_209_out \
    op interface \
    ports { img_buffer_209_out { O 32 vector } img_buffer_209_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 212 \
    name img_buffer_210_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_210_out \
    op interface \
    ports { img_buffer_210_out { O 32 vector } img_buffer_210_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 213 \
    name img_buffer_211_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_211_out \
    op interface \
    ports { img_buffer_211_out { O 32 vector } img_buffer_211_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 214 \
    name img_buffer_212_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_212_out \
    op interface \
    ports { img_buffer_212_out { O 32 vector } img_buffer_212_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 215 \
    name img_buffer_213_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_213_out \
    op interface \
    ports { img_buffer_213_out { O 32 vector } img_buffer_213_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 216 \
    name img_buffer_214_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_214_out \
    op interface \
    ports { img_buffer_214_out { O 32 vector } img_buffer_214_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 217 \
    name img_buffer_215_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_215_out \
    op interface \
    ports { img_buffer_215_out { O 32 vector } img_buffer_215_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 218 \
    name img_buffer_216_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_216_out \
    op interface \
    ports { img_buffer_216_out { O 32 vector } img_buffer_216_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 219 \
    name img_buffer_217_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_217_out \
    op interface \
    ports { img_buffer_217_out { O 32 vector } img_buffer_217_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 220 \
    name img_buffer_218_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_218_out \
    op interface \
    ports { img_buffer_218_out { O 32 vector } img_buffer_218_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 221 \
    name img_buffer_219_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_219_out \
    op interface \
    ports { img_buffer_219_out { O 32 vector } img_buffer_219_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 222 \
    name img_buffer_220_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_220_out \
    op interface \
    ports { img_buffer_220_out { O 32 vector } img_buffer_220_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 223 \
    name img_buffer_221_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_221_out \
    op interface \
    ports { img_buffer_221_out { O 32 vector } img_buffer_221_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 224 \
    name img_buffer_222_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_222_out \
    op interface \
    ports { img_buffer_222_out { O 32 vector } img_buffer_222_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 225 \
    name img_buffer_223_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_223_out \
    op interface \
    ports { img_buffer_223_out { O 32 vector } img_buffer_223_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 226 \
    name img_buffer_224_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_224_out \
    op interface \
    ports { img_buffer_224_out { O 32 vector } img_buffer_224_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 227 \
    name img_buffer_225_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_225_out \
    op interface \
    ports { img_buffer_225_out { O 32 vector } img_buffer_225_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 228 \
    name img_buffer_226_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_226_out \
    op interface \
    ports { img_buffer_226_out { O 32 vector } img_buffer_226_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 229 \
    name img_buffer_227_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_227_out \
    op interface \
    ports { img_buffer_227_out { O 32 vector } img_buffer_227_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 230 \
    name img_buffer_228_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_228_out \
    op interface \
    ports { img_buffer_228_out { O 32 vector } img_buffer_228_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 231 \
    name img_buffer_229_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_229_out \
    op interface \
    ports { img_buffer_229_out { O 32 vector } img_buffer_229_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 232 \
    name img_buffer_230_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_230_out \
    op interface \
    ports { img_buffer_230_out { O 32 vector } img_buffer_230_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 233 \
    name img_buffer_231_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_231_out \
    op interface \
    ports { img_buffer_231_out { O 32 vector } img_buffer_231_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 234 \
    name img_buffer_232_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_232_out \
    op interface \
    ports { img_buffer_232_out { O 32 vector } img_buffer_232_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 235 \
    name img_buffer_233_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_233_out \
    op interface \
    ports { img_buffer_233_out { O 32 vector } img_buffer_233_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 236 \
    name img_buffer_234_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_234_out \
    op interface \
    ports { img_buffer_234_out { O 32 vector } img_buffer_234_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 237 \
    name img_buffer_235_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_235_out \
    op interface \
    ports { img_buffer_235_out { O 32 vector } img_buffer_235_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 238 \
    name img_buffer_236_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_236_out \
    op interface \
    ports { img_buffer_236_out { O 32 vector } img_buffer_236_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 239 \
    name img_buffer_237_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_237_out \
    op interface \
    ports { img_buffer_237_out { O 32 vector } img_buffer_237_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 240 \
    name img_buffer_238_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_238_out \
    op interface \
    ports { img_buffer_238_out { O 32 vector } img_buffer_238_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 241 \
    name img_buffer_239_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_239_out \
    op interface \
    ports { img_buffer_239_out { O 32 vector } img_buffer_239_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 242 \
    name img_buffer_240_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_240_out \
    op interface \
    ports { img_buffer_240_out { O 32 vector } img_buffer_240_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 243 \
    name img_buffer_241_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_241_out \
    op interface \
    ports { img_buffer_241_out { O 32 vector } img_buffer_241_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 244 \
    name img_buffer_242_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_242_out \
    op interface \
    ports { img_buffer_242_out { O 32 vector } img_buffer_242_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 245 \
    name img_buffer_243_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_243_out \
    op interface \
    ports { img_buffer_243_out { O 32 vector } img_buffer_243_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 246 \
    name img_buffer_244_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_244_out \
    op interface \
    ports { img_buffer_244_out { O 32 vector } img_buffer_244_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 247 \
    name img_buffer_245_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_245_out \
    op interface \
    ports { img_buffer_245_out { O 32 vector } img_buffer_245_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 248 \
    name img_buffer_246_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_246_out \
    op interface \
    ports { img_buffer_246_out { O 32 vector } img_buffer_246_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 249 \
    name img_buffer_247_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_247_out \
    op interface \
    ports { img_buffer_247_out { O 32 vector } img_buffer_247_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 250 \
    name img_buffer_248_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_248_out \
    op interface \
    ports { img_buffer_248_out { O 32 vector } img_buffer_248_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 251 \
    name img_buffer_249_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_249_out \
    op interface \
    ports { img_buffer_249_out { O 32 vector } img_buffer_249_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 252 \
    name img_buffer_250_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_250_out \
    op interface \
    ports { img_buffer_250_out { O 32 vector } img_buffer_250_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 253 \
    name img_buffer_251_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_251_out \
    op interface \
    ports { img_buffer_251_out { O 32 vector } img_buffer_251_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 254 \
    name img_buffer_252_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_252_out \
    op interface \
    ports { img_buffer_252_out { O 32 vector } img_buffer_252_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 255 \
    name img_buffer_253_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_253_out \
    op interface \
    ports { img_buffer_253_out { O 32 vector } img_buffer_253_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 256 \
    name img_buffer_254_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_254_out \
    op interface \
    ports { img_buffer_254_out { O 32 vector } img_buffer_254_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 257 \
    name img_buffer_255_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_255_out \
    op interface \
    ports { img_buffer_255_out { O 32 vector } img_buffer_255_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 258 \
    name img_buffer_256_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_256_out \
    op interface \
    ports { img_buffer_256_out { O 32 vector } img_buffer_256_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 259 \
    name img_buffer_257_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_257_out \
    op interface \
    ports { img_buffer_257_out { O 32 vector } img_buffer_257_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 260 \
    name img_buffer_258_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_258_out \
    op interface \
    ports { img_buffer_258_out { O 32 vector } img_buffer_258_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 261 \
    name img_buffer_259_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_259_out \
    op interface \
    ports { img_buffer_259_out { O 32 vector } img_buffer_259_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 262 \
    name img_buffer_260_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_260_out \
    op interface \
    ports { img_buffer_260_out { O 32 vector } img_buffer_260_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 263 \
    name img_buffer_261_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_261_out \
    op interface \
    ports { img_buffer_261_out { O 32 vector } img_buffer_261_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 264 \
    name img_buffer_262_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_262_out \
    op interface \
    ports { img_buffer_262_out { O 32 vector } img_buffer_262_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 265 \
    name img_buffer_263_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_263_out \
    op interface \
    ports { img_buffer_263_out { O 32 vector } img_buffer_263_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 266 \
    name img_buffer_264_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_264_out \
    op interface \
    ports { img_buffer_264_out { O 32 vector } img_buffer_264_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 267 \
    name img_buffer_265_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_265_out \
    op interface \
    ports { img_buffer_265_out { O 32 vector } img_buffer_265_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 268 \
    name img_buffer_266_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_266_out \
    op interface \
    ports { img_buffer_266_out { O 32 vector } img_buffer_266_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 269 \
    name img_buffer_267_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_267_out \
    op interface \
    ports { img_buffer_267_out { O 32 vector } img_buffer_267_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 270 \
    name img_buffer_268_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_268_out \
    op interface \
    ports { img_buffer_268_out { O 32 vector } img_buffer_268_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 271 \
    name img_buffer_269_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_269_out \
    op interface \
    ports { img_buffer_269_out { O 32 vector } img_buffer_269_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 272 \
    name img_buffer_270_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_270_out \
    op interface \
    ports { img_buffer_270_out { O 32 vector } img_buffer_270_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 273 \
    name img_buffer_271_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_271_out \
    op interface \
    ports { img_buffer_271_out { O 32 vector } img_buffer_271_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 274 \
    name img_buffer_272_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_272_out \
    op interface \
    ports { img_buffer_272_out { O 32 vector } img_buffer_272_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 275 \
    name img_buffer_273_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_273_out \
    op interface \
    ports { img_buffer_273_out { O 32 vector } img_buffer_273_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 276 \
    name img_buffer_274_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_274_out \
    op interface \
    ports { img_buffer_274_out { O 32 vector } img_buffer_274_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 277 \
    name img_buffer_275_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_275_out \
    op interface \
    ports { img_buffer_275_out { O 32 vector } img_buffer_275_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 278 \
    name img_buffer_276_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_276_out \
    op interface \
    ports { img_buffer_276_out { O 32 vector } img_buffer_276_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 279 \
    name img_buffer_277_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_277_out \
    op interface \
    ports { img_buffer_277_out { O 32 vector } img_buffer_277_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 280 \
    name img_buffer_278_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_278_out \
    op interface \
    ports { img_buffer_278_out { O 32 vector } img_buffer_278_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 281 \
    name img_buffer_279_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_279_out \
    op interface \
    ports { img_buffer_279_out { O 32 vector } img_buffer_279_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 282 \
    name img_buffer_280_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_280_out \
    op interface \
    ports { img_buffer_280_out { O 32 vector } img_buffer_280_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 283 \
    name img_buffer_281_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_281_out \
    op interface \
    ports { img_buffer_281_out { O 32 vector } img_buffer_281_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 284 \
    name img_buffer_282_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_282_out \
    op interface \
    ports { img_buffer_282_out { O 32 vector } img_buffer_282_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 285 \
    name img_buffer_283_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_283_out \
    op interface \
    ports { img_buffer_283_out { O 32 vector } img_buffer_283_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 286 \
    name img_buffer_284_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_284_out \
    op interface \
    ports { img_buffer_284_out { O 32 vector } img_buffer_284_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 287 \
    name img_buffer_285_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_285_out \
    op interface \
    ports { img_buffer_285_out { O 32 vector } img_buffer_285_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 288 \
    name img_buffer_286_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_286_out \
    op interface \
    ports { img_buffer_286_out { O 32 vector } img_buffer_286_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 289 \
    name img_buffer_287_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_287_out \
    op interface \
    ports { img_buffer_287_out { O 32 vector } img_buffer_287_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 290 \
    name img_buffer_288_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_288_out \
    op interface \
    ports { img_buffer_288_out { O 32 vector } img_buffer_288_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 291 \
    name img_buffer_289_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_289_out \
    op interface \
    ports { img_buffer_289_out { O 32 vector } img_buffer_289_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 292 \
    name img_buffer_290_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_290_out \
    op interface \
    ports { img_buffer_290_out { O 32 vector } img_buffer_290_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 293 \
    name img_buffer_291_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_291_out \
    op interface \
    ports { img_buffer_291_out { O 32 vector } img_buffer_291_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 294 \
    name img_buffer_292_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_292_out \
    op interface \
    ports { img_buffer_292_out { O 32 vector } img_buffer_292_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 295 \
    name img_buffer_293_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_293_out \
    op interface \
    ports { img_buffer_293_out { O 32 vector } img_buffer_293_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 296 \
    name img_buffer_294_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_294_out \
    op interface \
    ports { img_buffer_294_out { O 32 vector } img_buffer_294_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 297 \
    name img_buffer_295_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_295_out \
    op interface \
    ports { img_buffer_295_out { O 32 vector } img_buffer_295_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 298 \
    name img_buffer_296_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_296_out \
    op interface \
    ports { img_buffer_296_out { O 32 vector } img_buffer_296_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 299 \
    name img_buffer_297_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_297_out \
    op interface \
    ports { img_buffer_297_out { O 32 vector } img_buffer_297_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 300 \
    name img_buffer_298_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_298_out \
    op interface \
    ports { img_buffer_298_out { O 32 vector } img_buffer_298_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 301 \
    name img_buffer_299_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_299_out \
    op interface \
    ports { img_buffer_299_out { O 32 vector } img_buffer_299_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 302 \
    name img_buffer_300_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_300_out \
    op interface \
    ports { img_buffer_300_out { O 32 vector } img_buffer_300_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 303 \
    name img_buffer_301_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_301_out \
    op interface \
    ports { img_buffer_301_out { O 32 vector } img_buffer_301_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 304 \
    name img_buffer_302_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_302_out \
    op interface \
    ports { img_buffer_302_out { O 32 vector } img_buffer_302_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 305 \
    name img_buffer_303_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_303_out \
    op interface \
    ports { img_buffer_303_out { O 32 vector } img_buffer_303_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 306 \
    name img_buffer_304_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_304_out \
    op interface \
    ports { img_buffer_304_out { O 32 vector } img_buffer_304_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 307 \
    name img_buffer_305_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_305_out \
    op interface \
    ports { img_buffer_305_out { O 32 vector } img_buffer_305_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 308 \
    name img_buffer_306_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_306_out \
    op interface \
    ports { img_buffer_306_out { O 32 vector } img_buffer_306_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 309 \
    name img_buffer_307_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_307_out \
    op interface \
    ports { img_buffer_307_out { O 32 vector } img_buffer_307_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 310 \
    name img_buffer_308_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_308_out \
    op interface \
    ports { img_buffer_308_out { O 32 vector } img_buffer_308_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 311 \
    name img_buffer_309_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_309_out \
    op interface \
    ports { img_buffer_309_out { O 32 vector } img_buffer_309_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 312 \
    name img_buffer_310_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_310_out \
    op interface \
    ports { img_buffer_310_out { O 32 vector } img_buffer_310_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 313 \
    name img_buffer_311_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_311_out \
    op interface \
    ports { img_buffer_311_out { O 32 vector } img_buffer_311_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 314 \
    name img_buffer_312_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_312_out \
    op interface \
    ports { img_buffer_312_out { O 32 vector } img_buffer_312_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 315 \
    name img_buffer_313_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_313_out \
    op interface \
    ports { img_buffer_313_out { O 32 vector } img_buffer_313_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 316 \
    name img_buffer_314_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_314_out \
    op interface \
    ports { img_buffer_314_out { O 32 vector } img_buffer_314_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 317 \
    name img_buffer_315_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_315_out \
    op interface \
    ports { img_buffer_315_out { O 32 vector } img_buffer_315_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 318 \
    name img_buffer_316_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_316_out \
    op interface \
    ports { img_buffer_316_out { O 32 vector } img_buffer_316_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 319 \
    name img_buffer_317_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_317_out \
    op interface \
    ports { img_buffer_317_out { O 32 vector } img_buffer_317_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 320 \
    name img_buffer_318_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_318_out \
    op interface \
    ports { img_buffer_318_out { O 32 vector } img_buffer_318_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 321 \
    name img_buffer_319_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_319_out \
    op interface \
    ports { img_buffer_319_out { O 32 vector } img_buffer_319_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 322 \
    name img_buffer_320_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_320_out \
    op interface \
    ports { img_buffer_320_out { O 32 vector } img_buffer_320_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 323 \
    name img_buffer_321_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_321_out \
    op interface \
    ports { img_buffer_321_out { O 32 vector } img_buffer_321_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 324 \
    name img_buffer_322_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_322_out \
    op interface \
    ports { img_buffer_322_out { O 32 vector } img_buffer_322_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 325 \
    name img_buffer_323_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_323_out \
    op interface \
    ports { img_buffer_323_out { O 32 vector } img_buffer_323_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 326 \
    name img_buffer_324_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_324_out \
    op interface \
    ports { img_buffer_324_out { O 32 vector } img_buffer_324_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 327 \
    name img_buffer_325_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_325_out \
    op interface \
    ports { img_buffer_325_out { O 32 vector } img_buffer_325_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 328 \
    name img_buffer_326_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_326_out \
    op interface \
    ports { img_buffer_326_out { O 32 vector } img_buffer_326_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 329 \
    name img_buffer_327_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_327_out \
    op interface \
    ports { img_buffer_327_out { O 32 vector } img_buffer_327_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 330 \
    name img_buffer_328_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_328_out \
    op interface \
    ports { img_buffer_328_out { O 32 vector } img_buffer_328_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 331 \
    name img_buffer_329_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_329_out \
    op interface \
    ports { img_buffer_329_out { O 32 vector } img_buffer_329_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 332 \
    name img_buffer_330_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_330_out \
    op interface \
    ports { img_buffer_330_out { O 32 vector } img_buffer_330_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 333 \
    name img_buffer_331_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_331_out \
    op interface \
    ports { img_buffer_331_out { O 32 vector } img_buffer_331_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 334 \
    name img_buffer_332_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_332_out \
    op interface \
    ports { img_buffer_332_out { O 32 vector } img_buffer_332_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 335 \
    name img_buffer_333_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_333_out \
    op interface \
    ports { img_buffer_333_out { O 32 vector } img_buffer_333_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 336 \
    name img_buffer_334_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_334_out \
    op interface \
    ports { img_buffer_334_out { O 32 vector } img_buffer_334_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 337 \
    name img_buffer_335_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_335_out \
    op interface \
    ports { img_buffer_335_out { O 32 vector } img_buffer_335_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 338 \
    name img_buffer_336_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_336_out \
    op interface \
    ports { img_buffer_336_out { O 32 vector } img_buffer_336_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 339 \
    name img_buffer_337_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_337_out \
    op interface \
    ports { img_buffer_337_out { O 32 vector } img_buffer_337_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 340 \
    name img_buffer_338_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_338_out \
    op interface \
    ports { img_buffer_338_out { O 32 vector } img_buffer_338_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 341 \
    name img_buffer_339_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_339_out \
    op interface \
    ports { img_buffer_339_out { O 32 vector } img_buffer_339_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 342 \
    name img_buffer_340_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_340_out \
    op interface \
    ports { img_buffer_340_out { O 32 vector } img_buffer_340_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 343 \
    name img_buffer_341_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_341_out \
    op interface \
    ports { img_buffer_341_out { O 32 vector } img_buffer_341_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 344 \
    name img_buffer_342_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_342_out \
    op interface \
    ports { img_buffer_342_out { O 32 vector } img_buffer_342_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 345 \
    name img_buffer_343_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_343_out \
    op interface \
    ports { img_buffer_343_out { O 32 vector } img_buffer_343_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 346 \
    name img_buffer_344_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_344_out \
    op interface \
    ports { img_buffer_344_out { O 32 vector } img_buffer_344_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 347 \
    name img_buffer_345_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_345_out \
    op interface \
    ports { img_buffer_345_out { O 32 vector } img_buffer_345_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 348 \
    name img_buffer_346_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_346_out \
    op interface \
    ports { img_buffer_346_out { O 32 vector } img_buffer_346_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 349 \
    name img_buffer_347_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_347_out \
    op interface \
    ports { img_buffer_347_out { O 32 vector } img_buffer_347_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 350 \
    name img_buffer_348_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_348_out \
    op interface \
    ports { img_buffer_348_out { O 32 vector } img_buffer_348_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 351 \
    name img_buffer_349_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_349_out \
    op interface \
    ports { img_buffer_349_out { O 32 vector } img_buffer_349_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 352 \
    name img_buffer_350_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_350_out \
    op interface \
    ports { img_buffer_350_out { O 32 vector } img_buffer_350_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 353 \
    name img_buffer_351_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_351_out \
    op interface \
    ports { img_buffer_351_out { O 32 vector } img_buffer_351_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 354 \
    name img_buffer_352_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_352_out \
    op interface \
    ports { img_buffer_352_out { O 32 vector } img_buffer_352_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 355 \
    name img_buffer_353_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_353_out \
    op interface \
    ports { img_buffer_353_out { O 32 vector } img_buffer_353_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 356 \
    name img_buffer_354_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_354_out \
    op interface \
    ports { img_buffer_354_out { O 32 vector } img_buffer_354_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 357 \
    name img_buffer_355_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_355_out \
    op interface \
    ports { img_buffer_355_out { O 32 vector } img_buffer_355_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 358 \
    name img_buffer_356_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_356_out \
    op interface \
    ports { img_buffer_356_out { O 32 vector } img_buffer_356_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 359 \
    name img_buffer_357_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_357_out \
    op interface \
    ports { img_buffer_357_out { O 32 vector } img_buffer_357_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 360 \
    name img_buffer_358_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_358_out \
    op interface \
    ports { img_buffer_358_out { O 32 vector } img_buffer_358_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 361 \
    name img_buffer_359_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_359_out \
    op interface \
    ports { img_buffer_359_out { O 32 vector } img_buffer_359_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 362 \
    name img_buffer_360_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_360_out \
    op interface \
    ports { img_buffer_360_out { O 32 vector } img_buffer_360_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 363 \
    name img_buffer_361_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_361_out \
    op interface \
    ports { img_buffer_361_out { O 32 vector } img_buffer_361_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 364 \
    name img_buffer_362_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_362_out \
    op interface \
    ports { img_buffer_362_out { O 32 vector } img_buffer_362_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 365 \
    name img_buffer_363_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_363_out \
    op interface \
    ports { img_buffer_363_out { O 32 vector } img_buffer_363_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 366 \
    name img_buffer_364_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_364_out \
    op interface \
    ports { img_buffer_364_out { O 32 vector } img_buffer_364_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 367 \
    name img_buffer_365_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_365_out \
    op interface \
    ports { img_buffer_365_out { O 32 vector } img_buffer_365_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 368 \
    name img_buffer_366_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_366_out \
    op interface \
    ports { img_buffer_366_out { O 32 vector } img_buffer_366_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 369 \
    name img_buffer_367_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_367_out \
    op interface \
    ports { img_buffer_367_out { O 32 vector } img_buffer_367_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 370 \
    name img_buffer_368_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_368_out \
    op interface \
    ports { img_buffer_368_out { O 32 vector } img_buffer_368_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 371 \
    name img_buffer_369_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_369_out \
    op interface \
    ports { img_buffer_369_out { O 32 vector } img_buffer_369_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 372 \
    name img_buffer_370_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_370_out \
    op interface \
    ports { img_buffer_370_out { O 32 vector } img_buffer_370_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 373 \
    name img_buffer_371_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_371_out \
    op interface \
    ports { img_buffer_371_out { O 32 vector } img_buffer_371_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 374 \
    name img_buffer_372_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_372_out \
    op interface \
    ports { img_buffer_372_out { O 32 vector } img_buffer_372_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 375 \
    name img_buffer_373_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_373_out \
    op interface \
    ports { img_buffer_373_out { O 32 vector } img_buffer_373_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 376 \
    name img_buffer_374_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_374_out \
    op interface \
    ports { img_buffer_374_out { O 32 vector } img_buffer_374_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 377 \
    name img_buffer_375_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_375_out \
    op interface \
    ports { img_buffer_375_out { O 32 vector } img_buffer_375_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 378 \
    name img_buffer_376_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_376_out \
    op interface \
    ports { img_buffer_376_out { O 32 vector } img_buffer_376_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 379 \
    name img_buffer_377_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_377_out \
    op interface \
    ports { img_buffer_377_out { O 32 vector } img_buffer_377_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 380 \
    name img_buffer_378_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_378_out \
    op interface \
    ports { img_buffer_378_out { O 32 vector } img_buffer_378_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 381 \
    name img_buffer_379_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_379_out \
    op interface \
    ports { img_buffer_379_out { O 32 vector } img_buffer_379_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 382 \
    name img_buffer_380_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_380_out \
    op interface \
    ports { img_buffer_380_out { O 32 vector } img_buffer_380_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 383 \
    name img_buffer_381_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_381_out \
    op interface \
    ports { img_buffer_381_out { O 32 vector } img_buffer_381_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 384 \
    name img_buffer_382_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_382_out \
    op interface \
    ports { img_buffer_382_out { O 32 vector } img_buffer_382_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 385 \
    name img_buffer_383_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_383_out \
    op interface \
    ports { img_buffer_383_out { O 32 vector } img_buffer_383_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 386 \
    name img_buffer_384_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_384_out \
    op interface \
    ports { img_buffer_384_out { O 32 vector } img_buffer_384_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 387 \
    name img_buffer_385_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_385_out \
    op interface \
    ports { img_buffer_385_out { O 32 vector } img_buffer_385_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 388 \
    name img_buffer_386_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_386_out \
    op interface \
    ports { img_buffer_386_out { O 32 vector } img_buffer_386_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 389 \
    name img_buffer_387_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_387_out \
    op interface \
    ports { img_buffer_387_out { O 32 vector } img_buffer_387_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 390 \
    name img_buffer_388_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_388_out \
    op interface \
    ports { img_buffer_388_out { O 32 vector } img_buffer_388_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 391 \
    name img_buffer_389_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_389_out \
    op interface \
    ports { img_buffer_389_out { O 32 vector } img_buffer_389_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 392 \
    name img_buffer_390_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_390_out \
    op interface \
    ports { img_buffer_390_out { O 32 vector } img_buffer_390_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 393 \
    name img_buffer_391_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_391_out \
    op interface \
    ports { img_buffer_391_out { O 32 vector } img_buffer_391_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 394 \
    name img_buffer_392_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_392_out \
    op interface \
    ports { img_buffer_392_out { O 32 vector } img_buffer_392_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 395 \
    name img_buffer_393_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_393_out \
    op interface \
    ports { img_buffer_393_out { O 32 vector } img_buffer_393_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 396 \
    name img_buffer_394_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_394_out \
    op interface \
    ports { img_buffer_394_out { O 32 vector } img_buffer_394_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 397 \
    name img_buffer_395_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_395_out \
    op interface \
    ports { img_buffer_395_out { O 32 vector } img_buffer_395_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 398 \
    name img_buffer_396_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_396_out \
    op interface \
    ports { img_buffer_396_out { O 32 vector } img_buffer_396_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 399 \
    name img_buffer_397_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_397_out \
    op interface \
    ports { img_buffer_397_out { O 32 vector } img_buffer_397_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 400 \
    name img_buffer_398_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_398_out \
    op interface \
    ports { img_buffer_398_out { O 32 vector } img_buffer_398_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 401 \
    name img_buffer_399_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_399_out \
    op interface \
    ports { img_buffer_399_out { O 32 vector } img_buffer_399_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 402 \
    name img_buffer_400_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_400_out \
    op interface \
    ports { img_buffer_400_out { O 32 vector } img_buffer_400_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 403 \
    name img_buffer_401_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_401_out \
    op interface \
    ports { img_buffer_401_out { O 32 vector } img_buffer_401_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 404 \
    name img_buffer_402_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_402_out \
    op interface \
    ports { img_buffer_402_out { O 32 vector } img_buffer_402_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 405 \
    name img_buffer_403_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_403_out \
    op interface \
    ports { img_buffer_403_out { O 32 vector } img_buffer_403_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 406 \
    name img_buffer_404_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_404_out \
    op interface \
    ports { img_buffer_404_out { O 32 vector } img_buffer_404_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 407 \
    name img_buffer_405_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_405_out \
    op interface \
    ports { img_buffer_405_out { O 32 vector } img_buffer_405_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 408 \
    name img_buffer_406_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_406_out \
    op interface \
    ports { img_buffer_406_out { O 32 vector } img_buffer_406_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 409 \
    name img_buffer_407_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_407_out \
    op interface \
    ports { img_buffer_407_out { O 32 vector } img_buffer_407_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 410 \
    name img_buffer_408_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_408_out \
    op interface \
    ports { img_buffer_408_out { O 32 vector } img_buffer_408_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 411 \
    name img_buffer_409_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_409_out \
    op interface \
    ports { img_buffer_409_out { O 32 vector } img_buffer_409_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 412 \
    name img_buffer_410_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_410_out \
    op interface \
    ports { img_buffer_410_out { O 32 vector } img_buffer_410_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 413 \
    name img_buffer_411_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_411_out \
    op interface \
    ports { img_buffer_411_out { O 32 vector } img_buffer_411_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 414 \
    name img_buffer_412_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_412_out \
    op interface \
    ports { img_buffer_412_out { O 32 vector } img_buffer_412_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 415 \
    name img_buffer_413_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_413_out \
    op interface \
    ports { img_buffer_413_out { O 32 vector } img_buffer_413_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 416 \
    name img_buffer_414_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_414_out \
    op interface \
    ports { img_buffer_414_out { O 32 vector } img_buffer_414_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 417 \
    name img_buffer_415_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_415_out \
    op interface \
    ports { img_buffer_415_out { O 32 vector } img_buffer_415_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 418 \
    name img_buffer_416_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_416_out \
    op interface \
    ports { img_buffer_416_out { O 32 vector } img_buffer_416_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 419 \
    name img_buffer_417_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_417_out \
    op interface \
    ports { img_buffer_417_out { O 32 vector } img_buffer_417_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 420 \
    name img_buffer_418_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_418_out \
    op interface \
    ports { img_buffer_418_out { O 32 vector } img_buffer_418_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 421 \
    name img_buffer_419_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_419_out \
    op interface \
    ports { img_buffer_419_out { O 32 vector } img_buffer_419_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 422 \
    name img_buffer_420_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_420_out \
    op interface \
    ports { img_buffer_420_out { O 32 vector } img_buffer_420_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 423 \
    name img_buffer_421_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_421_out \
    op interface \
    ports { img_buffer_421_out { O 32 vector } img_buffer_421_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 424 \
    name img_buffer_422_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_422_out \
    op interface \
    ports { img_buffer_422_out { O 32 vector } img_buffer_422_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 425 \
    name img_buffer_423_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_423_out \
    op interface \
    ports { img_buffer_423_out { O 32 vector } img_buffer_423_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 426 \
    name img_buffer_424_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_424_out \
    op interface \
    ports { img_buffer_424_out { O 32 vector } img_buffer_424_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 427 \
    name img_buffer_425_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_425_out \
    op interface \
    ports { img_buffer_425_out { O 32 vector } img_buffer_425_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 428 \
    name img_buffer_426_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_426_out \
    op interface \
    ports { img_buffer_426_out { O 32 vector } img_buffer_426_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 429 \
    name img_buffer_427_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_427_out \
    op interface \
    ports { img_buffer_427_out { O 32 vector } img_buffer_427_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 430 \
    name img_buffer_428_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_428_out \
    op interface \
    ports { img_buffer_428_out { O 32 vector } img_buffer_428_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 431 \
    name img_buffer_429_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_429_out \
    op interface \
    ports { img_buffer_429_out { O 32 vector } img_buffer_429_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 432 \
    name img_buffer_430_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_430_out \
    op interface \
    ports { img_buffer_430_out { O 32 vector } img_buffer_430_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 433 \
    name img_buffer_431_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_431_out \
    op interface \
    ports { img_buffer_431_out { O 32 vector } img_buffer_431_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 434 \
    name img_buffer_432_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_432_out \
    op interface \
    ports { img_buffer_432_out { O 32 vector } img_buffer_432_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 435 \
    name img_buffer_433_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_433_out \
    op interface \
    ports { img_buffer_433_out { O 32 vector } img_buffer_433_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 436 \
    name img_buffer_434_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_434_out \
    op interface \
    ports { img_buffer_434_out { O 32 vector } img_buffer_434_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 437 \
    name img_buffer_435_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_435_out \
    op interface \
    ports { img_buffer_435_out { O 32 vector } img_buffer_435_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 438 \
    name img_buffer_436_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_436_out \
    op interface \
    ports { img_buffer_436_out { O 32 vector } img_buffer_436_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 439 \
    name img_buffer_437_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_437_out \
    op interface \
    ports { img_buffer_437_out { O 32 vector } img_buffer_437_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 440 \
    name img_buffer_438_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_438_out \
    op interface \
    ports { img_buffer_438_out { O 32 vector } img_buffer_438_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 441 \
    name img_buffer_439_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_439_out \
    op interface \
    ports { img_buffer_439_out { O 32 vector } img_buffer_439_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 442 \
    name img_buffer_440_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_440_out \
    op interface \
    ports { img_buffer_440_out { O 32 vector } img_buffer_440_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 443 \
    name img_buffer_441_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_441_out \
    op interface \
    ports { img_buffer_441_out { O 32 vector } img_buffer_441_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 444 \
    name img_buffer_442_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_442_out \
    op interface \
    ports { img_buffer_442_out { O 32 vector } img_buffer_442_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 445 \
    name img_buffer_443_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_443_out \
    op interface \
    ports { img_buffer_443_out { O 32 vector } img_buffer_443_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 446 \
    name img_buffer_444_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_444_out \
    op interface \
    ports { img_buffer_444_out { O 32 vector } img_buffer_444_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 447 \
    name img_buffer_445_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_445_out \
    op interface \
    ports { img_buffer_445_out { O 32 vector } img_buffer_445_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 448 \
    name img_buffer_446_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_446_out \
    op interface \
    ports { img_buffer_446_out { O 32 vector } img_buffer_446_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 449 \
    name img_buffer_447_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_447_out \
    op interface \
    ports { img_buffer_447_out { O 32 vector } img_buffer_447_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 450 \
    name img_buffer_448_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_448_out \
    op interface \
    ports { img_buffer_448_out { O 32 vector } img_buffer_448_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 451 \
    name img_buffer_449_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_449_out \
    op interface \
    ports { img_buffer_449_out { O 32 vector } img_buffer_449_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 452 \
    name img_buffer_450_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_450_out \
    op interface \
    ports { img_buffer_450_out { O 32 vector } img_buffer_450_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 453 \
    name img_buffer_451_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_451_out \
    op interface \
    ports { img_buffer_451_out { O 32 vector } img_buffer_451_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 454 \
    name img_buffer_452_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_452_out \
    op interface \
    ports { img_buffer_452_out { O 32 vector } img_buffer_452_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 455 \
    name img_buffer_453_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_453_out \
    op interface \
    ports { img_buffer_453_out { O 32 vector } img_buffer_453_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 456 \
    name img_buffer_454_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_454_out \
    op interface \
    ports { img_buffer_454_out { O 32 vector } img_buffer_454_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 457 \
    name img_buffer_455_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_455_out \
    op interface \
    ports { img_buffer_455_out { O 32 vector } img_buffer_455_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 458 \
    name img_buffer_456_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_456_out \
    op interface \
    ports { img_buffer_456_out { O 32 vector } img_buffer_456_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 459 \
    name img_buffer_457_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_457_out \
    op interface \
    ports { img_buffer_457_out { O 32 vector } img_buffer_457_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 460 \
    name img_buffer_458_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_458_out \
    op interface \
    ports { img_buffer_458_out { O 32 vector } img_buffer_458_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 461 \
    name img_buffer_459_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_459_out \
    op interface \
    ports { img_buffer_459_out { O 32 vector } img_buffer_459_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 462 \
    name img_buffer_460_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_460_out \
    op interface \
    ports { img_buffer_460_out { O 32 vector } img_buffer_460_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 463 \
    name img_buffer_461_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_461_out \
    op interface \
    ports { img_buffer_461_out { O 32 vector } img_buffer_461_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 464 \
    name img_buffer_462_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_462_out \
    op interface \
    ports { img_buffer_462_out { O 32 vector } img_buffer_462_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 465 \
    name img_buffer_463_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_463_out \
    op interface \
    ports { img_buffer_463_out { O 32 vector } img_buffer_463_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 466 \
    name img_buffer_464_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_464_out \
    op interface \
    ports { img_buffer_464_out { O 32 vector } img_buffer_464_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 467 \
    name img_buffer_465_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_465_out \
    op interface \
    ports { img_buffer_465_out { O 32 vector } img_buffer_465_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 468 \
    name img_buffer_466_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_466_out \
    op interface \
    ports { img_buffer_466_out { O 32 vector } img_buffer_466_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 469 \
    name img_buffer_467_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_467_out \
    op interface \
    ports { img_buffer_467_out { O 32 vector } img_buffer_467_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 470 \
    name img_buffer_468_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_468_out \
    op interface \
    ports { img_buffer_468_out { O 32 vector } img_buffer_468_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 471 \
    name img_buffer_469_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_469_out \
    op interface \
    ports { img_buffer_469_out { O 32 vector } img_buffer_469_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 472 \
    name img_buffer_470_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_470_out \
    op interface \
    ports { img_buffer_470_out { O 32 vector } img_buffer_470_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 473 \
    name img_buffer_471_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_471_out \
    op interface \
    ports { img_buffer_471_out { O 32 vector } img_buffer_471_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 474 \
    name img_buffer_472_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_472_out \
    op interface \
    ports { img_buffer_472_out { O 32 vector } img_buffer_472_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 475 \
    name img_buffer_473_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_473_out \
    op interface \
    ports { img_buffer_473_out { O 32 vector } img_buffer_473_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 476 \
    name img_buffer_474_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_474_out \
    op interface \
    ports { img_buffer_474_out { O 32 vector } img_buffer_474_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 477 \
    name img_buffer_475_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_475_out \
    op interface \
    ports { img_buffer_475_out { O 32 vector } img_buffer_475_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 478 \
    name img_buffer_476_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_476_out \
    op interface \
    ports { img_buffer_476_out { O 32 vector } img_buffer_476_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 479 \
    name img_buffer_477_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_477_out \
    op interface \
    ports { img_buffer_477_out { O 32 vector } img_buffer_477_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 480 \
    name img_buffer_478_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_478_out \
    op interface \
    ports { img_buffer_478_out { O 32 vector } img_buffer_478_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 481 \
    name img_buffer_479_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_479_out \
    op interface \
    ports { img_buffer_479_out { O 32 vector } img_buffer_479_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 482 \
    name img_buffer_480_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_480_out \
    op interface \
    ports { img_buffer_480_out { O 32 vector } img_buffer_480_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 483 \
    name img_buffer_481_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_481_out \
    op interface \
    ports { img_buffer_481_out { O 32 vector } img_buffer_481_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 484 \
    name img_buffer_482_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_482_out \
    op interface \
    ports { img_buffer_482_out { O 32 vector } img_buffer_482_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 485 \
    name img_buffer_483_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_483_out \
    op interface \
    ports { img_buffer_483_out { O 32 vector } img_buffer_483_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 486 \
    name img_buffer_484_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_484_out \
    op interface \
    ports { img_buffer_484_out { O 32 vector } img_buffer_484_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 487 \
    name img_buffer_485_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_485_out \
    op interface \
    ports { img_buffer_485_out { O 32 vector } img_buffer_485_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 488 \
    name img_buffer_486_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_486_out \
    op interface \
    ports { img_buffer_486_out { O 32 vector } img_buffer_486_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 489 \
    name img_buffer_487_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_487_out \
    op interface \
    ports { img_buffer_487_out { O 32 vector } img_buffer_487_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 490 \
    name img_buffer_488_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_488_out \
    op interface \
    ports { img_buffer_488_out { O 32 vector } img_buffer_488_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 491 \
    name img_buffer_489_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_489_out \
    op interface \
    ports { img_buffer_489_out { O 32 vector } img_buffer_489_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 492 \
    name img_buffer_490_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_490_out \
    op interface \
    ports { img_buffer_490_out { O 32 vector } img_buffer_490_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 493 \
    name img_buffer_491_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_491_out \
    op interface \
    ports { img_buffer_491_out { O 32 vector } img_buffer_491_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 494 \
    name img_buffer_492_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_492_out \
    op interface \
    ports { img_buffer_492_out { O 32 vector } img_buffer_492_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 495 \
    name img_buffer_493_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_493_out \
    op interface \
    ports { img_buffer_493_out { O 32 vector } img_buffer_493_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 496 \
    name img_buffer_494_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_494_out \
    op interface \
    ports { img_buffer_494_out { O 32 vector } img_buffer_494_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 497 \
    name img_buffer_495_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_495_out \
    op interface \
    ports { img_buffer_495_out { O 32 vector } img_buffer_495_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 498 \
    name img_buffer_496_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_496_out \
    op interface \
    ports { img_buffer_496_out { O 32 vector } img_buffer_496_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 499 \
    name img_buffer_497_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_497_out \
    op interface \
    ports { img_buffer_497_out { O 32 vector } img_buffer_497_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 500 \
    name img_buffer_498_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_498_out \
    op interface \
    ports { img_buffer_498_out { O 32 vector } img_buffer_498_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 501 \
    name img_buffer_499_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_499_out \
    op interface \
    ports { img_buffer_499_out { O 32 vector } img_buffer_499_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 502 \
    name img_buffer_500_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_500_out \
    op interface \
    ports { img_buffer_500_out { O 32 vector } img_buffer_500_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 503 \
    name img_buffer_501_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_501_out \
    op interface \
    ports { img_buffer_501_out { O 32 vector } img_buffer_501_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 504 \
    name img_buffer_502_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_502_out \
    op interface \
    ports { img_buffer_502_out { O 32 vector } img_buffer_502_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 505 \
    name img_buffer_503_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_503_out \
    op interface \
    ports { img_buffer_503_out { O 32 vector } img_buffer_503_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 506 \
    name img_buffer_504_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_504_out \
    op interface \
    ports { img_buffer_504_out { O 32 vector } img_buffer_504_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 507 \
    name img_buffer_505_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_505_out \
    op interface \
    ports { img_buffer_505_out { O 32 vector } img_buffer_505_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 508 \
    name img_buffer_506_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_506_out \
    op interface \
    ports { img_buffer_506_out { O 32 vector } img_buffer_506_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 509 \
    name img_buffer_507_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_507_out \
    op interface \
    ports { img_buffer_507_out { O 32 vector } img_buffer_507_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 510 \
    name img_buffer_508_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_508_out \
    op interface \
    ports { img_buffer_508_out { O 32 vector } img_buffer_508_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 511 \
    name img_buffer_509_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_509_out \
    op interface \
    ports { img_buffer_509_out { O 32 vector } img_buffer_509_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 512 \
    name img_buffer_510_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_510_out \
    op interface \
    ports { img_buffer_510_out { O 32 vector } img_buffer_510_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 513 \
    name img_buffer_511_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_511_out \
    op interface \
    ports { img_buffer_511_out { O 32 vector } img_buffer_511_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 514 \
    name img_buffer_512_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_512_out \
    op interface \
    ports { img_buffer_512_out { O 32 vector } img_buffer_512_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 515 \
    name img_buffer_513_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_513_out \
    op interface \
    ports { img_buffer_513_out { O 32 vector } img_buffer_513_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 516 \
    name img_buffer_514_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img_buffer_514_out \
    op interface \
    ports { img_buffer_514_out { O 32 vector } img_buffer_514_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 517 \
    name p_phi_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_phi_out \
    op interface \
    ports { p_phi_out { O 32 vector } p_phi_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName canny_flow_control_loop_pipe_sequential_init_U
set CompName canny_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix canny_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


