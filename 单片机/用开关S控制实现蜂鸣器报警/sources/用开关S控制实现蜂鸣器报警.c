#include <reg51.h>

sbit S1 = P3 ^ 0;
sbit S2 = P3 ^ 1;
sbit sound = P1 ^ 0;
unsigned int keyval;

void delay() {
	unsigned int i;
	//30ms
	for (i = 0; i < 1000; ++i) {
		;
	}
}

void delay1000Hz() {
	unsigned char i;
	for (i = 0; i < 167; ++i) {
		;
	}
}

void delay500Hz() {
	unsigned int i;
	for (i = 0; i < 333; ++i) {
		;
	}
}

void sound1s() {
	unsigned int i;
	for (i = 0; i < 1000; ++i) {
		sound = 0;
		delay1000Hz();
		sound = 1;
		delay1000Hz();
	}
}

void soundBans() {
	unsigned char i;
	for (i = 0; i < 255; ++i) {
		sound = 0;
		delay500Hz();
		sound = 1;
		delay500Hz();
	}
}

void key_scan() {
	if (S1 == 0) {
		keyval = 1;
	}
	delay();
	if (S2 == 0) {
		keyval = 2;
	}
	delay();
}

void main() {
	keyval = 0;
	while (1) {
		key_scan();
		switch(keyval) {
			case 1:
				sound1s();
				break;
			case 2:
				soundBans();
				break;
		}
	}
}