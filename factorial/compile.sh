nasm -f macho64 factorial.asm
ld -e "_factorial" -static -o factorial factorial.o
gcc call_factorial.c factorial.o
