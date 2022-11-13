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
    DTYPE img_buffer[517];//128*4+5
    
    
    float blurred[16384] = {0}, G[16384], theta[16384];//reduce buffer size
    // float G_gold[16384] = {0}, theta_gold[16384] = {0};//reduce buffer size
    float x, y;
    int idx, idy, offset_r, offset_c, neg_x, neg_y;
//read image
    read_img:
    for(int i = 0; i < 259; i++){//128*2+3
        img_buffer[i+258] = src[i];
    }

//all condition in one loop
    
    for(int i = 0; i < 128; i++){
        for(int j = 0; j < 128; j++){
            x = 0;
            y = 0;
            if((i==0&&j==0)||(i==0&&j==127)||(i==127&&j==0)||(i==127&&j==127)){//top left/right corner 
            }
            else if(i==0&&j==1){//(0,1)
                neg_x = 1; 
                neg_y = 1;
                offset_r = 2; 
                offset_c = 1;
            }
            else if(i==0&&j==126){//(0,126)
                neg_x = 1; 
                neg_y = -1;
                offset_r = 2; 
                offset_c = 3;
            }
            else if(i==0){//upper edge
                neg_x = 1; 
                neg_y = 1;
                offset_r = 2; 
                offset_c = 0;
            }            
            else if(i==1&&j==0){//(1,0)
                neg_x = 1; 
                neg_y = 1;
                offset_r = 1; 
                offset_c = 2;
            }
            else if(i==1&&j==1){//(1,1)
                neg_x = 1; 
                neg_y = 1;
                offset_r = 1; 
                offset_c = 1;
            }
            else if(i==1&&j==126){//(1,126)
                neg_x = 1; 
                neg_y = -1;
                offset_r = 1; 
                offset_c = 3;
            }
            else if(i==1&&j==127){//(1,127)
                neg_x = 1; 
                neg_y = -1;
                offset_r = 1; 
                offset_c = 4;
            }
            else if(i==1){//(upper-1 edge)
                neg_x = 1; 
                neg_y = 1;
                offset_r = 1; 
                offset_c = 0;
            }
            else if(i==126&&j==0){//(126,0)
                neg_x = -1; 
                neg_y = 1;
                offset_r = 3; 
                offset_c = 2;
            }
            else if(i==126&&j==1){//(126,1)
                neg_x = -1; 
                neg_y = 1;
                offset_r = 3; 
                offset_c = 1;
            }
            else if(i==126&&j==126){//(126,126)
                neg_x = -1; 
                neg_y = -1;
                offset_r = 3; 
                offset_c = 3;
            }
            else if(i==126&&j==127){//(126,127)
                neg_x = -1; 
                neg_y = -1;
                offset_r = 3; 
                offset_c = 2;
            }
            else if(i==126){//bottom+1 edge
                neg_x = -1; 
                neg_y = 1;
                offset_r = 3; 
                offset_c = 0;
            }
            else if(i==127&&j==1){//(127,1)
                neg_x = -1; 
                neg_y = 1;
                offset_r = 2; 
                offset_c = 1;
            }
            else if(i==127&&j==126){//(127,126)
                neg_x = -1; 
                neg_y = -1;
                offset_r = 2; 
                offset_c = 3;
            }
            else if(i==127){//(bottom edge)
                neg_x = -1; 
                neg_y = 1;
                offset_r = 2; 
                offset_c = 0;
            }
            else if(j==0){//left edge
                neg_x = 1; 
                neg_y = 1;
                offset_r = 0; 
                offset_c = 2;
            }
            else if(j==1){//left+1 edge
                neg_x = 1; 
                neg_y = 1;
                offset_r = 0; 
                offset_c = 1;
            }
            else if(j==126){//right-1 edge
                neg_x = 1; 
                neg_y = -1;
                offset_r = 0; 
                offset_c = 3;
            }
            else if(j==127){//right edge
                neg_x = 1; 
                neg_y = -1;
                offset_r = 0; 
                offset_c = 2;
            }
            else{//normal range
                neg_x = 1; 
                neg_y = 1;
                offset_r = 0; 
                offset_c = 0;
            }
            for(int r = 0; r < 5; r++){
                for(int c = 0; c < 5; c++){
                    x += gauss_sobel[r*5 + c] * img_buffer[((neg_x*(abs(r-offset_r))+offset_r)*128) + (neg_y*(abs(c-offset_c))+offset_c)];
                    y += gauss_sobel[c*5 + r] * img_buffer[((neg_x*(abs(r-offset_r))+offset_r)*128) + (neg_y*(abs(c-offset_c))+offset_c)];
                }
            }
            //gradient and theta
            G[i*128+j] = sqrt(x*x + y*y);
            theta[i*128+j] = atan2(y, x);//can be simplified
            //shifting register
            shift_reg:
            for(int k = 0; k < 516; k++){
                img_buffer[k] = img_buffer[k+1];
            }
            img_buffer[516] = src[259+i*128+j];//condition can be simplified
            //NMS processing
            
        }
    }

//x and y axis sobel filter
    // Sobel_filter_x: for(int i = 0; i < 128; i++){
    // 	Sobel_filter_y: for(int j = 0; j < 128; j++){

	//         float blur_x = 0;
    //         float blur_y = 0;
    //         Sobel_kernel_x: for(int r = -2; r < 3; r++){
    //         	Sobel_kernel_y: for(int c = -2; c < 3; c++){
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
    //     cout << G[0*128 + j] << "\t" << G_gold[0*128 + j] << endl;
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
