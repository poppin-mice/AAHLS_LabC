#include <iostream>
#include <cmath>
// #include "hls_math.h"
// using namespace hls;

using namespace std;

#include "canny.h"



void canny(DTYPE* src, DTYPE* dst, int upperThresh, int lowerThresh)
{
    //Write your code here
    float  gaussian_kernel[3][3] = {{0.09474166, 0.11831801, 0.09474166}, {0.11831801, 0.14776132, 0.11831801}, {0.09474166, 0.11831801, 0.09474166}};
    int x_sobel[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}},
        y_sobel[3][3] = {{-1, -2, -1}, {0, 0, 0}, {1, 2, 1}};
    
    DTYPE img[128][128], canny[128][128] = {{0}}, sup[128][128] = {{0}};
    float blurred[128][128] = {{0}}, blur_x[128][128] = {{0}}, blur_y[128][128] = {{0}}, G[128][128] = {{0}}, theta[128][128] = {{0}};

//read image
    for(int i = 0; i < 128; i++){
        for(int j = 0; j < 128; j++){
            img[i][j] = src[i*128 + j];
        }
    }

// Gaussian filter
    for(int i = 0; i < 128; i++){
        for(int j = 0; j < 128; j++){
	        blurred[i][j] = 0;
            for(int r = -1; r < 2; r++){
                for(int c = -1; c < 2; c++){
                    int idx_x = (i+r < 0)? 1 : ((i+r > 127)? 126 : i+r);
                    int idx_y = (j+c < 0)? 1 : ((j+c > 127)? 126 : j+c);
                    blurred[i][j] += gaussian_kernel[r+1][c+1] * img[idx_x][idx_y];
                }
            }
        }
    }

//x axis sobel filter
    for(int i = 0; i < 128; i++){
        for(int j = 0; j < 128; j++){
	        blur_x[i][j] = 0;
            for(int r = -1; r < 2; r++){
                for(int c = -1; c < 2; c++){
                    int idx_x = (i+r < 0)? 1 : ((i+r > 127)? 126 : i+r);
                    int idx_y = (j+c < 0)? 1 : ((j+c > 127)? 126 : j+c);
                    blur_x[i][j] += x_sobel[r+1][c+1] * blurred[idx_x][idx_y];
                }
            }
        }
    }

//y axis soble filter
    for(int i = 0; i < 128; i++){
        for(int j = 0; j < 128; j++){
	        blur_y[i][j] = 0;
            for(int r = -1; r < 2; r++){
                for(int c = -1; c < 2; c++){
                    int idx_x = (i+r < 0)? 1 : ((i+r > 127)? 126 : i+r);
                    int idx_y = (j+c < 0)? 1 : ((j+c > 127)? 126 : j+c);
                    blur_y[i][j] += y_sobel[r+1][c+1] * blurred[idx_x][idx_y];
                }
            }
        }
    }

// Gradient and angle
    for(int i = 0; i < 128; i++){
        for(int j = 0; j < 128; j++){
            G[i][j] = sqrt(blur_x[i][j]*blur_x[i][j] + blur_y[i][j]*blur_y[i][j]);
            theta[i][j] = atan2(blur_y[i][j], blur_x[i][j]);
        }
    }

//Non maximum suppression
    for(int i = 1; i < 127; i++){
        for(int j = 1; j < 127; j++){
            if(theta[i][j] < 0) theta[i][j] += 3.1415926535;
            float q = 255.0; float r = 255.0;
            if(theta[i][j] <= 1.963495){//0~112.5 degree
                if(theta[i][j] <= 1.178097){//0~67.5 degree
                    if(theta[i][j] <= 0.392699){//0~22.5 degree
                        q = G[i][j+1];
                        r = G[i][j-1];
                    }
                    else{//22.5~67.5 degree
                        q = G[i+1][j+1];
                        r = G[i-1][j-1];
                    }
                }
                else{//67.5~112.5
                    q = G[i+1][j];
                    r = G[i-1][j];
                }
            }
            else{//112.5~180 degree
                if(theta[i][j] <= 2.748893){//112.5~157.5
                    q = G[i-1][j+1];
                    r = G[i+1][j-1];
                }
                else{//157.5~180 degree
                    q = G[i][j+1];
                    r = G[i][j-1];
                }
            }

            sup[i][j] = (G[i][j] >= q && G[i][j] >= r)? (int)G[i][j] : 0;
        }
    }

//thresholding
    for(int i = 0; i < 128; i++){
        for(int j = 0; j < 128; j++){
            dst[i*128 + j] = (sup[i][j] >= upperThresh)? 255 : ((sup[i][j] > lowerThresh)? 127 : 0);
        }
    }
}
