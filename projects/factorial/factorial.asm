        global  _factorial 

        section .text
_factorial:
        cmp     rdi, 1      ; check `n` <= 1
        jnbe    next        ; if not, jump to main case
        mov     rax, 1      ; base case reached, return 1
        ret

next:
        push    rdi         ; save `n` on stack and aligns %rsp
        dec     rdi         ; n - 1
        call    _factorial  ; recursive call
        pop     rdi         ; restore n
        imul    rax, rdi    ; returned val of `_factorial` is in %rax, multiply the restored `n`
        ret
