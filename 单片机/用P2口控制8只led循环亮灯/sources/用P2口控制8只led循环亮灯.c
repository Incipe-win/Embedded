#include <reg51.h>

void delay() {
	unsigned char i, j;
	for (i = 0; i < 200; ++i) {
		for (j = 0; j < 250; ++j) {
			;
		}
	}
}

void main() {
	unsigned char i;
	while (1) {
		P2 = 0xff;
		delay();
		for (i = 0; i < 8; ++i) {
			P2 <<= 1;
			delay();
		}
	}
}