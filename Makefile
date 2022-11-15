ARCH=macho64

compile_nasm: $(entry) $(target)
	nasm -f $(ARCH) $(target).asm
	ld -e $(entry) -static -o $(target) $(target).o

compile_c: $(target)
	gcc call_$(target).c $(target).o

factorial:
	compile_nasm factorial
	compile_c factorial
