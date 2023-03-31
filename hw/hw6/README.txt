資工三 409410114 周述君

環境：ubuntu-20.04

編譯方式：./arm-none-eabi-gcc -g  hw6.c idiv.s bin2bcd.s bcdadd.s bcdsub.s –o hw6.exe 或 make指令

繳交檔案：README.txt、hw6.c、idiv.s、bin2bcd.s、bcdadd.s、bcdsub.s、hw6.exe、makefile。

參考: https://stackoverflow.com/questions/47638491/adding-2-bcd-numbers-mips

程式說明：延續hw4、5再加上add、sub、bin2bcd
先用C語言寫
(參考維基百科的)
uint32_t BCDadd(uint32_t a, uint32_t b) {
    uint32_t t1, t2;    // unsigned 32-bit intermediate values
    t1 = a + 0x06666666; //算出carry
    t2 = t1 ^ b;                   // sum without carry propagation
    t1 = t1 + b;                   // provisional sum
    t2 = t1 ^ t2;                  // all the binary carry bits
    t2 = ~t2 & 0x11111110;         // just the BCD carry bits
    t2 = (t2 >> 2) | (t2 >> 3);    // correction
    return t1 - t2;                // corrected BCD sum
}
(用十補數運算)
uint32_t BCDsub(uint32_t a, uint32_t b) {
    uint32_t b_c = 0x99999999 - b;
    b_c = BCDadd(b_c, 0x1);
    return BCDadd(a, b_c) & 0x0fffffff;
}

驗證：./arm-none-eabi-insight
open hw6.exe -> 將target改成simulator -> run 確認得到正確的BCD結果。