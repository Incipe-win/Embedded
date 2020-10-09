#include <reg51.h>
#define uchar unsigned char

void main(void) {
  uchar receive;
  char code duanma[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07,
                        0x7f, 0x6f, 0x77, 0x7c, 0x39, 0x5e, 0x79, 0x71};
  PCON = 0x80;
  SCON = 0x90;
  while (1) {
    while (RI == 1) {
      RI = 0;
      receive = SBUF;
      ACC = receive;
      if (P == RB8) {
        TB8 = 0;
      } else {
        TB8 = 1;
      }
      SBUF = receive;
      while (TI == 0) {
        ;
      }
      TI = 0;
      P2 = duanma[receive];
    }
  }
}
