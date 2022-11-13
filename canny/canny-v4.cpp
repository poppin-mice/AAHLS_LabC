#include <iostream>
#include <cmath>
// #include "hls_math.h"
// using namespace hls;

using namespace std;

#include "canny.h"


void canny(DTYPE* src, DTYPE* dst, int upperThresh, int lowerThresh)
{
	float gauss_sobel_x[25] = {-0.09474166 ,-0.118318014 ,0.0 ,0.118318014 ,0.09474166 ,
				-0.30780134 ,-0.38439733 ,0.0 ,0.38439733 ,0.30780134 ,
				-0.42611933 ,-0.5321587 ,0.0 ,0.5321587 ,0.42611933 ,
				-0.30780134 ,-0.38439733 ,0.0 ,0.38439733 ,0.30780134 ,
				-0.09474166 ,-0.118318014 ,0.0 ,0.118318014 ,0.09474166};
	float gauss_sobel_y[25] = {-0.09474166 ,-0.30780134 ,-0.42611933 ,-0.30780134 ,-0.09474166,
			-0.118318014 ,-0.38439733 ,-0.5321587 ,-0.38439733 ,-0.118318014 ,
			0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,
			0.118318014 ,0.38439733 ,0.5321587 ,0.38439733 ,0.118318014 ,
			0.09474166 ,0.30780134 ,0.42611933 ,0.30780134 ,0.09474166};

    // float gauss_sobel_coef[6] = {0.5321587 ,0.42611933 ,0.38439733 ,0.30780134 ,0.118318014 ,0.09474166};
    float gauss_sobel[25] = {-0.09474166 ,-0.118318014 ,0.0 ,0.118318014 ,0.09474166 ,
				-0.30780134 ,-0.38439733 ,0.0 ,0.38439733 ,0.30780134 ,
				-0.42611933 ,-0.5321587 ,0.0 ,0.5321587 ,0.42611933 ,
				-0.30780134 ,-0.38439733 ,0.0 ,0.38439733 ,0.30780134 ,
				-0.09474166 ,-0.118318014 ,0.0 ,0.118318014 ,0.09474166};
    // DTYPE img[16384];//reduce this buffer size
    DTYPE img[16384];//reduce this buffer size
    DTYPE img_buffer[512+5];//128*4+5
    float x, y;

    float blurred[16384] = {0}, G[16384], theta[16384];//reduce buffer size
    float G_gold[16384] = {0}, theta_gold[16384] = {0};//reduce buffer size

//read image
    for(int i = 0; i < 260; i++){//128*2+3
        img_buffer[i+257] = src[i];
    }
    for(int i = 0; i < 128; i++){
        for(int j = 0; j < 128; j++){
            img[i*128 + j] = src[i*128 + j];
        }
    }
    // for(int i = 0; i < 5; i++){
    //     for(int j = 0; j < 128; j++){
    //         if(i*128+j == 517) break;
    //         cout << img_buffer[i*128+j] << " ";
    //     }
    //     cout << endl;
    // }
//all condition in one loop
    // for(int i = 0; i < 128; i++){
    //     for(int j = 0; j < 128; j++){
    //         int x = 0;
    //         int y = 0;
    //         if(i==0 && (j==0 || j == 127)){//top left/right corner 
    //             continue;
    //         }
    //         else if(i == 0){//top edge
    //             x = img_buffer[]                
    //         }
    //         //shifting register
    //         for(int k = 0; k < 516; k++){
    //             img_buffer[k] = img_buffer[k+1];
    //         }
    //         img_buffer[516] = (258 + i*128 + j > 16384)? 0 : src[258 + i*128 + j];//condition can be simplify
    //         //NMS processing
            
    //     }
    // }

//top left+1 corner (0,1)
    // cout << "3*3" << endl;
    x = 0;
    y = 0;
    for(int r = -2; r < 3; r++){    
        for(int c = -1; c < 4; c++){
            x += gauss_sobel[(r+2)*5 + c+1] * img_buffer[(abs(r)+2)*128 + (abs(c)+1)];
            y += gauss_sobel[(c+1)*5 + r+2] * img_buffer[(abs(r)+2)*128 + (abs(c)+1)];
            // cout << gauss_sobel[(r+2)*5 + c+1] << "\t" << gauss_sobel[(c+1)*5 + r+2] << endl;
        }
    }
    // cout << "x: " << x << endl;
    // cout << "y: " << y << endl;
    G[1] = sqrt(x*x + y*y);
    theta[1] = atan2(y, x);//can be simplified
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259+1];//condition can be simplified
    // cout << "end plot" << endl;


