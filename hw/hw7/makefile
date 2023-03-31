CC = gcc
all: hw7simd hw7non_simd

simd: hw7simd.c
	gcc -o hw7simd hw7simd.c -mavx2 -O2

non-simd: hw7non_simd.c
	gcc -o hw7non_simd hw7non_simd.c -mavx2 -O2

test: hw7simd hw7non_simd
	./hw7simd > /dev/null
	./hw7non_simd > /dev/null
