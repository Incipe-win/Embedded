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
		i = 0;
		while (i < 0x64) {
			P1 = i;
			delay();
			++i;
		}
	}
}