#include <stdio.h>
#include <string.h>
#include <stdint.h>

#define N 100
static uint8_t bits[(N + 8) / 8];

#define SET(i)   (bits[(i) >> 3] |= (uint8_t)(1u << ((i) & 7)))
#define TEST(i)  (bits[(i) >> 3] & (1u << ((i) & 7)))

int main(void) {
    memset(bits, 0, sizeof bits);
    for (int i = 2; i * i <= N; i++)
        if (!TEST(i))
            for (int j = i * i; j <= N; j += i) SET(j);
    for (int i = 2; i <= N; i++)
        if (!TEST(i)) printf("%d ", i);
    printf("\n");
    return 0;
}
