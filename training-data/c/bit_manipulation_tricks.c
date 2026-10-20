#include <stdio.h>
#include <stdint.h>

static int popcount(uint32_t x) {
    int n = 0;
    while (x) { x &= x - 1; n++; }   /* clears lowest set bit */
    return n;
}

static int is_power_of_two(uint32_t x) { return x && !(x & (x - 1)); }
static uint32_t lowest_set_bit(uint32_t x) { return x & -x; }

int main(void) {
    printf("%d %d %d\n", popcount(0xF0F0u), is_power_of_two(64), is_power_of_two(65));
    printf("%u\n", lowest_set_bit(40));
    return 0;
}
