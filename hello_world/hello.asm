; nasm -f macho64 hello.asm && ld -e "start" -static -o hello hello.o && ./hello

            global      start               ; sets the entry point for your program, by convention should be "start"

            section     .text               ; defines the text section with the assembly instruction
start:      mov         rax, 0x2000004      ; loads the `write` syscall number into %rax (all syscall numbers must be loaded into %rax)
                                            ; in macOS, all syscalls start with 0x2000000
                                            ; list of syscalls in macOS for x86_64 arch: https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master
            mov         rdi, 1              ; when calling a function, arguments should be placed in %rdi, %rsi, %rdx, %rcx, %r8, %r9
                                            ; if more arguments need to be passed, they should be placed on the stack
            mov         rsi, message
            mov         rdx, 13
            syscall                         ; make the syscall

            mov         rax, 0x2000001      ; `exit` syscall
            xor         rdi, rdi            ; stores 0 into rdi for exit(0)
            syscall                         ; make the syscall

            section     .data               ; defines the data section
message:    db          "Hello, World", 10  ; as per the ASCII table, 10 is the return key
