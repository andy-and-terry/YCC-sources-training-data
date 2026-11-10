#include <stdio.h>

static int pieces(int cuts) { return (cuts * cuts + cuts + 2) / 2; }

int main(void) {
    for (int n = 0; n < 10; n++) printf("%d ", pieces(n));
    printf("\n"); /* 1 2 4 7 11 16 22 29 37 46 */
    return 0;
}
