ARCH=macho64


dir_factorial:=projects/factorial

factorial:
	nasm -f $(ARCH) $(dir_factorial)/factorial.asm
	ld -e "_factorial" -static -o $(dir_factorial)/factorial $(dir_factorial)/factorial.o
	gcc $(dir_factorial)/call_factorial.c $(dir_factorial)/factorial.o -o $(dir_factorial)/factorial.out


dir_fib:=projects/fib

fib:
	nasm -f $(ARCH) $(dir_fib)/factorial.asm
	ld -e "_fib" -static -o $(dir_fib)/factorial $(dir_fib)/factorial.o
	gcc $(dir_fib)/call_factorial.c $(dir_fib)/factorial.o -o $(dir_fib)/factorial.out


dir_filled_sq:=projects/filled_square

filled_square:
	sasm -f $(ARCH) $(dir_filled_sq)/factorial.asm
	ld -e "_fib" -static -o $(dir_filled_sq)/factorial $(dir_filled_sq)/factorial.o
	gcc $(dir_filled_sq)/call_factorial.c $(dir_filled_sq)/factorial.o -o $(dir_filled_sq)/factorial.out


dir_hello_world:=projects/hello_world
dir_mo3:=projects/max_of_three
dir_merge_sort:=projects/merge_sort
dir_sum:=projects/sum

hello_world:
	nasm -f $(ARCH) $(dir_hello_world)/factorial.asm
	ld -e "_fib" -static -o $(dir_hello_world)/factorial $(dir_fib)/factorial.o
	gcc $(dir_hello_world)/call_factorial.c $(dir_fib)/factorial.o -o $(dir_fib)/factorial.out


fib:
	nasm -f $(ARCH) $(dir_fib)/factorial.asm
	ld -e "_fib" -static -o $(dir_fib)/factorial $(dir_fib)/factorial.o
	gcc $(dir_fib)/call_factorial.c $(dir_fib)/factorial.o -o $(dir_fib)/factorial.out


fib:
	nasm -f $(ARCH) $(dir_fib)/factorial.asm
	ld -e "_fib" -static -o $(dir_fib)/factorial $(dir_fib)/factorial.o
	gcc $(dir_fib)/call_factorial.c $(dir_fib)/factorial.o -o $(dir_fib)/factorial.out


fib:
	nasm -f $(ARCH) $(dir_fib)/factorial.asm
	ld -e "_fib" -static -o $(dir_fib)/factorial $(dir_fib)/factorial.o
	gcc $(dir_fib)/call_factorial.c $(dir_fib)/factorial.o -o $(dir_fib)/factorial.out