//upper edge (0,2:125)
    for(int j = 2; j < 126; j++){
        x = 0;
        y = 0;
        for(int r = -2; r < 3; r++){
            for(int c = 0; c < 5;c++){
                x += gauss_sobel[(r+2)*5 + c] * img_buffer[(abs(r)+2)*128 + c];
                y += gauss_sobel[(c)*5 + r+2] * img_buffer[(abs(r)+2)*128 + c];
            }
        }
        G[j] = sqrt(x*x + y*y);
        theta[j] = atan2(y, x);
        //shifting register
        for(int k = 0; k < 516; k++){
            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259 + j];//condition can be simplified
    }

//top right-1 corner (0,126)
    x = 0;
    y = 0;
    for(int r = -2; r < 3; r++){
        for(int c = -3; c < 2; c++){
            x += gauss_sobel[(r+2)*5 + c+3] * img_buffer[(abs(r)+2)*128 + (-abs(c)+3)];
            y += gauss_sobel[(c+3)*5 + r+2] * img_buffer[(abs(r)+2)*128 + (-abs(c)+3)];
        }
    }
    G[126] = sqrt(x*x + y*y);
    theta[126] = atan2(y, x);
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259+126];//condition can be simplified

//top-1 left corner (1,1)
    x = 0;
    y = 0;
    for(int r = -1; r < 4; r++){
        for(int c = -1; c < 4; c++){
            x += gauss_sobel[(r+1)*5 + c+1] * img_buffer[(abs(r)+1)*128 + (abs(c)+1)];
            y += gauss_sobel[(c+1)*5 + r+1] * img_buffer[(abs(r)+1)*128 + (abs(c)+1)];
        }
    }
    G[129] = sqrt(x*x + y*y);
    theta[129] = atan2(y, x);//can be simplified
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259 + 128 + 1];//condition can be simplified

//upper-1 edge (1,2:125)
    for(int j = 2; j < 126; j++){
        x = 0;
        y = 0;
        for(int r = -1; r < 4; r++){
            for(int c = 0; c < 5;c++){
                x += gauss_sobel[(r+1)*5 + c] * img_buffer[(abs(r)+1)*128 + c];
                y += gauss_sobel[(c)*5 + r+1] * img_buffer[(abs(r)+1)*128 + c];
            }
        }
        G[128+j] = sqrt(x*x + y*y);
        theta[128+j] = atan2(y, x);
        //shifting register
        for(int k = 0; k < 516; k++){
            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259 + 128 + j];//condition can be simplified
    }

//top-1 right corner (1,126)
    x = 0;
    y = 0;
    for(int r = -1; r < 4; r++){
        for(int c = -3; c < 2; c++){
            x += gauss_sobel[(r+1)*5 + c+3] * img_buffer[(abs(r)+1)*128 + (-abs(c)+3)];
            y += gauss_sobel[(c+3)*5 + r+1] * img_buffer[(abs(r)+1)*128 + (-abs(c)+3)];
        }
    }
    G[128+126] = sqrt(x*x + y*y);
    theta[128+126] = atan2(y, x);//can be simplified
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259 + 128 + 126];//condition can be simplified

// top-1 right-1 corner (1,127)
    x = 0;
    y = 0;
    for(int r = -1; r < 4; r++){
        for(int c = -4; c < 1; c++){
            x += gauss_sobel[(r+1)*5 + c+4] * img_buffer[(abs(r)+1)*128 + (-abs(c)+4)];
            y += gauss_sobel[(c+4)*5 + r+1] * img_buffer[(abs(r)+1)*128 + (-abs(c)+4)];
        }
    }
    G[128+127] = sqrt(x*x + y*y);
    theta[128+127] = atan2(y, x);//can be simplified
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = src[259 + 128 + 127];//condition can be simplified

