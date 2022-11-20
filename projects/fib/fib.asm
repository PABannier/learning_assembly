            global  _fib

            section     .text
_fib:
            cmp         rdi, 1      ; test if n <= 1
            jnbe        main        ; jump if not
            mov         rax, rdi    ; F(0) = 0, F(1) = 1
            ret

main:
            dec         rdi         ; put `n - 1` into %rdi
            push        rdi         ; save `n - 1` and aligns %rsp
            call        _fib        ; recursive call to compute F(n - 1)
            pop         rdi         ; restore `n - 1`

            push        rax         ; save `F(n - 1)`
            dec         rdi         ; put `n - 2` into %rdi
            push        rdi         ; save `n - 2`
            call        _fib        ; recursive call to compute F(n - 2)
            pop         rdi         ; restore `n - 2`
            pop         rdi         ; restore `F(n - 1)` 
            add         rax, rdi    ; F(n - 2) + F(n - 1)
            ret
