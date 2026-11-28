#include <stdio.h>

int main(void) {
    int seq[15] = {0, 1};
    for (int i = 2; i < 15; i++)
        seq[i] = (i % 2 == 0) ? seq[i / 2] : seq[i / 2] + seq[i / 2 + 1];
    for (int i = 0; i < 15; i++) printf("%d ", seq[i]);
    printf("\n"); /* 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3 */
    return 0;
}
