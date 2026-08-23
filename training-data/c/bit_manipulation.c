#include <stdio.h>

int count_set_bits(unsigned int n) {
    int count = 0;
    while (n) {
        count += n & 1;
        n >>= 1;
    }
    return count;
}

int is_power_of_two(unsigned int n) {
    return n > 0 && (n & (n - 1)) == 0;
}

int main(void) {
    printf("%d\n", count_set_bits(13));
    printf("%d\n", is_power_of_two(16));
    printf("%d\n", is_power_of_two(18));
    return 0;
}
