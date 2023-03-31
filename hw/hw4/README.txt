資工三 409410114 周述君

環境：ubuntu-20.04

編譯方式：./arm-none-eabi-gcc -g hw4.s -o hw4.exe

繳交檔案：README.txt、hw4.s、hw4.exe、Makefile、Makefile.2.sample。

程式說明：
我先用C語言寫了BCD再優化轉成組合語言
/*C program*/
BCD(int n) {
    int ret = 0;
    for (int i = 0; i < 32; i += 4) {
        int code = n;
        n = 0;
        for (; code >= 10; n++) {
           code -= 10;
        }
        code = code << i;
        ret = ret | code;
    }
}
組合語言的部分
main
a1為input值
v1如上面C語言中的n
v2作為counter i
接著進入loop運算
再將最後的值存回r2。

驗證：./arm-none-eabi-insight
open hw4.exe -> 將target改成simulator -> run -> countinue到nop -> view register&memroy
確認得到正確的BCD結果，我測試了123、825、999皆正確。
