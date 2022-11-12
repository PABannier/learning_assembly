nasm -f macho64 fib.asm
ld -e "_fib" -static -o fib fib.o
gcc call_fib.c fib.o
