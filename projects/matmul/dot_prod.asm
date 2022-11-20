; ----------------------------------------------------------------------------------
; Dot product between two vectors, using the following prototype:
;
;       double dot_prod(double[] A, double[] B, int64_t length, int64_t jmp_size);
; ----------------------------------------------------------------------------------
                global     _dot_prod


                section     .text

_dot_prod:
                xorpd       xmm0, xmm0              ; initialize sum to 0
                cmp         rdx, 0                  ; if `length` == 0; done
                je          done

next:
                xorpd       xmm1, xmm1              ; initialize current prod to 0
                addsd       xmm1, [rdi]
                mulsd       xmm1, [rsi]             ; a[i] * b[i]
                addsd       xmm0, xmm1              ; sum += a[i] * b[i]
                add         rdi, 8                  ; move to next element in a
                lea         rsi, [rsi + 8 * rcx]    ; move to next element in b
                dec         rdx                     ; decrease length by 1
                jnz         next                    ; length == 0 ? if not keep summing

done:
                ret
