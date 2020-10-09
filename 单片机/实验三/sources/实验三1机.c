#include <reg51.h>

#define uchar unsigned char

char code duanma[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07,
0x7f, 0x6f, 0x77, 0x7c, 0x39, 0x5e, 0x79, 0x71};

void delay(unsigned int x) {
  unsigned int j = 0;
  for (; x > 0; --x) {
    for (j = 0; j < 125; ++j) {
      ;
    }
  }
}

void main(void) {
  uchar counter = 0;
  PCON = 0x80;
  SCON = 0x90;
  while (1) {
    ACC = counter;
    TB8 = P;
    SBUF = counter;
    while (TI == 0) {
      ;
    }
    TI = 0;
    while (RI == 0) {
      ;
    }
    RI = 0;
    if (RB8 == 0) {
      P2 = duanma[counter];
      if (++counter > 15) {
        counter = 0;
      }
      delay(500);
    }
  }
}