//normal range (except brgin and end) (2:125, 0:127)
    for(int i = 2; i < 126; i++){
        //j==0
        x = 0;
        y = 0;
        for(int r = 0; r < 5; r++){
            for(int c = -2; c < 3; c++){
                x += gauss_sobel[(r)*5 + c+2] * img_buffer[(abs(r))*128 + (abs(c)+2)];
                y += gauss_sobel[(c+2)*5 + r] * img_buffer[(abs(r))*128 + (abs(c)+2)];
            }
        }
        G[i*128] = sqrt(x*x + y*y);
        theta[i*128] = atan2(y, x);//can be simplified
        //shifting register
        for(int k = 0; k < 516; k++){
            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259 + i*128];//condition can be simplified

        //j==1
        x = 0;
        y = 0;
        for(int r = 0; r < 5; r++){
            for(int c = -1; c < 4; c++){
                x += gauss_sobel[(r)*5 + c+1] * img_buffer[(abs(r))*128 + (abs(c)+1)];
                y += gauss_sobel[(c+1)*5 + r] * img_buffer[(abs(r))*128 + (abs(c)+1)];
            }
        }
        G[i*128+1] = sqrt(x*x + y*y);
        theta[i*128+1] = atan2(y, x);//can be simplified
        //shifting register
        for(int k = 0; k < 516; k++){
            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259 + i*128 + 1];//condition can be simplified

        for(int j = 2; j < 126; j++){
            x = 0;
            y = 0;
            for(int r = 0; r < 5; r++){
                for(int c = 0; c < 5; c++){
                    x += gauss_sobel[(r)*5 + c] * img_buffer[r*128 + c];
                    y += gauss_sobel[(c)*5 + r] * img_buffer[r*128 + c];
                }
            }
            G[i*128+j] = sqrt(x*x + y*y);
            theta[i*128+j] = atan2(y, x);//can be simplified
            //shifting register
            for(int k = 0; k < 516; k++){
                img_buffer[k] = img_buffer[k+1];
            }
            img_buffer[516] = src[259 + i*128 + j];//condition can be simplified
        }

        //j==126
        x = 0;
        y = 0;
        for(int r = 0; r < 5; r++){
            for(int c = -3; c < 2; c++){
                x += gauss_sobel[(r)*5 + c+3] * img_buffer[(abs(r))*128 + (-abs(c)+3)];
                y += gauss_sobel[(c+3)*5 + r] * img_buffer[(abs(r))*128 + (-abs(c)+3)];
            }
        }
        G[i*128+126] = sqrt(x*x + y*y);
        theta[i*128+126] = atan2(y, x);//can be simplified
        //shifting register
        for(int k = 0; k < 516; k++){
            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259 + i*128 + 126];//condition can be simplified
        //j==127
        x = 0;
        y = 0;
        for(int r = 0; r < 5; r++){
            for(int c = -2; c < 3; c++){
                x += gauss_sobel[(r)*5 + c+2] * img_buffer[(abs(r))*128 + (-abs(c)+2)];
                y += gauss_sobel[(c+2)*5 + r] * img_buffer[(abs(r))*128 + (-abs(c)+2)];
            }
        }
        G[i*128+127] = sqrt(x*x + y*y);
        theta[i*128+127] = atan2(y, x);//can be simplified
        //shifting register
        for(int k = 0; k < 516; k++){
            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = src[259 + i*128 + 127];//condition can be simplified

    }

//bottom+1 left corner (126, 0)
    x = 0;
    y = 0;
    for(int r = -3; r < 2; r++){
        for(int c = -2; c < 3;c++){
            x += gauss_sobel[(r+3)*5 + c+2] * img_buffer[(-abs(r)+3)*128 + (abs(c)+2)];
            y += gauss_sobel[(c+2)*5 + r+3] * img_buffer[(-abs(r)+3)*128 + (abs(c)+2)];
        }
    }
    G[126*128] = sqrt(x*x + y*y);
    theta[126*128] = atan2(y, x);//can be simplified
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;//src[259 + 126*128];//condition can be simplified
    
//bottom+1 left+1 corner (126,1)
    x = 0;
    y = 0;
    for(int r = -3; r < 2; r++){
        for(int c = -1; c < 4;c++){
            x += gauss_sobel[(r+3)*5 + c+1] * img_buffer[(-abs(r)+3)*128 + (abs(c)+1)];
            y += gauss_sobel[(c+1)*5 + r+3] * img_buffer[(-abs(r)+3)*128 + (abs(c)+1)];
        }
    }
    G[126*128+1] = sqrt(x*x + y*y);
    theta[126*128+1] = atan2(y, x);//can be simplified
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;//src[259 + 126*128 + 1];//condition can be simplified

//bottom+1 edge (126, 2:125)
    for(int j = 2; j < 126; j++){
        x = 0;
        y = 0;
        for(int r = -3; r < 2; r++){
            for(int c = 0; c < 5;c++){
                x += gauss_sobel[(r+3)*5 + c] * img_buffer[(-abs(r)+3)*128 + c];
                y += gauss_sobel[(c)*5 + r+3] * img_buffer[(-abs(r)+3)*128 + c];
            }
        }
        G[126*128+j] = sqrt(x*x + y*y);
        theta[126*128+j] = atan2(y, x);//can be simplified
        //shifting register
        for(int k = 0; k < 516; k++){
            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = 0;//src[259 + 126*128 + j];//condition can be simplified
    }
//bottom+1 right-1 corner (126, 126)
    x = 0;
    y = 0;
    for(int r = -3; r < 2; r++){
        for(int c = -3; c < 2;c++){
            x += gauss_sobel[(r+3)*5 + c+3] * img_buffer[(-abs(r)+3)*128 + (-abs(c)+3)];
            y += gauss_sobel[(c+3)*5 + r+3] * img_buffer[(-abs(r)+3)*128 + (-abs(c)+3)];
        }
    }
    G[126*128+126] = sqrt(x*x + y*y);
    theta[126*128+126] = atan2(y, x);//can be simplified
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;//src[259 + 126*128 + 126];//condition can be simplified

//bottom+1 right corner (126, 127)
    x = 0;
    y = 0;
    for(int r = -3; r < 2; r++){
        for(int c = -2; c < 3;c++){
            x += gauss_sobel[(r+3)*5 + c+2] * img_buffer[(-abs(r)+3)*128 + (-abs(c)+2)];
            y += gauss_sobel[(c+2)*5 + r+3] * img_buffer[(-abs(r)+3)*128 + (-abs(c)+2)];
        }
    }
    G[126*128+127] = sqrt(x*x + y*y);
    theta[126*128+127] = atan2(y, x);//can be simplified
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;//src[259 + 126*128 + 127];//condition can be simplified

    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;//src[259 + 126*128 + 127];//condition can be simplified

//bottom left+1 corner (127, 1)
    x = 0;
    y = 0;
    for(int r = -2; r < 3; r++){
        for(int c = -1; c < 4;c++){
            x += gauss_sobel[(r+2)*5 + c+1] * img_buffer[(-abs(r)+2)*128 + (abs(c)+1)];
            y += gauss_sobel[(c+1)*5 + r+2] * img_buffer[(-abs(r)+2)*128 + (abs(c)+1)];
            // cout << img_buffer[(-abs(r)+2)*128 + (abs(c)+1)] << " ";
        }
    }
    G[127*128+1] = sqrt(x*x + y*y);
    theta[127*128+1] = atan2(y, x);//can be simplified
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;//src[259 + 127*128 + 1];//condition can be simplified

//bottom edge (127, 2:125)
    for(int j = 2; j < 126; j++){
        x = 0;
        y = 0;
        for(int r = -2; r < 3; r++){
            for(int c = 0; c < 5;c++){
                x += gauss_sobel[(r+2)*5 + c] * img_buffer[(-abs(r)+2)*128 + c];
                y += gauss_sobel[(c)*5 + r+2] * img_buffer[(-abs(r)+2)*128 + c];
                
            }
        }
        G[127*128+j] = sqrt(x*x + y*y);
        theta[127*128+j] = atan2(y, x);//can be simplified
        //shifting register
        for(int k = 0; k < 516; k++){
            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[516] = 0;//src[259 + 127*128 + j];//condition can be simplified
    }

//bottom right-1 corner (127, 126)
    x = 0;
    y = 0;
    for(int r = -2; r < 3; r++){
        for(int c = -3; c < 2;c++){
            x += gauss_sobel[(r+2)*5 + c+3] * img_buffer[(-abs(r)+2)*128 + (-abs(c)+3)];
            y += gauss_sobel[(c+3)*5 + r+2] * img_buffer[(-abs(r)+2)*128 + (-abs(c)+3)];
        }
    }
    G[127*128+126] = sqrt(x*x + y*y);
    theta[127*128+126] = atan2(y, x);//can be simplified
    //shifting register
    for(int k = 0; k < 516; k++){
        img_buffer[k] = img_buffer[k+1];
    }
    img_buffer[516] = 0;//src[259 + 127*128 + 126];//condition can be simplified


    











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
    //     cout << G[127*128 + j] << "\t" << G_gold[127*128 + j] << endl;
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


/*
void canny(DTYPE* src, DTYPE* dst, int upperThresh, int lowerThresh)
{
    //Write your code here
	float  gaussian_kernel[9] = {0.09474166, 0.11831801, 0.09474166, 0.11831801, 0.14776132, 0.11831801, 0.09474166, 0.11831801, 0.09474166};
	int x_sobel[9] = {-1, 0, 1, -2, 0, 2, -1, 0, 1}, y_sobel[9] = {-1, -2, -1, 0, 0, 0, 1, 2, 1};

    DTYPE img[16384];//reduce this buffer size
    DTYPE img_buffer[259];//buffer size = 128*2+3

    float blurred_buffer[16384] = {0};

    float blurred[16384] = {0}, G[16384] = {0}, theta[16384] = {0};//reduce buffer size

    for(int i = 0; i < 130; i++){
        img_buffer[i+130] = src[i];
    }

    for(int j = 0; j < 128; j++){
        for(int r = -1; r < 2; r++){
            for(int c = -1; c < 2; c++){
                blurred_buffer[j] += img_buffer[(r+1)*128 + c+1] * gaussian_kernel[(r+1)*3 + c+1];
            }
        }
        //shift register
        for(int k = 0; k < 258; k++){
            img_buffer[k] = img_buffer[k+1];
        }
        img_buffer[258] = (130 + j > 16384)? 0 : src[130 + j];//shift img buffer
    }

    for(int i = 1; i < 127; i++){//skip top row and botton row

        for(int j = 1; j < 127; j++){//skip left most and right most column
            //Gaussian convolution
            for(int r = -1; r < 2; r++){
                for(int c = -1; c < 2; c++){
                    blurred_buffer[i*128 + j] += img_buffer[(r+1)*128 + c+1] * gaussian_kernel[(r+1)*3 + c+1];
                }
            }

            //shift register
            for(int k = 0; k < 258; k++){
                img_buffer[k] = img_buffer[k+1];
            }
            img_buffer[258] = (130 + i*128 + j > 16384)? 0 : src[130 + i*128 + j];//shift img buffer
        }

    }




//read image
    for(int i = 0; i < 128; i++){
        for(int j = 0; j < 128; j++){
            img[i*128 + j] = src[i*128 + j];
        }
    }



// Gaussian filter
    Gaussian_filter_x: for(int i = 0; i < 128; i++){
    	Gaussian_filter_y: for(int j = 0; j < 128; j++){
	        blurred[i*128 + j] = 0;
            Gaussian_kernel_x: for(int r = -1; r < 2; r++){
            	Gaussian_kernel_y: for(int c = -1; c < 2; c++){
                    int idx_x = (i+r < 0)? 1 : ((i+r > 127)? 126 : i+r);
                    int idx_y = (j+c < 0)? 1 : ((j+c > 127)? 126 : j+c);
                    blurred[i*128 + j] += gaussian_kernel[(r+1)*3 + c+1] * img[idx_x*128 + idx_y];
                }
            }
        }
    }

    for(int i = 0; i < 128; i++){
        cout << blurred[0*128 + i] << "\t" << blurred_buffer[0*128 + i] << endl; 
    }

//x and y axis sobel filter
    Sobel_filter_x: for(int i = 0; i < 128; i++){
    	Sobel_filter_y: for(int j = 0; j < 128; j++){

	        float blur_x = 0;
            float blur_y = 0;
            Sobel_kernel_x: for(int r = -1; r < 2; r++){
            	Sobel_kernel_y: for(int c = -1; c < 2; c++){
                    int idx_x = (i+r < 0)? 1 : ((i+r > 127)? 126 : i+r);
                    int idx_y = (j+c < 0)? 1 : ((j+c > 127)? 126 : j+c);
                    blur_x += x_sobel[(r+1)*3 + c+1] * blurred_buffer[idx_x*128 + idx_y];
                    blur_y += y_sobel[(r+1)*3 + c+1] * blurred_buffer[idx_x*128 + idx_y];
                }
            }
            G[i*128 + j] = sqrt(blur_x*blur_x + blur_y*blur_y);
            theta[i*128 + j] = atan2(blur_y, blur_x);

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
*/
/*
void canny(DTYPE* src, DTYPE* dst, int upperThresh, int lowerThresh)
{
	float gauss_sobel_x[25] = {-0.09474166 ,-0.118318014 ,0.0 ,0.118318014 ,0.09474166 ,
				-0.30780134 ,-0.38439733 ,0.0 ,0.38439733 ,0.30780134 ,
				-0.42611933 ,-0.5321587 ,0.0 ,0.5321587 ,0.42611933 ,
				-0.30780134 ,-0.38439733 ,0.0 ,0.38439733 ,0.30780134 ,
				-0.09474166 ,-0.118318014 ,0.0 ,0.118318014 ,0.09474166};
	float gauss_sobel_y[25] = {-0.09474166 ,-0.30780134 ,-0.42611933 ,-0.30780134 ,-0.09474166,
			-0.118318014 ,-0.38439733 ,-0.5321587 ,-0.38439733 ,-0.118318014 ,
			0.0 ,0.0 ,0.0 ,-7.450581e-09 ,0.0 ,
			0.118318014 ,0.38439733 ,0.5321587 ,0.38439733 ,0.118318014 ,
			0.09474166 ,0.30780134 ,0.42611933 ,0.30780134 ,0.09474166};

    DTYPE img[16384];//reduce this buffer size

    float blurred[16384] = {0}, G[16384], theta[16384];//reduce buffer size
    float x[16384], y[16384];

//read image
    for(int i = 0; i < 16384; i++){
    	img[i] = src[i];
    }

//x and y axis sobel filter
    Sobel_filter_x: for(int i = 0; i < 128; i++){
    	Sobel_filter_y: for(int j = 0; j < 128; j++){

	        float blur_x = 0;
            float blur_y = 0;
            Sobel_kernel_x: for(int r = -2; r < 3; r++){
            	Sobel_kernel_y: for(int c = -2; c < 3; c++){
                    int idx_x = (i+r < 0)? 1 : ((i+r > 127)? 126 : i+r);
                    int idx_y = (j+c < 0)? 1 : ((j+c > 127)? 126 : j+c);
                    blur_x += gauss_sobel_x[(r+2)*5 + c+2] * img[idx_x*128 + idx_y];
                    blur_y += gauss_sobel_y[(r+2)*5 + c+2] * img[idx_x*128 + idx_y];
                    
                }
            }
            x[i*128+j] = blur_x;
            y[i*128+j] = blur_y;

            G[i*128 + j] = sqrt(blur_x*blur_x + blur_y*blur_y);
            theta[i*128 + j] = atan2(blur_y, blur_x);

        }
    }

    for(int i = 0; i < 128; i++){
        cout << x[0*128 + i] << "\t" << y[0*128 + i] << endl; 
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


}*/