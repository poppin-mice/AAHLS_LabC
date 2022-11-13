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
    float G[384], theta[255], current_theta;
    
    // float blurred[16384] = {0}, G[16384], theta[16384];//reduce buffer size
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
            // G[i*128+j] = sqrt(x*x + y*y);
            // theta[i*128+j] = atan(y / x);//can be simplified
            gradient_theta_shift:
            for(int k = 0; k < 383; k++){
                G[k] = G[k+1];
                // theta[k] = theta[k+1];
            }
            for(int k = 0; k < 254; k++){
                theta[k] = theta[k+1];
            }
            G[383] = sqrt(x*x + y*y);
            theta[254] = atan2(y, x);
            current_theta = atan2(y,x);
            //shifting register
            shift_reg:
            for(int k = 0; k < 639; k++){
                img_buffer[k] = img_buffer[k+1];
            }
            img_buffer[639] = src[382+i*128+j];

            //NMS (starts when input >= 130)
            
            if(theta[0] < 0) theta[0] += 3.1415926535;
            float q = 255.0; float r = 255.0;
            if(theta[0] <= 1.963495){
                if(theta[0] <= 1.178097){
                    if(theta[0] <= 0.392699){
                        q = G[128 + 2];
                        r = G[128 + 0];
                    }
                    else{
                        q = G[256 + 2];
                        r = G[0 + 0];
                    }
                }
                else{
                    q = G[256 + 1];
                    r = G[0 + 1];
                }
            }
            else{
                if(theta[0] <= 2.748893){
                    q = G[0 + 2];
                    r = G[256 + 0];
                }
                else{
                    q = G[128 + 2];
                    r = G[128 + 0];
                }
            }

            int sup = (G[128 + 1] >= q && G[128 + 1] >= r)? (int)G[128 + 1] : 0;
            if(i*128 + j >= 254){    
                dst[(i<<7) + j - 254] = (sup >= upperThresh)? 255 : ((sup > lowerThresh)? 127 : 0);
            }
        }
    }

    for(int i = 16384-254; i < 16384; i++){
        for(int k = 0; k < 383; k++){
            G[k] = G[k+1];
            // theta[k] = theta[k+1];
        }
        for(int k = 0; k < 254; k++){
            theta[k] = theta[k+1];
        }
        G[383] = 0;
        theta[254] = 0;

        if(theta[0] < 0) theta[0] += 3.1415926535;
            float q = 255.0; float r = 255.0;
            if(theta[0] <= 1.963495){
                if(theta[0] <= 1.178097){
                    if(theta[0] <= 0.392699){
                        q = G[128 + 2];
                        r = G[128 + 0];
                    }
                    else{
                        q = G[256 + 2];
                        r = G[0 + 0];
                    }
                }
                else{
                    q = G[256 + 1];
                    r = G[0 + 1];
                }
            }
            else{
                if(theta[0] <= 2.748893){
                    q = G[0 + 2];
                    r = G[256 + 0];
                }
                else{
                    q = G[128 + 2];
                    r = G[128 + 0];
                }
            }

            int sup = (G[128 + 1] >= q && G[128 + 1] >= r)? (int)G[128 + 1] : 0;
            dst[i] = (sup >= upperThresh)? 255 : ((sup > lowerThresh)? 127 : 0);
    }
}
