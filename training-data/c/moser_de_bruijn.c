#include <stdio.h>

static unsigned long moser_de_bruijn(unsigned i) {
    unsigned long value = 0, power = 1;
    for (; i; i >>= 1) {
        if (i & 1) value += power;
        power *= 4;
    }
    return value;
}

int main(void) {
    for (unsigned i = 0; i < 10; i++) printf("%lu ", moser_de_bruijn(i));
    printf("\n"); /* 0 1 4 5 16 17 20 21 64 65 */
    return 0;
}
