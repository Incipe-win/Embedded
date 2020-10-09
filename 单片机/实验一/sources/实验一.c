#include <reg51.h>

//延时n毫秒
void delay_ms(unsigned int n) {
  unsigned int i = 0, j = 0;
  for (i = 0; i < n; i++) {
    for (j = 0; j < 123; j++) {
      ;
    }
  }
}

void main(void) {
  int count = 3;
  while (count--) {
    P2 = 0;
    delay_ms(1000);
    P2 = 0xFF;
    delay_ms(1000);
  }
  while (1) {
    P2 = P3;
  }
}