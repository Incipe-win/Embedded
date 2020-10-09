#include <reg51.h>

void main(void) {
		unsigned char a;
		unsigned char b;
		a = 52;
		b = 48;
		
		P2 = a + b;
		P3 = a - b;
	while (1) {
		;
	}
}