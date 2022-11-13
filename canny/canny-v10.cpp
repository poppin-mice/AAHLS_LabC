#include <iostream>
//#include <cmath>
#include "ap_int.h"
 #include "hls_math.h"
 using namespace hls;

using namespace std;

#include "canny.h"
#define truncate 6
#define rest_truncate 2

//void canny(DTYPE src[16384], DTYPE dst[16384], int upperThresh, int lowerThresh)
void canny(DTYPE* src, DTYPE* dst, int upperThresh, int lowerThresh)
{
#pragma HLS INTERFACE mode=axis register_mode=both depth=17000 port=dst register
#pragma HLS INTERFACE mode=axis register_mode=both depth=17000 port=src register

	ap_int<8> gauss_sobel[25] = {-12, -15, 0, 15, 12,
							-39, -49, 0, 49, 39,
							-54, -68, 0, 68, 54,
							-39, -49, 0, 49, 39,
							-12, -15, 0, 15, 12
	};
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=gauss_sobel

	DTYPE img_window[25];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=img_window

    DTYPE img_buffer[517];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=img_buffer
//128*5
    ap_int<22> G[259];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=G

    ap_int<10> theta[130];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=theta

    ap_int<22> q, r;
    ap_int<22> sup;
    ap_int<17> x, y;
    ap_int<11> idx, idy;
    int pos_img, pos_gauss_sobel_x, pos_gauss_sobel_y;
//    int i,j,_i,_j;


    read_img:
    for(int i = 0; i < 259; i++){
        read_shift:
        for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[i];
    }
//all condition in one loop
	idx:
    for(int i = 0; i < 128;i++){
        idy:
        for(int j = 0; j < 128;j++){
            x = 0;
            y = 0;
            kernel_r:
            for(int r = -2; r < 3; r++){
#pragma HLS UNROLL

                kernel_c:
                for(int c = -2; c < 3; c++){
                    if(i+r < 0){
                        idx = 2-(i<<1)-r;
                    }
                    else if(i+r > 127){
                        idx = 256-(i<<1)-r;
                    }
                    else{
                        idx = r+2;
                    }
                    if(j+c < 0){
                        idy = 2-(j<<1)-c;
                    }
                    else if(j+c > 127){
                        idy = 256-(j<<1)-c;
                    }
                    else{
                        idy = c+2;
                    }
                    pos_gauss_sobel_x = ((r+2)<<2) + (c+r+4);
                    pos_gauss_sobel_y = ((c+2)<<2) + (r+c+4);
                    x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                    y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
                }

            }
            x = x >> truncate;
            y = y >> truncate;

            gradient_shift:
            for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

                G[k] = G[k+1];
            }
            theta_shift:
            for(int k = 0; k < 129; k++){
#pragma HLS UNROLL

                theta[k] = theta[k+1];
            }
            G[258] = (x*x + y*y);

            if(x == 0)
                theta[129] = 10;
            else
                theta[129] = (y<<5)/x;
            //shifting register
            shift_reg:
            for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

                img_buffer[k] = img_buffer[k+1];
            }
            img_buffer[516] = src[259+(i<<7)+j];

            window_x:
			for(int a = 0; a < 5; a++){
				window_y:
				for(int b = 0; b < 5; b++){
#pragma HLS UNROLL

					img_window[a*5+b] = img_buffer[a*128+b];
				}
			}
            //NMS (starts when input >= 130)
            if(theta[0] <= 13 && theta[0] > -13){//region 1
				q = G[130];
				r = G[128];
            }
            else if(theta[0] <= 77 && theta[0] > 13){//region 4
				q = G[258];
				r = G[0];
            }
            else if(theta[0] <= -13 && theta[0] > -77){//region 2
				q = G[2];
				r = G[256];
            }
            else{//region 3
				q = G[257];
				r = G[1];
            }


            sup = (G[129] >= q && G[129] >= r)? (int)G[129] : 0;
            if((i<<7) + j >= 129){
                dst[(i<<7) + j - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
            }
        }
    }
    rest_result:
    for(int i = 16255; i < 16384; i++){
        rest_G_shift:
        for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

            G[k] = G[k+1];
        }
        rest_theta_shift:
        for(int k = 0; k < 129; k++){
#pragma HLS UNROLL

            theta[k] = theta[k+1];
        }
        G[258] = 0;
        theta[129] = 0;
        if(theta[0] <= 13 && theta[0] > -13){//region 1
			q = G[130];
			r = G[128];
		}
		else if(theta[0] <= 77 && theta[0] > 13){//region 4
			q = G[258];
			r = G[0];
		}
		else if(theta[0] <= -13 && theta[0] > -77){//region 2
			q = G[2];
			r = G[256];
		}
		else{//region 3
			q = G[257];
			r = G[1];
		}

        sup = (G[129] >= q && G[129] >= r)? (int)G[129] : 0;
        dst[i] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    }
}
