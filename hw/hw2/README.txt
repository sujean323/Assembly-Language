資工三 409410114 周述君

程式內容:
我先把r1*2存入r0，再加上r5存入r0，再加r5*2存入r0，最後減掉2*r6存入r0。

如何編譯程式:
./arm-none-eabi-gcc -g -O0 hw2.s -o hw2.exe

程式的執行環境:
一開始安裝insight時遇到了很多困難，
找不到insight.git，
所以就用了recursive的方式，
但因為電腦找不到configure一直無法按老師ppt的指令做，
跑到一半又停住過了快一個小時都沒動，
我只好刪掉重弄超多次，
好不容易疑似可以了xlaunch又開不起來，
大概打了100次./arm-none-eabi-insight又看了一堆youtube教學終於打開了。

如何執行程式:
./arm-none-eabi-insight