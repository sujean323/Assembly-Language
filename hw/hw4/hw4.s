        .global main
        .type mian,%function

main:
    LDR a1, =825      /* input */
    ADD v1, a1, #0    /* v1 = n */
    EOR a1, a1, a1    /* ret(a1) = 0 */
    EOR v2, v2, v2    /* v2 = 0 (i) */

LOOP_0:
    CMP v2, #32	      /* i<32 */
    BGE EXIT_0
    ADD v3, v1, #0    /* code = n */
    EOR v1, v1, v1    /* n = 0 */

LOOP_1:
    CMP v3, #10       /* code >= 10 */
    BLT EXIT_1
    SUB v3, v3, #10   /* code -= 10 */
    ADD v1, v1, #1    /* n++ */
    B LOOP_1          /* jump */

EXIT_1:
    LSL v3, v3, v2
    ORR a1, a1, v3

    ADD v2, v2, #4
    B LOOP_0

EXIT_0:

    MOV r2, a1

    nop
