.section .text
.global BCDADD
.type BCDADD,%function

BCDADD:
    mov ip, sp
    stmfd sp!,{r4-r10,fp,ip,lr,pc}
    sub fp,ip,#4

    LDR v4, =0x06666666
    ADD v1, a1, v4
    EOR v2, v1, a2      /* sum without carry propagation */
    ADD v1, v1, a2      /* provisional sum */        
    EOR v2, v1, v2      /* all the binary carry bits */
    MVN v2, v2          /* not v2 */
    LDR v4, =0x11111110
    AND v2, v4          /* v2 & 0x11111110 */
    MOV v3, v2
    ASR v2, v2, #2      /* v2 >> 2 */
    ASR v3, v3, #3      /* v2 >> 3 */
    ORR v2, v2, v3      /* t2 = (t2 >> 2) | (t2 >> 3) */
    SUB r0, v1, v2      /* return t1 - t2 */

    LDMEA fp,{r4-r10, fp, sp, pc}
    .end
