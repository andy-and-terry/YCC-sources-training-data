#include <stdio.h>
#include <stdint.h>
#include <stdalign.h>

/* C11 alignas forces a stricter alignment than the type needs,
 * e.g. to match a cache line or SIMD register width. */
struct sample {
    char tag;
    alignas(16) double value;
};

int main(void) {
    alignas(64) static char buffer[128];

    printf("alignof(double) = %zu\n", alignof(double));
    printf("alignof(struct sample) = %zu\n", alignof(struct sample));
    printf("sizeof(struct sample) = %zu\n", sizeof(struct sample));
    printf("buffer %% 64 = %zu\n", (size_t)((uintptr_t)buffer % 64));
    return 0;
}
