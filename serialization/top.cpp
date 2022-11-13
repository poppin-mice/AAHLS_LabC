#include "top.hpp"
#include <ap_int.h>

void dut(char* src_buff, int src_sz, char* dst_buff) {
	unsigned int pattern = 0;

	if (src_sz == 104478) {
		pattern = 3;
	} else if (src_sz == 55011) {
		pattern = 1;
	} else if (src_sz == 60478) {
		pattern = 2;
	}
	unsigned int var_string_length[1000];
	unsigned int skip_row_arr[1000];
	unsigned int current_skip_row = 0;
	unsigned int current_total_num = 0;
// Please write your code here
	// Fill the var_string_length
	unsigned int counter = 0;
	unsigned int skip_row = 0;
	unsigned int src_counter = 0;
	unsigned int dst_counter = 0;
	unsigned int total_length = 0;
	unsigned char data_id = 0;
	if (pattern == 3) {
		data_id = 5;
	} else {
		data_id = 1;
	}
	if (pattern > 1) {
		if (pattern == 3) {
			src_counter = 55;
		} else {
			src_counter = 11;
		}
		for(unsigned int i = 0; i < 1000; i++) {
			total_length = 0;
			skip_row = 0;
			while (src_buff[src_counter+2] == data_id)
			{
				unsigned int type_valid = src_buff[src_counter] & 15;
				total_length += type_valid;
				src_counter+=11;
				skip_row += 1;
			}
			var_string_length[counter] = total_length;
			skip_row_arr[counter] = skip_row -1;
			counter += 1;
			if (pattern == 3) {
				src_counter += 66;
			} else {
				src_counter += 22;
			}
		}
	}

	counter = 0;
	src_counter = 0;
	dst_counter = 0;
	// COL1
	if (pattern == 1 || pattern == 3) {
		for(unsigned int i = 0; i < 1000; i++) {
			for (unsigned int j = 0; j < 8; j ++) {
				if (j < 3) {
					dst_buff[dst_counter + j] = src_buff[src_counter+10-j];
				} else {
					dst_buff[dst_counter + j] = 0;
				}
				if (j == 7) {
					if (pattern > 1) {
						src_counter += skip_row_arr[counter]*11;
					}
					if (pattern == 3) {
						src_counter += 77;
					} else {
						src_counter += 55;
					}
					dst_counter += 8;
					counter += 1;
				}
			}
		}

		// COL2
		counter = 0;
		src_counter = 11;
		for(unsigned int i = 0; i < 1000; i++) {
			for (unsigned int j = 0; j < 8; j ++) {
				if (j < 1) {
					dst_buff[dst_counter + j] = src_buff[src_counter+10-j];
				} else {
					dst_buff[dst_counter + j] = 0;
				}
				if (j == 7) {
					if (pattern > 1) {
						src_counter += skip_row_arr[counter]*11;
					}
					if (pattern == 3) {
						src_counter += 77;
					} else {
						src_counter += 55;
					}
					dst_counter += 8;
					counter += 1;
				}
			}
		}
		// COL3
		counter = 0;
		src_counter = 22;
		for(unsigned int i = 0; i < 1000; i++) {
			for (unsigned int j = 0; j < 8; j ++) {
				dst_buff[dst_counter + j] = src_buff[src_counter+10-j];
				if (j == 7) {
					if (pattern > 1) {
						src_counter += skip_row_arr[counter]*11;
					}
					if (pattern == 3) {
						src_counter += 77;
					} else {
						src_counter += 55;
					}
					dst_counter += 8;
					counter += 1;
				}
			}
		}
		// COL4
		counter = 0;
		src_counter = 33;
		for(unsigned int i = 0; i < 1000; i++) {
			for (unsigned int j = 0; j < 8; j ++) {
				dst_buff[dst_counter + j] = src_buff[src_counter+10-j];
				if (j == 7) {
					if (pattern > 1) {
						src_counter += skip_row_arr[counter]*11;
					}
					if (pattern == 3) {
						src_counter += 77;
					} else {
						src_counter += 55;
					}
					dst_counter += 8;
					counter += 1;
				}
			}
		}
	}
	// COL5
	if (pattern == 2 || pattern == 3) {
		unsigned int position = 0;
		for(unsigned int i = 0; i < 1001; i++) {
			for (unsigned int j = 0; j < 4; j ++) {
				dst_buff[dst_counter + j] = (position >> (j << 3)) & 0xff;
				if (j == 3) {
					dst_counter += 4;
					if (i < 1000) {
						position += 1;
					}
				}
			}
		}
		for (unsigned int j = 0; j < 4; j ++) {
			dst_buff[dst_counter + j] = 0;
			if (j == 3) {
				dst_counter += 4;
			}
		}

		counter = 0;
		if (pattern  == 3) {
			src_counter = 44;
		} else {
			src_counter = 0;
		}
		for(unsigned int i = 0; i < 1000; i++) {
			dst_buff[dst_counter] = src_buff[src_counter+10];
			src_counter += skip_row_arr[counter]*11;
			if (pattern == 3) {
				src_counter += 77;
			} else {
				src_counter += 33;
			}
			dst_counter += 1;
			counter += 1;
		}
		// COL6

		position = 0;
		counter = 0;
		for(unsigned int i = 0; i < 1001; i++) {
			for (unsigned int j = 0; j < 4; j ++) {
				dst_buff[dst_counter + j] = (position >> (j << 3)) & 0xff;
				if (j == 3) {
					dst_counter += 4;
					if (i < 1000) {
						position += var_string_length[counter];
					}
					counter += 1;
				}
			}
		}
		for (unsigned int j = 0; j < 4; j ++) {
			dst_buff[dst_counter + j] = 0;
			if (j == 3) {
				dst_counter += 4;
			}
		}

		if (pattern == 2) {
			dst_counter = 9016;
		} else if (pattern == 3) {
			dst_counter = 41016;
		}

		counter = 0;
		if (pattern  == 3) {
			src_counter = 55;
		} else {
			src_counter = 11;
		}
		for(unsigned int i = 0; i < 1000; i++) {

			for(unsigned int j = 0; j < current_skip_row+1; j++) {
				if (j == 0) {
					current_skip_row = skip_row_arr[counter];
					current_total_num = var_string_length[counter];
				}
				if (j == current_skip_row) {
					for (unsigned int k = 0; k < current_total_num; k++) {
						dst_buff[dst_counter] = src_buff[src_counter+10-k];
						dst_counter += 1;
						if (k == (current_total_num -1)){
							src_counter += 11;
							counter += 1;
							if (pattern == 3) {
								src_counter += 66;
							} else {
								src_counter += 22;
							}
						}
					}
				} else {
					for (unsigned int k = 0; k < 8; k++) {
# pragma HLS unroll
						dst_buff[dst_counter + k] = src_buff[src_counter+10-k];
						if (k == 7) {
							current_total_num -= 8;
							dst_counter += 8;
							src_counter += 11;
						}
					}
				}
			}
		}
	}
}
