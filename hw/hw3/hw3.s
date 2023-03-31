/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- variable a --- */
	.type a, %object
	.size a, 48 /*12*4byte*/
a:
	.word 1
	.word 2
	.word 3
	.word 4
	.word 5
	.word 6
	.word 7
	.word 8
	.word 9
	.word 10
	.word 11
	.word 12

/* --- variable b --- */
	.type b, %object
	.size b, 48 /*12*4byte*/
b:
	.word 1
	.word 2
	.word 3
	.word 4
	.word 5
	.word 6
	.word 7
	.word 8
	.word 9
	.word 10
	.word 11
	.word 12

c:
	.space 48, 0/*12words*/


/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function
.matrix:
	.word a
	.word b
	.word c
main:
	/*store address of a, b, c*/
	ldr r0, .matrix /*a*/
	ldr r1, .matrix+4 /*b*/
	ldr r2, .matrix+8 /*c*/
	mov r3, #0 /*r3=r3+0*/

loop:
	ldr r4, [r0], #4 /*r0=r0+4*/
	ldr r5, [r1], #4
	add r4, r4, r5 /*r4=r4+r5*/
	str r4, [r2], #4
	add r3, r3, #1 /*r3=r3+1*/
	cmp r3, #12	
	blt loop
	
	sub r0, r2, #48
	
	nop
