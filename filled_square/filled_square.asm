; nasm -f macho64 filled_square.asm && ld -e "start" -static -o filled_square filled_square.o && ./filled_square

            global      start

            section     .text
start:      mov         rdx, squbuf         ; stores the adress of the next byte
            mov         r8, 0               ; number of stars written on current line so far
            mov         r9, 0               ; number of lines filled so far

line:
            mov         byte [rdx], "*"     ; write new character to buffer
            inc         rdx                 ; move pointer to next cell in buffer
            inc         r8                  ; one character is added to line
            cmp         r8, squlen          ; have we printed `squlen` characters on line?
            jne         line                ; if full line is filled, go to next line

linedone:   mov         byte [rdx], 10      ; write return space to buffer
            inc         rdx                 ; move pointer to next cell in buffer
            inc         r9                  ; one line is filled
            mov         r8, 0               ; reset number of stars written on line (new line)
            cmp         r9, squlen          ; have we filled all the lines?
            jne         line                ; if so, we exit

exit:       mov         rax, 0x2000004      ; loads `write` syscall (macOS) into %rax
            mov         rdi, 1              ; 1 is for stdout
            mov         rsi, squbuf         ; loads the buffer to write to stdout into %rsi
            mov         rdx, 110            ; loads the buffer size into %rdx
            syscall

            mov         rax, 0x2000001      ; loads `exit` syscall (macOS) into %rax
            xor         rdi, rdi            ; loads 0 into %rdi
            syscall

            section     .bss
squlen:     equ         10
squbuf:     resb        110
