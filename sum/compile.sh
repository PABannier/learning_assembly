nasm -f macho64 sum.asm
ld -e "_sum" -static -o sum sum.o
gcc call_sum.c sum.o
