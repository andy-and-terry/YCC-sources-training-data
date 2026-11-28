#include <stdio.h>

int main(void) {
    int nums[] = {4, 1, 2, 1, 2};
    int acc = 0;
    for (size_t i = 0; i < sizeof nums / sizeof nums[0]; i++) acc ^= nums[i];
    printf("%d\n", acc); /* 4 */
    return 0;
}
