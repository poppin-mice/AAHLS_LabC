#include "cordiccart2pol.h"
#include <stdio.h>
#include <iostream>
using namespace std;

// arc tan(2^(-k))
//data_t angles[NO_ITER] = {	0.785398163397448,		0.463647609000806,		0.244978663126864,		0.124354994546761,
//							0.0624188099959574,		0.0312398334302683,		0.0156237286204768,		0.00781234106010111,
//							0.00390623013196697,	0.00195312251647882,	0.000976562189559320,	0.000488281211194898,
//							0.000244140620149362,	0.000122070311893670,	6.10351561742088e-05,	3.05175781155261e-05};
data_t angles[NO_ITER] = {	0.785398163397448,		0.463647609000806,		0.244978663126864,		0.124354994546761,
							0.0624188099959574,		0.0312398334302683,		0.0156237286204768,		0.00781234106010111,
							0.00390623013196697,	0.00195312251647882,	0.000976562189559320};


// scaler for iter=0~15
// data_t scaler = 0.607252935103139;


void cordiccart2pol(data_t x, data_t y, data_t * r,  data_t * theta){
	data_t theta_out=0;
	data_t x_cordic, y_cordic, x_shift, y_shift;

	// pre-rotate
	if(x>=0){
		x_cordic = x;
		y_cordic = y;
	}
	else{
		x_cordic = -x;
		y_cordic = -y;
	}

	// cordic core
	cordic_loop:
	for(int i=0;i<11;i++){
		x_shift = y_cordic >> i;
		y_shift = x_cordic >> i;

		if(y_cordic[14]==0){
			x_cordic += x_shift;
			y_cordic -= y_shift;
			theta_out += angles[i];
		}
		else{
			x_cordic -= x_shift;
			y_cordic += y_shift;
			theta_out -= angles[i];
		}
	}
	// code correction
	//*r = scaler * x_cordic;
	*r = (x_cordic >> 1) + (x_cordic >> 4) + (x_cordic >> 5) + (x_cordic >> 7) + (x_cordic >> 8) + (x_cordic >> 10) + (x_cordic >> 11);
	if(x[14] == 0){*theta = theta_out;}
	else{
		if(y[14] == 0){*theta = (data_t)3.14159265359 + theta_out;}
		else{*theta = theta_out - (data_t)3.14159265359;}
	}
}
