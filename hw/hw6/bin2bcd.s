.section .text
.global BIN2BCD
.type BIN2BCD,%function

BIN2BCD:
    /* function start */
    mov ip,sp
    stmfd sp!,{r4-r10,fp,ip,lr,pc}
    sub fp,ip,#4 
    
    /* --- begin your function --- */
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

    MOV r0, v4
    /* Do conversion */
    
    /* --- end of your function --- */
    
    /* function exit */
    ldmea fp,{r4-r10,fp,sp,pc}
    .end
