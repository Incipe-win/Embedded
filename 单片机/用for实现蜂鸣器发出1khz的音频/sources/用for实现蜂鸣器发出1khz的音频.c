#include <reg51.h>

sbit sound = P1^0;

void delay1000Hz() {
	unsigned char i;
	for (i = 0; i < 167; ++i) {
		;
	}
}

void main() {
	while (1) {
		sound = 0;
		delay1000Hz();
		sound = 1;
		delay1000Hz();
	}
}