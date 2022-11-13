#include <iostream>
//#include <cmath>
 #include "hls_math.h"
 using namespace hls;

using namespace std;

#include "canny.h"



void canny(DTYPE* src, DTYPE* dst, int upperThresh, int lowerThresh)
{
//#pragma HLS PIPELINE II=1
//#pragma HLS DATAFLOW
//#pragma HLS UNROLL

    //Write your code here
//    float  gaussian_kernel[3][3] = {{0.09474166, 0.11831801, 0.09474166}, {0.11831801, 0.14776132, 0.11831801}, {0.09474166, 0.11831801, 0.09474166}};
//    int x_sobel[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}}, y_sobel[3][3] = {{-1, -2, -1}, {0, 0, 0}, {1, 2, 1}};
//	float  gaussian_kernel[9] = {0.09474166, 0.11831801, 0.09474166, 0.11831801, 0.14776132, 0.11831801, 0.09474166, 0.11831801, 0.09474166};
//	int x_sobel[9] = {-1, 0, 1, -2, 0, 2, -1, 0, 1}, y_sobel[9] = {-1, -2, -1, 0, 0, 0, 1, 2, 1};

	float gauss_sobel_x[49] = {0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,
			0.0 ,-0.09474166 ,-0.118318014 ,0.0 ,0.118318014 ,0.09474166 ,
			0.0 ,0.0 ,-0.30780134 ,-0.38439733 ,0.0 ,0.38439733 ,0.30780134 ,
			0.0 ,0.0 ,-0.42611933 ,-0.5321587 ,0.0 ,0.5321587 ,0.42611933 ,
			0.0 ,0.0 ,-0.30780134 ,-0.38439733 ,0.0 ,0.38439733 ,0.30780134 ,
			0.0 ,0.0 ,-0.09474166 ,-0.118318014 ,0.0 ,0.118318014 ,0.09474166 ,
			0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.0};
	float gauss_sobel_y[49] = {0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,
			0.0 ,-0.09474166 ,-0.30780134 ,-0.42611933 ,-0.30780134 ,-0.09474166 ,0.0 ,
			0.0 ,-0.118318014 ,-0.38439733 ,-0.5321587 ,-0.38439733 ,-0.118318014 ,0.0 ,
			0.0 ,0.0 ,0.0 ,0.0 ,-7.450581e-09 ,0.0 ,0.0 ,
			0.0 ,0.118318014 ,0.38439733 ,0.5321587 ,0.38439733 ,0.118318014 ,0.0 ,
			0.0 ,0.09474166 ,0.30780134 ,0.42611933 ,0.30780134 ,0.09474166 ,0.0 ,
			0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.0};

    DTYPE img[16384];//reduce this buffer size

    float blurred[16384] = {0}, G[16384] = {0}, theta[16384] = {0};//reduce buffer size

//read image
    for(int i = 0; i < 16384; i++){
    	img[i] = src[i];
    }

// Gaussian filter
//    Gaussian_filter_x: for(int i = 0; i < 128; i++){
//    	Gaussian_filter_y: for(int j = 0; j < 128; j++){
//
//	        blurred[i*128 + j] = 0;
//            Gaussian_kernel_x: for(int r = -1; r < 2; r++){
//            	Gaussian_kernel_y: for(int c = -1; c < 2; c++){
//                    int idx_x = (i+r < 0)? 1 : ((i+r > 127)? 126 : i+r);
//                    int idx_y = (j+c < 0)? 1 : ((j+c > 127)? 126 : j+c);
////                    blurred[i][j] += gaussian_kernel[r+1][c+1] * src[idx_x*128 + idx_y];
//                    blurred[i*128 + j] += gaussian_kernel[(r+1)*3 + c+1] * img[idx_x*128 + idx_y];
//                }
//            }
//        }
//    }

//x and y axis sobel filter
    Sobel_filter_x: for(int i = 0; i < 128; i++){
    	Sobel_filter_y: for(int j = 0; j < 128; j++){

	        float blur_x = 0;
            float blur_y = 0;
            Sobel_kernel_x: for(int r = -3; r < 4; r++){
            	Sobel_kernel_y: for(int c = -3; c < 4; c++){
                    int idx_x = (i+r < 0)? 1 : ((i+r > 127)? 126 : i+r);
                    int idx_y = (j+c < 0)? 1 : ((j+c > 127)? 126 : j+c);
                    blur_x += gauss_sobel_x[(r+3)*7 + c+3] * img[idx_x*128 + idx_y];
                    blur_y += gauss_sobel_y[(r+3)*7 + c+3] * img[idx_x*128 + idx_y];
                }
            }
            G[i*128 + j] = hls::sqrt(blur_x*blur_x + blur_y*blur_y);
            theta[i*128 + j] = hls::atan2(blur_y, blur_x);

        }
    }
    
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
