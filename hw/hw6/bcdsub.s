.section .text
.global BCDSUB
.type BCDSUB,%function

BCDSUB:
    MOV ip, sp
    STMFD sp!,{r4-r10,fp,ip,lr,pc}
    SUB fp, ip, #4
    
    MOV v1, a1
    MOV v2, a2
    LDR v3, =0x99999999
    SUB a1, v3, v2  /* 9's complement of b */
    
    MOV a2, #0x1    /* 10's complement of b */
    BL BCDADD
    
    MOV a2, v1
    BL BCDADD

    AND a1, a1, #0x0fffffff /* return */

    LDMEA fp, {r4-r10, fp, sp, pc}
