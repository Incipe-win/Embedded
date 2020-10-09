/*
#include <reg51.h>

void mian(void) {
	while (1) {
		P0 = 0xff;
		P1 = P0;
		P2 = P0;
		P3 = P0;
	}
}*/

#include <reg51.h>

sbit P0_0 = P0^0;
sbit P1_0 = P1^0;
sbit P2_0 = P2^0;
sbit P3_0 = P3^0;

void main(void) {
	P0_0 = 1;
	P1_0 = P0_0;
	P2_0 = P0_0;
	P3_0 = P0_0;
}
