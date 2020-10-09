/**
#include <reg51.h>

//延时150毫秒
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
	unsigned char code Tab[] = {0xfe, 0xfc, 0xf8, 0xf0, 0xe0, 0xc0, 0x80, 0x00, 0xff};
	while (1) {
		for (i = 0; i < 9; ++i) {
			P1 = Tab[i];
			delay();
		}
	}
}
*/

/**
 * 指针数组
 */
 
/**
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
	unsigned char code *Tab[] = {0xfe, 0xfc, 0xf8, 0xf0, 0xe0, 0xc0, 0x80, 0x00, 0xff, 0xfe, 0xfd, 0xfb, 0xf7, 0xef, 0xdf, 0x7f, 0xf0, 0x0f, 0xaa};
	while (1) {
		for (i = 0; i < 9; ++i) {
			P1 = *Tab[i];
			delay();
		}
	}
}
*/

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
	unsigned char code Tab[] = {0xfe, 0xfc, 0xf8, 0xf0, 0xe0, 0xc0, 0x80, 0x00, 0xff, 0xfe, 0xfd, 0xfb, 0xf7, 0xef, 0xdf, 0x7f, 0xf0, 0x0f, 0xaa};
	unsigned char *p;
	p = Tab;
	while (1) {
		for (i = 0; i < 19; ++i) {
			P1 = *(p + i);
			delay();
		}
	}
}