nasm -f macho64 mergesort.asm
ld -e "_mergesort" -static -o mergesort mergesort.o
gcc call_mergesort.c mergesort.o
