#include <iostream>
//#include <cmath>
 #include "hls_math.h"
 using namespace hls;

using namespace std;

#include "canny.h"

#define truncate 6
#define rest_truncate 2

void canny(DTYPE* src, DTYPE* dst, int upperThresh, int lowerThresh)
{
	ap_int<8> gauss_sobel[25] = {-12, -15, 0, 15, 12,
							-39, -49, 0, 49, 39,
							-54, -68, 0, 68, 54,
							-39, -49, 0, 49, 39,
							-12, -15, 0, 15, 12
	};
	DTYPE img_window[25];
    DTYPE img_buffer[517];//128*5
    ap_int<22> G[259];
	ap_int<11> theta[130];
	ap_int<22> q, r;
	ap_int<22> sup;
	ap_int<17> x, y;
	ap_int<11> idx, idy;
    int pos_img, pos_gauss_sobel_x, pos_gauss_sobel_y;
    // int gsr, gsc;
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


    ////////////////////////////////////////////////////////////////////////////////////////i==0, j==0
    x = 0;
    y = 0;
    // i0j0_0_r:
    for(int r = 4, gsr = 0; r> 1; r--, gsr++){
        // i0j0_0_c:
        for(int c = 4, gsc = 0; c > 1; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 3, gsc = 3; c < 5; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    // i0j0_1_r:
    for(int r = 3, gsr = 3; r< 5; r++, gsr++){
        // i0j0_1_c:
        for(int c = 4, gsc = 0; c > 1; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 3, gsc = 3; c < 5; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // i0j0_gradient_shift:
    for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

        G[k] = G[k+1];
    }
    // i0j0_theta_shift:
    for(int k = 0; k < 129; k++){
#pragma HLS UNROLL

        theta[k] = theta[k+1];
    }
    G[258] = (x*x + y*y);

    //cout << G[258] << endl;

    if(x == 0)
        theta[129] = 10;
    else
        theta[129] = (y<<5)/x;
    //shifting register
    // i0j0_shift_reg:
    for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259];

    // i0j0_window_x:
//    for(int a = 0; a < 5; a++){
//        // i0j0_window_y:
//        for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//            img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }

    img_window[0] = img_buffer[0];
    img_window[1] = img_buffer[1];
    img_window[2] = img_buffer[2];
    img_window[3] = img_buffer[3];
    img_window[4] = img_buffer[4];
    img_window[5] = img_buffer[128];
    img_window[6] = img_buffer[129];
    img_window[7] = img_buffer[130];
    img_window[8] = img_buffer[131];
    img_window[9] = img_buffer[132];
    img_window[10] = img_buffer[256];
    img_window[11] = img_buffer[257];
    img_window[12] = img_buffer[258];
    img_window[13] = img_buffer[259];
    img_window[14] = img_buffer[260];
    img_window[15] = img_buffer[384];
    img_window[16] = img_buffer[385];
    img_window[17] = img_buffer[386];
    img_window[18] = img_buffer[387];
    img_window[19] = img_buffer[388];
    img_window[20] = img_buffer[512];
    img_window[21] = img_buffer[513];
    img_window[22] = img_buffer[514];
    img_window[23] = img_buffer[515];
    img_window[24] = img_buffer[516];

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
    ////////////////////////////////////////////////////////////////////////////////////////i==0, j==1
    x = 0;
    y = 0;
    // i0j1_0_r:
    for(int r = 4, gsr = 0; r> 1; r--, gsr++){
        // gsc = 0;
        // i0j1_0_c:
        for(int c = 2, gsc = 0; c > 0; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 3, gsr = 3; r< 5; r++, gsr++){
        // kernel_c:
        for(int c = 2, gsc = 0; c > 0; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        // gsr++, gsr++;
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

        G[k] = G[k+1];
    }
    // theta_shift:
    for(int k = 0; k < 129; k++){
#pragma HLS UNROLL

        theta[k] = theta[k+1];
    }
    G[258] = (x*x + y*y);
    // cout << x << endl;

    if(x == 0)
        theta[129] = 10;
    else
        theta[129] = (y<<5)/x;
    //shifting register
    // shift_reg:
    for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[260];

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//            img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    ////////////////////////////////////////////////////////////////////////////////////////i==0, j==2~125
    for(int j = 2; j < 126; j++){
        x = 0;
        y = 0;
        // i_kernel_r:
        for(int r = 4, gsr = 0; r> 1; r--, gsr++){
            kernel_c:
            for(int c = 0, gsc = 0; c < 5; c++, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        for(int r = 3, gsr = 3; r< 5; r++, gsr++){
            // kernel_c:
            for(int c = 0, gsc = 0; c < 5; c++, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        x = x >> truncate;
        y = y >> truncate;

        // gradient_shift:
        for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

            G[k] = G[k+1];
        }
        // theta_shift:
        for(int k = 0; k < 129; k++){
#pragma HLS UNROLL

            theta[k] = theta[k+1];
        }
        G[258] = (x*x + y*y);
        //cout << G[258] << endl;

        if(x == 0)
            theta[129] = 10;
        else
            theta[129] = (y<<5)/x;
        //shifting register
        // shift_reg:
        for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259+j];

        // window_x:
//        for(int a = 0; a < 5; a++){
//            // window_y:
//            for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//                img_window[a*5+b] = img_buffer[a*128+b];
//            }
//        }
        img_window[0] = img_buffer[0];
            img_window[1] = img_buffer[1];
            img_window[2] = img_buffer[2];
            img_window[3] = img_buffer[3];
            img_window[4] = img_buffer[4];
            img_window[5] = img_buffer[128];
            img_window[6] = img_buffer[129];
            img_window[7] = img_buffer[130];
            img_window[8] = img_buffer[131];
            img_window[9] = img_buffer[132];
            img_window[10] = img_buffer[256];
            img_window[11] = img_buffer[257];
            img_window[12] = img_buffer[258];
            img_window[13] = img_buffer[259];
            img_window[14] = img_buffer[260];
            img_window[15] = img_buffer[384];
            img_window[16] = img_buffer[385];
            img_window[17] = img_buffer[386];
            img_window[18] = img_buffer[387];
            img_window[19] = img_buffer[388];
            img_window[20] = img_buffer[512];
            img_window[21] = img_buffer[513];
            img_window[22] = img_buffer[514];
            img_window[23] = img_buffer[515];
            img_window[24] = img_buffer[516];
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
    }
    ////////////////////////////////////////////////////////////////////////////////////////i==0, j==126
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 4, gsr = 0; r> 1; r--, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 3, gsc = 3; c > 1; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 3, gsr = 3; r< 5; r++, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 3, gsc = 3; c > 1; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

        G[k] = G[k+1];
    }
    // theta_shift:
    for(int k = 0; k < 129; k++){
#pragma HLS UNROLL

        theta[k] = theta[k+1];
    }
    G[258] = (x*x + y*y);
    //cout << G[258] << endl;

    if(x == 0)
        theta[129] = 10;
    else
        theta[129] = (y<<5)/x;
    //shifting register
    // shift_reg:
    for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259+126];

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//            img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    ////////////////////////////////////////////////////////////////////////////////////////i==0, j==127
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 4, gsr = 0; r> 1; r--, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 1, gsc = 3; c > -1; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 3, gsr = 3; r< 5; r++, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 1, gsc = 3; c > -1; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

        G[k] = G[k+1];
    }
    // theta_shift:
    for(int k = 0; k < 129; k++){
#pragma HLS UNROLL

        theta[k] = theta[k+1];
    }
    G[258] = (x*x + y*y);
    //cout << G[258] << endl;

    if(x == 0)
        theta[129] = 10;
    else
        theta[129] = (y<<5)/x;
    //shifting register
    // shift_reg:
    for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259+127];

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//            img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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

    ////////////////////////////////////////////////////////////////////////////////////////i==1, j==0
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 2, gsr = 0; r> 0; r--, gsr++){
        // kernel_c:
        for(int c = 4, gsc = 0; c > 1; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 3, gsc = 3; c < 5; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 2, gsr = 2; r< 5; r++, gsr++){
        // kernel_c:
        for(int c = 4, gsc = 0; c > 1; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 3, gsc = 3; c < 5; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

        G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259+128];

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//            img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    // dst[(1<<7) + 0 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    ////////////////////////////////////////////////////////////////////////////////////////i==1, j==1
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 2, gsr = 0; r> 0; r--, gsr++){
        // kernel_c:
        for(int c = 2, gsc = 0; c > 0; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 2, gsr = 2; r< 5; r++, gsr++){
        // kernel_c:
        for(int c = 2, gsc = 0; c > 0; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

        G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259+129];

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//            img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(1<<7) + 1 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    ////////////////////////////////////////////////////////////////////////////////////////i==1, j==2~125
    for(int j = 2; j < 126; j++){
        x = 0;
        y = 0;
        // i_kernel_r:
        for(int r = 2, gsr = 0; r> 0; r--, gsr++){
            // kernel_c:
            for(int c = 0, gsc = 0; c < 5; c++, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        for(int r = 2, gsr = 2; r< 5; r++, gsr++){
            // kernel_c:
            for(int c = 0, gsc = 0; c < 5; c++, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        x = x >> truncate;
        y = y >> truncate;

        // gradient_shift:
        for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

            G[k] = G[k+1];
        }
        // theta_shift:
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
        // shift_reg:
        for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259+128+j];

        // window_x:
//        for(int a = 0; a < 5; a++){
//            // window_y:
//            for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//                img_window[a*5+b] = img_buffer[a*128+b];
//            }
//        }
        img_window[0] = img_buffer[0];
            img_window[1] = img_buffer[1];
            img_window[2] = img_buffer[2];
            img_window[3] = img_buffer[3];
            img_window[4] = img_buffer[4];
            img_window[5] = img_buffer[128];
            img_window[6] = img_buffer[129];
            img_window[7] = img_buffer[130];
            img_window[8] = img_buffer[131];
            img_window[9] = img_buffer[132];
            img_window[10] = img_buffer[256];
            img_window[11] = img_buffer[257];
            img_window[12] = img_buffer[258];
            img_window[13] = img_buffer[259];
            img_window[14] = img_buffer[260];
            img_window[15] = img_buffer[384];
            img_window[16] = img_buffer[385];
            img_window[17] = img_buffer[386];
            img_window[18] = img_buffer[387];
            img_window[19] = img_buffer[388];
            img_window[20] = img_buffer[512];
            img_window[21] = img_buffer[513];
            img_window[22] = img_buffer[514];
            img_window[23] = img_buffer[515];
            img_window[24] = img_buffer[516];
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
        dst[(1<<7) + j - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    }
    ////////////////////////////////////////////////////////////////////////////////////////i==1, j==126
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 2, gsr = 0; r> 0; r--, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 4; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 3; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 2, gsr = 2; r< 5; r++, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 4; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 3; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

        G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259+128+126];

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//            img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(1<<7) + 126 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);

    ////////////////////////////////////////////////////////////////////////////////////////i==1, j==127
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 2, gsr = 0; r> 0; r--, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 1, gsc = 3; c > -1; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 2, gsr = 2; r< 5; r++, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 1, gsc = 3; c > -1; c--, gsc++){
#pragma HLS UNROLL

            idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

        G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259+128+127];

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//            img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(1<<7) + 127 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    //////////////////////////////////////////////////////////////////////////////////////
    // i_x:
    for(int i = 2; i < 126;i++){
        ////////////////////////////////////////////////////////////////////////////////////////i==2~125, j==0
        x = 0;
        y = 0;
        // i_kernel_r:
        for(int r = 0, gsr = 0; r< 5; r++, gsr++){
            // kernel_c:
            for(int c = 4, gsc = 0; c > 2; c--, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
            for(int c = 2, gsc = 2; c < 5; c++, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }

        }
        x = x >> truncate;
        y = y >> truncate;

        // gradient_shift:
        for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

            G[k] = G[k+1];
        }
        // theta_shift:
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
        // shift_reg:
        for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259+(i<<7)];

        // window_x:
//        for(int a = 0; a < 5; a++){
//            // window_y:
//            for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//                img_window[a*5+b] = img_buffer[a*128+b];
//            }
//        }
        img_window[0] = img_buffer[0];
            img_window[1] = img_buffer[1];
            img_window[2] = img_buffer[2];
            img_window[3] = img_buffer[3];
            img_window[4] = img_buffer[4];
            img_window[5] = img_buffer[128];
            img_window[6] = img_buffer[129];
            img_window[7] = img_buffer[130];
            img_window[8] = img_buffer[131];
            img_window[9] = img_buffer[132];
            img_window[10] = img_buffer[256];
            img_window[11] = img_buffer[257];
            img_window[12] = img_buffer[258];
            img_window[13] = img_buffer[259];
            img_window[14] = img_buffer[260];
            img_window[15] = img_buffer[384];
            img_window[16] = img_buffer[385];
            img_window[17] = img_buffer[386];
            img_window[18] = img_buffer[387];
            img_window[19] = img_buffer[388];
            img_window[20] = img_buffer[512];
            img_window[21] = img_buffer[513];
            img_window[22] = img_buffer[514];
            img_window[23] = img_buffer[515];
            img_window[24] = img_buffer[516];
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
        dst[(i<<7) + 0 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);

        ////////////////////////////////////////////////////////////////////////////////////////i==2~125, j==1
        x = 0;
        y = 0;
        // i_kernel_r:
        for(int r = 0, gsr = 0; r< 5; r++, gsr++){
            // kernel_c:
            for(int c = 2, gsc = 0; c > 0; c--, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
            for(int c = 2, gsc = 2; c < 5; c++, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        x = x >> truncate;
        y = y >> truncate;

        // gradient_shift:
        for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

            G[k] = G[k+1];
        }
        // theta_shift:
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
        // shift_reg:
        for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259+(i<<7)+1];

        // window_x:
//        for(int a = 0; a < 5; a++){
//            // window_y:
//            for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//                img_window[a*5+b] = img_buffer[a*128+b];
//            }
//        }
        img_window[0] = img_buffer[0];
            img_window[1] = img_buffer[1];
            img_window[2] = img_buffer[2];
            img_window[3] = img_buffer[3];
            img_window[4] = img_buffer[4];
            img_window[5] = img_buffer[128];
            img_window[6] = img_buffer[129];
            img_window[7] = img_buffer[130];
            img_window[8] = img_buffer[131];
            img_window[9] = img_buffer[132];
            img_window[10] = img_buffer[256];
            img_window[11] = img_buffer[257];
            img_window[12] = img_buffer[258];
            img_window[13] = img_buffer[259];
            img_window[14] = img_buffer[260];
            img_window[15] = img_buffer[384];
            img_window[16] = img_buffer[385];
            img_window[17] = img_buffer[386];
            img_window[18] = img_buffer[387];
            img_window[19] = img_buffer[388];
            img_window[20] = img_buffer[512];
            img_window[21] = img_buffer[513];
            img_window[22] = img_buffer[514];
            img_window[23] = img_buffer[515];
            img_window[24] = img_buffer[516];
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
        dst[(i<<7) + 1 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);

        //////////////////////////////////////////////////////////////////////////////////////i==2~125, j==2~125
        // i_y:
        for(int j = 2; j < 126;j++){
            x = 0;
            y = 0;
            // i_kernel_r:
            for(int r = 0, gsr = 0; r< 5; r++, gsr++){
                // kernel_c:
                for(int c = 0, gsc = 0; c < 5; c++, gsc++){
#pragma HLS UNROLL

                    idx = r;
                    idy = c;
                    pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                    pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                    x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                    y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
                }

            }
            x = x >> truncate;
            y = y >> truncate;

            // gradient_shift:
            for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

                G[k] = G[k+1];
            }
            // theta_shift:
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
            // shift_reg:
            for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

                img_buffer[k] = img_buffer[k+1];
            }
            img_buffer[516] = src[259+(i<<7)+j];

            // window_x:
//			for(int a = 0; a < 5; a++){
//				// window_y:
//				for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//					img_window[a*5+b] = img_buffer[a*128+b];
//				}
//			}
            img_window[0] = img_buffer[0];
                img_window[1] = img_buffer[1];
                img_window[2] = img_buffer[2];
                img_window[3] = img_buffer[3];
                img_window[4] = img_buffer[4];
                img_window[5] = img_buffer[128];
                img_window[6] = img_buffer[129];
                img_window[7] = img_buffer[130];
                img_window[8] = img_buffer[131];
                img_window[9] = img_buffer[132];
                img_window[10] = img_buffer[256];
                img_window[11] = img_buffer[257];
                img_window[12] = img_buffer[258];
                img_window[13] = img_buffer[259];
                img_window[14] = img_buffer[260];
                img_window[15] = img_buffer[384];
                img_window[16] = img_buffer[385];
                img_window[17] = img_buffer[386];
                img_window[18] = img_buffer[387];
                img_window[19] = img_buffer[388];
                img_window[20] = img_buffer[512];
                img_window[21] = img_buffer[513];
                img_window[22] = img_buffer[514];
                img_window[23] = img_buffer[515];
                img_window[24] = img_buffer[516];
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
            dst[(i<<7) + j - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
        }

        ////////////////////////////////////////////////////////////////////////////////////////i==2~125, j==126
        x = 0;
        y = 0;
        // i_kernel_r:
        for(int r = 0, gsr = 0; r< 5; r++, gsr++){
            // kernel_c:
            for(int c = 0, gsc = 0; c < 3; c++, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
            for(int c = 3, gsc = 3; c > 1; c--, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        x = x >> truncate;
        y = y >> truncate;

        // gradient_shift:
        for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

            G[k] = G[k+1];
        }
        // theta_shift:
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
        // shift_reg:
        for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259+(i<<7)+126];

        // window_x:
//        for(int a = 0; a < 5; a++){
//            // window_y:
//            for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//                img_window[a*5+b] = img_buffer[a*128+b];
//            }
//        }
        img_window[0] = img_buffer[0];
            img_window[1] = img_buffer[1];
            img_window[2] = img_buffer[2];
            img_window[3] = img_buffer[3];
            img_window[4] = img_buffer[4];
            img_window[5] = img_buffer[128];
            img_window[6] = img_buffer[129];
            img_window[7] = img_buffer[130];
            img_window[8] = img_buffer[131];
            img_window[9] = img_buffer[132];
            img_window[10] = img_buffer[256];
            img_window[11] = img_buffer[257];
            img_window[12] = img_buffer[258];
            img_window[13] = img_buffer[259];
            img_window[14] = img_buffer[260];
            img_window[15] = img_buffer[384];
            img_window[16] = img_buffer[385];
            img_window[17] = img_buffer[386];
            img_window[18] = img_buffer[387];
            img_window[19] = img_buffer[388];
            img_window[20] = img_buffer[512];
            img_window[21] = img_buffer[513];
            img_window[22] = img_buffer[514];
            img_window[23] = img_buffer[515];
            img_window[24] = img_buffer[516];
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
        dst[(i<<7) + 126 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);

        ////////////////////////////////////////////////////////////////////////////////////////i==2~125, j==127
        x = 0;
        y = 0;
        // i_kernel_r:
        for(int r = 0, gsr = 0; r< 5; r++, gsr++){
            // kernel_c:
            for(int c = 0, gsc = 0; c < 3; c++, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
            for(int c = 1, gsc = 3; c > -1; c--, gsc++){
#pragma HLS UNROLL

                idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        x = x >> truncate;
        y = y >> truncate;

        // gradient_shift:
        for(int k = 0; k < 258; k++){
#pragma HLS UNROLL

            G[k] = G[k+1];
        }
        // theta_shift:
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
        // shift_reg:
        for(int k = 0; k < 516; k++){
#pragma HLS UNROLL

            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259+(i<<7)+127];

        // window_x:
//        for(int a = 0; a < 5; a++){
//            // window_y:
//            for(int b = 0; b < 5; b++){
//#pragma HLS UNROLL
//
//                img_window[a*5+b] = img_buffer[a*128+b];
//            }
//        }
        img_window[0] = img_buffer[0];
            img_window[1] = img_buffer[1];
            img_window[2] = img_buffer[2];
            img_window[3] = img_buffer[3];
            img_window[4] = img_buffer[4];
            img_window[5] = img_buffer[128];
            img_window[6] = img_buffer[129];
            img_window[7] = img_buffer[130];
            img_window[8] = img_buffer[131];
            img_window[9] = img_buffer[132];
            img_window[10] = img_buffer[256];
            img_window[11] = img_buffer[257];
            img_window[12] = img_buffer[258];
            img_window[13] = img_buffer[259];
            img_window[14] = img_buffer[260];
            img_window[15] = img_buffer[384];
            img_window[16] = img_buffer[385];
            img_window[17] = img_buffer[386];
            img_window[18] = img_buffer[387];
            img_window[19] = img_buffer[388];
            img_window[20] = img_buffer[512];
            img_window[21] = img_buffer[513];
            img_window[22] = img_buffer[514];
            img_window[23] = img_buffer[515];
            img_window[24] = img_buffer[516];
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
        dst[(i<<7) + 127 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    }
    ////////////////////////////////////////////////////////////////////////////////////////i==126, j==0
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 0, gsr = 0; r< 3; r++, gsr++){
        // kernel_c:
        for(int c = 4, gsc = 0; c > 2; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 3, gsr = 3; r> 1; r--, gsr++){
        // kernel_c:
        for(int c = 4, gsc = 0; c > 2; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){

#pragma HLS UNROLL
    	G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){

#pragma HLS UNROLL
    	img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//
//#pragma HLS UNROLL
//        	img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(126<<7) + 0 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    ////////////////////////////////////////////////////////////////////////////////////////i==126, j==1
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 0, gsr = 0; r< 3; r++, gsr++){
        // kernel_c:
        for(int c = 2, gsc = 0; c > 0; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 3, gsr = 3; r> 1; r--, gsr++){
        // kernel_c:
        for(int c = 2, gsc = 0; c > 0; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){

#pragma HLS UNROLL
    	G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){

#pragma HLS UNROLL
    	img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//
//#pragma HLS UNROLL
//        	img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(126<<7) + 1 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    ////////////////////////////////////////////////////////////////////////////////////////i==126, j==2~125
    for(int j = 2; j < 126; j++){
        x = 0;
        y = 0;
        // i_kernel_r:
        for(int r = 0, gsr = 0; r< 3; r++, gsr++){
            // kernel_c:
            for(int c = 0, gsc = 0; c < 5; c++, gsc++){

#pragma HLS UNROLL
 idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        for(int r = 3, gsr = 3; r> 1; r--, gsr++){
            // kernel_c:
            for(int c = 0, gsc = 0; c < 5; c++, gsc++){

#pragma HLS UNROLL
 idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        x = x >> truncate;
        y = y >> truncate;

        // gradient_shift:
        for(int k = 0; k < 258; k++){

#pragma HLS UNROLL
        	G[k] = G[k+1];
        }
        // theta_shift:
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
        // shift_reg:
        for(int k = 0; k < 516; k++){

#pragma HLS UNROLL
        	img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = 0;

        // window_x:
//        for(int a = 0; a < 5; a++){
//            // window_y:
//            for(int b = 0; b < 5; b++){
//
//#pragma HLS UNROLL
// img_window[a*5+b] = img_buffer[a*128+b];
//            }
//        }
        img_window[0] = img_buffer[0];
            img_window[1] = img_buffer[1];
            img_window[2] = img_buffer[2];
            img_window[3] = img_buffer[3];
            img_window[4] = img_buffer[4];
            img_window[5] = img_buffer[128];
            img_window[6] = img_buffer[129];
            img_window[7] = img_buffer[130];
            img_window[8] = img_buffer[131];
            img_window[9] = img_buffer[132];
            img_window[10] = img_buffer[256];
            img_window[11] = img_buffer[257];
            img_window[12] = img_buffer[258];
            img_window[13] = img_buffer[259];
            img_window[14] = img_buffer[260];
            img_window[15] = img_buffer[384];
            img_window[16] = img_buffer[385];
            img_window[17] = img_buffer[386];
            img_window[18] = img_buffer[387];
            img_window[19] = img_buffer[388];
            img_window[20] = img_buffer[512];
            img_window[21] = img_buffer[513];
            img_window[22] = img_buffer[514];
            img_window[23] = img_buffer[515];
            img_window[24] = img_buffer[516];
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
        dst[(126<<7) + j - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    }
    ////////////////////////////////////////////////////////////////////////////////////////i==126, j==126
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 0, gsr = 0; r< 3; r++, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 3, gsc = 3; c > 1; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 3, gsr = 3; r> 1; r--, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 3, gsc = 3; c > 1; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){

#pragma HLS UNROLL
    	G[k] =G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){

#pragma HLS UNROLL
    	img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//
//#pragma HLS UNROLL
//        	img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(126<<7) + 126 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    ////////////////////////////////////////////////////////////////////////////////////////i==126, j==127
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 0, gsr = 0; r< 3; r++, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 1, gsc = 3; c > -1; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 3, gsr = 3; r> 1; r--, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 1, gsc = 3; c > -1; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){

#pragma HLS UNROLL
    	G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){

#pragma HLS UNROLL
    	img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//
//#pragma HLS UNROLL
//        	img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(126<<7) + 127 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    ////////////////////////////////////////////////////////////////////////////////////////i==127, j==0
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 0, gsr = 0; r< 3; r++, gsr++){
        // kernel_c:
        for(int c = 4, gsc = 0; c > 2; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 1, gsr = 3; r> -1; r--, gsr++){
        // kernel_c:
        for(int c = 4, gsc = 0; c > 2; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){

#pragma HLS UNROLL
    	G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){

#pragma HLS UNROLL
    	img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//
//#pragma HLS UNROLL
//        	img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(127<<7) + 0 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    ////////////////////////////////////////////////////////////////////////////////////////i==127, j==1
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 0, gsr = 0; r< 3; r++, gsr++){
        // kernel_c:
        for(int c = 2, gsc = 0; c > 0; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 1, gsr = 3; r> -1; r--, gsr++){
        // kernel_c:
        for(int c = 2, gsc = 0; c > 0; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 2, gsc = 2; c < 5; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){

#pragma HLS UNROLL
    	G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){

#pragma HLS UNROLL
    	img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//
//#pragma HLS UNROLL
//        	img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(127<<7) + 1 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    ////////////////////////////////////////////////////////////////////////////////////////i==127, j==2~125
    for(int j = 2; j < 126; j++){
        x = 0;
        y = 0;
        // i_kernel_r:
        for(int r = 0, gsr = 0; r< 3; r++, gsr++){
            // kernel_c:
            for(int c = 0, gsc = 0; c < 5; c++, gsc++){

#pragma HLS UNROLL
 idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        for(int r = 1, gsr = 3; r> -1; r--, gsr++){
            // kernel_c:
            for(int c = 0, gsc = 0; c < 5; c++, gsc++){

#pragma HLS UNROLL
 idx = r;
                idy = c;
                pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
                pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
                x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
                y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
            }
        }
        x = x >> truncate;
        y = y >> truncate;

        // gradient_shift:
        for(int k = 0; k < 258; k++){

#pragma HLS UNROLL
        	G[k] = G[k+1];
        }
        // theta_shift:
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
        // shift_reg:
        for(int k = 0; k < 516; k++){

#pragma HLS UNROLL
        	img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = 0;

        // window_x:
//        for(int a = 0; a < 5; a++){
//            // window_y:
//            for(int b = 0; b < 5; b++){
//
//#pragma HLS UNROLL
// img_window[a*5+b] = img_buffer[a*128+b];
//            }
//        }
        img_window[0] = img_buffer[0];
            img_window[1] = img_buffer[1];
            img_window[2] = img_buffer[2];
            img_window[3] = img_buffer[3];
            img_window[4] = img_buffer[4];
            img_window[5] = img_buffer[128];
            img_window[6] = img_buffer[129];
            img_window[7] = img_buffer[130];
            img_window[8] = img_buffer[131];
            img_window[9] = img_buffer[132];
            img_window[10] = img_buffer[256];
            img_window[11] = img_buffer[257];
            img_window[12] = img_buffer[258];
            img_window[13] = img_buffer[259];
            img_window[14] = img_buffer[260];
            img_window[15] = img_buffer[384];
            img_window[16] = img_buffer[385];
            img_window[17] = img_buffer[386];
            img_window[18] = img_buffer[387];
            img_window[19] = img_buffer[388];
            img_window[20] = img_buffer[512];
            img_window[21] = img_buffer[513];
            img_window[22] = img_buffer[514];
            img_window[23] = img_buffer[515];
            img_window[24] = img_buffer[516];
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
        dst[(127<<7) + j - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    }
    ////////////////////////////////////////////////////////////////////////////////////////i==127, j==126
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 0, gsr = 0; r< 3; r++, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 3, gsc = 3; c > 1; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 1, gsr = 3; r> -1; r--, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 3, gsc = 3; c > 1; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){

#pragma HLS UNROLL
    	G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){

#pragma HLS UNROLL
    	img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//
//#pragma HLS UNROLL
//        	img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(127<<7) + 126 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);
    ////////////////////////////////////////////////////////////////////////////////////////i==127, j==127
    x = 0;
    y = 0;
    // i_kernel_r:
    for(int r = 0, gsr = 0; r< 3; r++, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 1, gsc = 3; c > -1; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    for(int r = 1, gsr = 3; r> -1; r--, gsr++){
        // kernel_c:
        for(int c = 0, gsc = 0; c < 3; c++, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
        for(int c = 1, gsc = 3; c > -1; c--, gsc++){

#pragma HLS UNROLL
        	idx = r;
            idy = c;
            pos_gauss_sobel_x = ((gsr)<<2) + (gsc+gsr);
            pos_gauss_sobel_y = ((gsc)<<2) + (gsr+gsc);
            x += (gauss_sobel[pos_gauss_sobel_x] * img_window[(idx*5) + idy]);
            y += (gauss_sobel[pos_gauss_sobel_y] * img_window[(idx*5) + idy]);
        }
    }
    x = x >> truncate;
    y = y >> truncate;

    // gradient_shift:
    for(int k = 0; k < 258; k++){

#pragma HLS UNROLL
    	G[k] = G[k+1];
    }
    // theta_shift:
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
    // shift_reg:
    for(int k = 0; k < 516; k++){

#pragma HLS UNROLL
    	img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;

    // window_x:
//    for(int a = 0; a < 5; a++){
//        // window_y:
//        for(int b = 0; b < 5; b++){
//
//#pragma HLS UNROLL
//        	img_window[a*5+b] = img_buffer[a*128+b];
//        }
//    }
    img_window[0] = img_buffer[0];
        img_window[1] = img_buffer[1];
        img_window[2] = img_buffer[2];
        img_window[3] = img_buffer[3];
        img_window[4] = img_buffer[4];
        img_window[5] = img_buffer[128];
        img_window[6] = img_buffer[129];
        img_window[7] = img_buffer[130];
        img_window[8] = img_buffer[131];
        img_window[9] = img_buffer[132];
        img_window[10] = img_buffer[256];
        img_window[11] = img_buffer[257];
        img_window[12] = img_buffer[258];
        img_window[13] = img_buffer[259];
        img_window[14] = img_buffer[260];
        img_window[15] = img_buffer[384];
        img_window[16] = img_buffer[385];
        img_window[17] = img_buffer[386];
        img_window[18] = img_buffer[387];
        img_window[19] = img_buffer[388];
        img_window[20] = img_buffer[512];
        img_window[21] = img_buffer[513];
        img_window[22] = img_buffer[514];
        img_window[23] = img_buffer[515];
        img_window[24] = img_buffer[516];
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
    dst[(127<<7) + 127 - 129] = (sup >= (25600))? 255 : ((sup > (3600))? 127 : 0);


    rest_result:
    for(int i = 16255; i < 16384; i++){
        rest_G_shift:
        for(int k = 0; k < 258; k++){
            G[k] = G[k+1];
        }
        rest_theta_shift:
        for(int k = 0; k < 129; k++){
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
