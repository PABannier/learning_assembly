; --------------------------------------------------------------------------
; A 64-bit function that returns the sum of the elements of a floating-point
; array. The function has prototype:
;
;   double sum_arr(double[] arr, uint64_t length)            
; --------------------------------------------------------------------------

            global  _sum

            section .text
_sum:      
            xorpd   xmm0, xmm0        ; initialize sum to 0
            cmp     rsi, 0            ; if `length` == 0, done
            je      done

next:
            addsd   xmm0, [rdi]       ; add current element to sum
            add     rdi, 8            ; move pointer to next cell of array
            dec     rsi               ; decrease length
            jnz     next              ; is length == 0 ? if not, keep summing.

done:
            ret
