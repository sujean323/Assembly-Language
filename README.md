Assembly Language
===
## homework 1

## homework 2

## homework 3

## homework 4
- Input: binary code

  - 二進為數值在0 ~ 99910 之間

  - 不考慮負數

  - binary code 存放於 register r1
- Function: translate the binary code to the corresponding BCD code.
- Output: BCD code
  - 結果的BCD code應存放在register r2
## homework 5
參照homework4進行修改
ARM v4t 沒有提供除法指令，請使用減法來實現除法運算 – Function IDIV( )
## homework 6
- Input:
  - 兩個整數a, b
  - 數值在0 ~ 99910 之間
  - 不考慮負數
  - a >= b
- Computation
  - 將a, b轉換為相對應的BCD code: a1, b1
  - 執行BCD code的加法運算 r1 = a1 + b1
  - 執行BCD code的減法運算 r2 = a1 – b1
- Output: BCD code
  - a1, b1, r1, r2
## homework 7
使用SIMD intrinsic function來做計算：將主要運算 (紅色方框) 的程式碼，使用SIMD intrinsic function，改寫成SIMD的版本。
