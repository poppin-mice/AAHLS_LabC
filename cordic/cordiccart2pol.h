#include <ap_fixed.h>
#ifndef CORDICCART2POL_H
#define CORDICCART2POL_H

#define NO_ITER 11

typedef int   coef_t;
//typedef float data_t;
typedef ap_fixed<15, 3, AP_RND> data_t;
typedef ap_fixed<16, 4, AP_RND> data_meta;
typedef float acc_t;

void cordiccart2pol(data_t x, data_t y, data_t * r,  data_t * theta);

#endif
