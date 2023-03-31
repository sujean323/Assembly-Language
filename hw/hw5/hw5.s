    .section .text
    .global main
    .type mian,%function

main:

    LDR a1, =123      /* input */
    ADD v1, a1, #0    /* v1 = n */
    EOR v4, v4, v4    /* ret(a1) = 0 */
    EOR v2, v2, v2    /* v2 = 0 (i) */

LOOP_0:
    CMP v2, #32       /* i<32 */
    BGE EXIT_0

    MOV r0, v1        /* A=tmp */
    MOV r1, #10       /* B=10 */
    BL IDIV           /* function call */

    MOV v1, r0        /* tmp=A */
    LSL r1, r1, v2
    ORR v4, v4, r1

    ADD v2, v2, #4
    B LOOP_0

EXIT_0:

    MOV r2, v4

    nop
