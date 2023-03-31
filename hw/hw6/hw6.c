#include<stdio.h>
#include<stdint.h>

uint32_t BCDADD(uint32_t, uint32_t);
uint32_t BCDSUB(uint32_t, uint32_t);
uint32_t BIN2BCD(uint32_t);

int main(void) {  
    int a, b, a1, b1, r1, r2;
    
    // get two number from input.
    scanf("%d %d", &a, &b);
    
    a1 = BIN2BCD(a); // bin2bcd.s
    b1 = BIN2BCD(b); // bin2bcd.s
    
    r1 = BCDADD(a1, b1); // bcdadd.s
    r2 = BCDSUB(a1, b1); // bcdsub.s
    
    // output a1, b1, r1, and r2 in binary.
    printf("%x %x %x %x\n", a1, b1, r1, r2);
}
