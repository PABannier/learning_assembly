; ----------------------------------------------------------------------------------
; Matrix mutiplication for double matrices, with the following prototype:
;       A is a n-by-m matrix, B is a m-by-k matrix, out is a n-by-k matrix
;
;       void matmul(double[][] A, double[][] B, double[][] out, int64_t n, 
;                   int64_t m, int64_t k);
; ----------------------------------------------------------------------------------
                %include    "dot_prod.asm"
                global      _matmul 

                section     .text

; rdi, rsi, rdx, rcx, r8, r9
_matmul:
                xor         r10, r10                ; i = 0, row index
                xor         r11, r11                ; j = 0, column index
                mov         r12, rsi                ; store adress of B[0][0]

main:
                push        rdi
                push        rsi
                push        rdx
                push        rcx

                mov         rdx, r8
                mov         rcx, r9
                call        _dot_prod

                pop         rcx
                pop         rdx
                pop         rsi
                pop         rdi
                mov         [rdx], rax

                inc         r11                     ; increment column index
                cmp         r11, r9                 ; am I at the last column of B?
                jge         reset_index             ; if yes, go at the first column

                add         rsi, 8                  ; else, move column pointer to right
                add         rdx, 8                  ; and move column pointer of result
                jmp         main                    ; and keep multiplying

reset_index:
                xor         r11, r11                ; reset column index
                mov         rsi, r12                ; reset to starting column

                lea         rdi, [rdi + 8 * r8]     ; move row pointer one bottom
                inc         r10                     ; increment row index

                add         rdx, 8                  ; move result pointer to next cell (next row)

                cmp         r10, rcx                ; am I at the last row of A?
                jge         exit                    ; if yes, we're done

                jmp         main                    ; else, keep multiplying

exit:
                ret

