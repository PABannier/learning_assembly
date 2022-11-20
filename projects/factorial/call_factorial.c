#include <stdio.h>
#include <inttypes.h>


uint64_t factorial(uint64_t n);


int main() {
    for (uint64_t i = 0; i < 10; i++) {
        printf("factorial(%2lu) = %lu\n", i, factorial(i));
    }
    return 0;
}
