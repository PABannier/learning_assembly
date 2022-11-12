nasm -f macho64 maxofthree.asm
ld -e "_maxofthree" -static -o maxofthree maxofthree.o
gcc call_maxofthree.c maxofthree.o
