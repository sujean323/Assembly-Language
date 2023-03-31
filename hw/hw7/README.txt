資工三 409410114 周述君

環境：系工作站
Intel(R) Xeon(R) Gold 5218 CPU @ 2.30GHz
gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
Linux tux 5.4.0-122-generic #138-Ubuntu SMP Wed Jun 22 15:00:31 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
記憶體35GiB

編譯方式： make指令

編譯參數：-mavx2 -O2

繳交檔案：README.txt、hw7simd.c、hw7non_simd、makefile。

makefile說明：test redirect到/dev/null，避免被編譯器優化掉，而影響執行結果。

程式說明：
simd版本的code使用AVX指令來優化轉換過程，每次操作8個pixel。把pixel load到AVX暫存器，將pixel分成RGB再用公式計算各別的灰階值。

驗證：
SIMD: 395308377 ns
nonSIMD: 360265418 ns
我查看反組譯後的結果發現編譯器會自動優化使用SIMD指令，所以直接寫SIMD指令不會比較快。