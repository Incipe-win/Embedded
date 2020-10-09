#include <reg51.h>

void delay() {
	unsigned int i;
	for (i = 0; i < 50000; ++i) {
		;
	}
}

void main(void) {
	while (1) {
		P1 = 0xaa << 1;
		delay();
		P1 = P1 << 1;
		delay();
		P1 = P1 >> 1;
		delay();
		P1 = P1 >> 1;
		delay();
	}
}