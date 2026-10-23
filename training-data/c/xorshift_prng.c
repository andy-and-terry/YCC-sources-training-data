#include <stdio.h>
#include <stdint.h>

static uint32_t state = 2463534242u;

static uint32_t xorshift32(void) {
    state ^= state << 13;
    state ^= state >> 17;
    state ^= state << 5;
    return state;
}

int main(void) {
    for (int i = 0; i < 5; i++) printf("%u\n", xorshift32());
    for (int i = 0; i < 5; i++) printf("%d ", (int)(xorshift32() % 6) + 1);
    printf("\n");
    return 0;
}
