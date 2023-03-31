資工三 409410114 周述君

環境：ubuntu-20.04

編譯方式：./arm-none-eabi-gcc -g hw5.s -o hw5.exe 或 make指令

繳交檔案：README.txt、hw5.s、idiv.s、hw5.exe、makefile。

程式說明：
稍微改hw4.s，idiv的function一樣先用C語言寫再轉成組合語言
/*C program*/
void IDIV(int A, int B) {
    int tmp = A;
    int cnt = 0;
    for ( ; tmp < b; ) {
        cnt++;
        tmp -= b;
    }
}
組合語言的部分
a1為input值
v1如上面C語言中的tmp
v2作為counter cnt
r0為A，r1為B
運算最後的值存回r2。

驗證：./arm-none-eabi-insight
open hw5.exe -> 將target改成simulator -> run -> countinue到nop -> view register&memroy
確認得到正確的BCD結果，我測試了123、825、999皆正確。