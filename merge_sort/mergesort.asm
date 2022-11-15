; ----------------------------------------------------------------------------------
; Sorts an array in place using merge sort, with the following prototype:
;
;       void mergesort(double[] arr, uint64_t length);
; ----------------------------------------------------------------------------------

            global      _mergesort

;           left in %rdi, length in %rsi

            section     .text
_mergesort:
            dec         rsi             ; right = length - 1
            call        mergesort

mergesort:
            cmp         rdi, rsi
            jnl         done            ; if `left` >= `right`, exit

            push        rdi             ; saves `left` and aligns %rsp
            push        rsi             ; saves `right`
            mov         r8, rsi
            sub         r8, rdi
            idiv        r8, 2
            add         r8, rdi         ; (`right` - `left`) // 2 + `left`

            mov         rsi, r8         
            push        r8              ; saves `middle`
            call        mergesort
            pop         r8              ; restores `middle`
            pop         rsi             ; restores `right`
            mov         rdi, r8         ; loads `middle` into %rdi
            inc         rdi             ; `middle` + 1
            push        rdi             
            push        rsi
            call        mergesort

            pop         rsi
            pop         rdi
            mov         rdx, rsi        ; `right` as third arg
            mov         rsi, rdi        ; `middle + 1` as second arg
            dec         rsi             ; `middle` as second arg
            pop         rdi             ; `left` as first arg
            call        merge

merge:
            sub         rsp, 8          ; allocate memory on stack frame
            mov         [rsp], rsi      
            add         [rsp], 1

            cmp         [rsi], [rsp]    ; if direct merge is already sorted
            jg          done


done:
            ret
