#include <stdint.h>
#include <stdio.h>
#include <string.h>

int hamming_str(const char *a, const char *b) {
    if (strlen(a) != strlen(b)) return -1;
    int d = 0;
    for (; *a; a++, b++) d += *a != *b;
    return d;
}

int popcount64(uint64_t x) {
    int c = 0;
    for (; x; x &= x - 1) c++;
    return c;
}

int hamming_int(uint64_t x, uint64_t y) { return popcount64(x ^ y); }

int main(void) {
    printf("%d %d %d %d\n", hamming_str("karolin", "kathrin"), hamming_str("abc", "ab"),
           hamming_int(1, 4), hamming_int(0xFFFFFFFFFFFFFFFFull, 0));
    return 0;
}
