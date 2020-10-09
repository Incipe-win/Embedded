#include <reg51.h>

void delay60() {
	unsigned char i, j;
	for (i = 0; i < 200; ++i) {
		for (j = 0; j < 100; ++j) {
			;
		}
	}
}

void delay150() {
	unsigned int i;
	for (i = 0; i < 50000; ++i) {
		;
	}
}

void main(void) {
	while (1) {
		P2 = 0xf0;
		delay60();
		
		P2 = 0xff;
		delay60();
		
		P2 = 0x0f;
		delay150();
		
		P2 = 0xff;
		delay150();
	}
}