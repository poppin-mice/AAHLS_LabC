# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
src_buff { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
dst_buff { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
}
dict set axilite_register_dict control $port_control


