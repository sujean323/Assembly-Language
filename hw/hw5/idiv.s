    .section .text
    .global IDIV
    .type IDIV,%function

IDIV:
    /* function start */
    MOV ip,sp
    STMFD sp!,{r4-r10,fp,ip,lr,pc}
    SUB fp,ip,#4

    /* --- begin your function --- */
    MOV v1, r0      /* tmp=A */
    MOV v2, #0      /* cnt=0 */
LOOP:
    CMP v1, r1      /* tmp<b*/
    BLE END_LOOP
    ADD v2, v2, #1  /* cnt++ */
    SUB v1, v1, r1  /* tmp -= b */
        B LOOP
END_LOOP:
    MOV r0, v2      
    MOV r1, v1

    /* --- end of your function --- */

    /* function exit */
    LDMEA fp,{r4-r10,fp,sp,pc}
    .end
