資工三 409410114 周述君

環境：ubuntu-20.04

編譯方式：./arm-none-eabi-gcc -g matrix1_2.s -o matrix1_2.exe

繳交檔案：README.txt、hw3.s、hw3.exe、Makefile。

程式說明：我將A矩陣和B矩陣內的數都assigned為1~12。
r0初始成a位址，r1初始成b的位址，r2初始成c的位址。
r3設為counter紀錄loop跑的次數 (總共12次)，r4、r5分別讀a、b目前的數。
再由loop執行加法運算。

驗證：./arm-none-eabi-insight
open hw3.exe -> 將target改成simulator -> run -> countinue到nop -> view register&memroy
確認矩陣相乘的結果沒錯。
A= 1    2   3
　 4    5   6
　 7    8   9
　10 11 12

B= 1    2   3
　 4    5   6
　 7    8   9
　10 11 12

C= 2     4     6
　 8   10  12
　14  16  18
　20  22  24
