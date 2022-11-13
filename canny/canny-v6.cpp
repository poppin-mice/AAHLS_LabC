#include <iostream>
#include <cmath>
// #include "hls_math.h"
// using namespace hls;

using namespace std;

#include "canny.h"


void canny(DTYPE* src, DTYPE* dst, int upperThresh, int lowerThresh)
{
    // float gauss_sobel_coef[6] = {0.5321587 ,0.42611933 ,0.38439733 ,0.30780134 ,0.118318014 ,0.09474166};
    float gauss_sobel[25] = {-0.09474166 ,-0.118318014 ,0.0 ,0.118318014 ,0.09474166 ,
				-0.30780134 ,-0.38439733 ,0.0 ,0.38439733 ,0.30780134 ,
				-0.42611933 ,-0.5321587 ,0.0 ,0.5321587 ,0.42611933 ,
				-0.30780134 ,-0.38439733 ,0.0 ,0.38439733 ,0.30780134 ,
				-0.09474166 ,-0.118318014 ,0.0 ,0.118318014 ,0.09474166};
    // DTYPE img[16384];//reduce this buffer size
    // DTYPE img[16384];//reduce this buffer size
    DTYPE img_buffer[640];//128*5
    
    
    float blurred[16384] = {0}, G[16384], theta[16384];//reduce buffer size
    // float G_gold[16384] = {0}, theta_gold[16384] = {0};//reduce buffer size
    float x, y;
    int idx, idy, offset_r, offset_c, neg_x, neg_y;
//read image

    // for(int i = 0; i < 128; i++){
    //     for(int j = 0; j < 128; j++){
    //         img[i*128+j] = src[i*128+j];
    //     }
    // }

    read_img:
    for(int i = 0; i < 382; i++){
        read_shift:
        for(int k = 0; k < 639; k++){
            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[639] = src[i];
    }
//all condition in one loop
    idx:
    for(int i = 0; i < 128; i++){
        idy:
        for(int j = 0; j < 128; j++){
            x = 0;
            y = 0;
            kernel_r:
            for(int r = -2; r < 3; r++){
                kernel_c:
                for(int c = -2; c < 3; c++){
                    if(i+r < 0){
                        idx = 2-2*i-r;
                    }
                    else if(i+r > 127){
                        idx = 256-2*i-r;
                    }
                    else{
                        idx = r+2;
                    }
                    if(j+c < 0){
                        idy = 2-2*j-c;
                    }
                    else if(j+c > 127){
                        idy = 256-2*j-c;
                    }
                    else{
                        idy = c+2;
                    }
                    x += gauss_sobel[(r+2)*5 + (c+2)] * img_buffer[(idx<<7) + idy];
                    y += gauss_sobel[(c+2)*5 + (r+2)] * img_buffer[(idx<<7) + idy];
                }
            }
            //gradient and theta
            G[i*128+j] = sqrt(x*x + y*y);
            theta[i*128+j] = atan2(y, x);//can be simplified
            //shifting register
            shift_reg:
            for(int k = 0; k < 639; k++){
                img_buffer[k] = img_buffer[k+1];
            }
            img_buffer[639] = src[382+i*128+j];
        }
    }

    

    // Sobel_filter_x: for(int i = 0; i < 128; i++){
    //     Sobel_filter_y: for(int j = 0; j < 128; j++){

    //         float blur_x = 0;
    //         float blur_y = 0;
    //         Sobel_kernel_x: for(int r = -2; r < 3; r++){
    //             Sobel_kernel_y: for(int c = -2; c < 3; c++){
    //                 int idx_x = (i+r < 0)? 1 : ((i+r > 127)? 126 : i+r);
    //                 int idx_y = (j+c < 0)? 1 : ((j+c > 127)? 126 : j+c);
    //                 blur_x += gauss_sobel[(r+2)*5 + c+2] * img[idx_x*128 + idx_y];
    //                 blur_y += gauss_sobel[(c+2)*5 + r+2] * img[idx_x*128 + idx_y];
    //             }
    //         }
    //         G_gold[i*128 + j]     = sqrt(blur_x*blur_x + blur_y*blur_y);
    //         theta_gold[i*128 + j] = atan2(blur_y, blur_x);
    //         // G[i*128 + j]     = sqrt(blur_x*blur_x + blur_y*blur_y);
    //         // theta[i*128 + j] = atan2(blur_y, blur_x);
    
    //     }
    // }
    // for(int j = 0; j < 128; j++){
    //     cout << G[1*128 + j] << "\t" << G_gold[1*128 + j] << endl;
    // }

//Non maximum suppression
    NonMaxSup_x: for(int i = 0; i < 128; i++){
    	NonMaxSup_y: for(int j = 0; j < 128; j++){
            if(theta[i*128 + j] < 0) theta[i*128 + j] += 3.1415926535;
            float q = 255.0; float r = 255.0;
            if(theta[i*128 + j] <= 1.963495){//0~112.5 degree
                if(theta[i*128 + j] <= 1.178097){//0~67.5 degree
                    if(theta[i*128 + j] <= 0.392699){//0~22.5 degree
                        q = G[i*128 + j+1];
                        r = G[i*128 + j-1];
                    }
                    else{//22.5~67.5 degree
                        q = G[(i+1)*128 + j+1];
                        r = G[(i-1)*128 + j-1];
                    }
                }
                else{//67.5~112.5
                    q = G[(i+1)*128 + j];
                    r = G[(i-1)*128 + j];
                }
            }
            else{//112.5~180 degree
                if(theta[i*128 + j] <= 2.748893){//112.5~157.5
                    q = G[(i-1)*128 + j+1];
                    r = G[(i+1)*128 + j-1];
                }
                else{//157.5~180 degree
                    q = G[i*128 + j+1];
                    r = G[i*128 + j-1];
                }
            }

            int sup = (G[i*128 + j] >= q && G[i*128 + j] >= r)? (int)G[i*128 + j] : 0;
            dst[(i<<7) + j] = (sup >= upperThresh)? 255 : ((sup > lowerThresh)? 127 : 0);
        }
    }


}
