#include <reg51.h>

/**
void delay() {
	unsigned int i;
	for (i = 0; i < 50000; ++i) {
		;
	}
}
*/

void main(void) {
	P2 = 0x52 & 0x48;
	P3 = 0x52 | 0x48;
	while (1) {
		;
	}
}