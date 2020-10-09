#include <reg51.h>

sbit S = P3^0;

void delay() {
	unsigned char i, j;
	for (i = 0; i < 200; ++i) {
		for (j = 0; j < 250; ++j) {
			;
		}
	}
}

void main(void) {
	unsigned char i = 0;
	while (1) {
		if (S == 0) {
			delay();
		}
		// 两个if目的去抖动
		if (S == 0) {
			++i;
		}
		if (i == 9) {
			i = 1;
		}
		switch(i) {
			case 1: 
				P1 = 0xfe;
				break;
			case 2: 
				P1 = 0xfc;
				break;
			case 3:
				P1 = 0xf8;
				break;
			case 4:
				P1 = 0xf0;
				break;
			case 5:
				P1 = 0xe0;
				break;
			case 6:
				P1 = 0xc0;
				break;
			case 7:
				P1 = 0x80;
				break;
			case 8:
				P1 = 0x00;
				break;
			default:
				P1 = 0xff;
				break;
		}
	}
}