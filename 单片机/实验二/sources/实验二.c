#include <reg51.h>

unsigned char led_mod[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07,
0x7f, 0x6f, 0x77, 0x7c, 0x58, 0x5e, 0x79, 0x71};
unsigned char count = 0;
sbit P0_4 = P0 ^ 4;
													 
void INT_0SRV() interrupt 0 { P0_4 = ~P0_4; }

void INT_1SRV() interrupt 2 {
  count++;
  if (count == 16)
    count = 1;
  P2 = led_mod[count];
}
void main(void) {
  P2 = 0x00;P0_4 = 0x01;
  EA = 1;
  EX0 = 1;
  EX1 = 1;
  IT1 = 1;
  IT0 = 1;
  while (1) {
		;
	}
}