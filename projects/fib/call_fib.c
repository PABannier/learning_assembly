#include <stdio.h>
#include <inttypes.h>


uint64_t fib(uint64_t n);


int main() {
    for(uint64_t i = 0; i < 20; i++) {
        printf("fib(%2lu) = %lu\n", i, fib(i));
    }

    return 0;
}
