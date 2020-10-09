#include <reg51.h>

void delay() {
	unsigned int i;
	for (i = 0; i < 50000; ++i) {
		;
	}
}

void main(void) {
	while (1) {
		P1 = (6 > 0x0f) && (8 < 0xa);
		delay();
		P1 = ((6 > 0x0f) || (8 < 0xa)) + (0xfe);
		delay();
	}
}