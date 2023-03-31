	.section .text
 	.global main
 	.type main,%function
 main:
	ldr r1,=#10
	ldr r5,=#20
	ldr r6,=#12
	
	/*your codes*/
	MOV r0, r1, LSL #1 /* r0 := 2xr1*/
	ADD r0, r0, r5 /* r0 := 2xr1+r5*/
	ADD r0, r0, r5, LSL #1 /* r0 := 2xr1+3xr5*/
	SUB r0, r0, r6, LSL #1 /* r0 := 2xr1+3xr5-r6*/

	nop
	.end
