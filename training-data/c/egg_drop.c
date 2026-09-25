#include <stdio.h>

int egg_drop(int eggs, long long floors) {
    long long f[64] = {0};
    int moves = 0;
    if (eggs > 63) eggs = 63;
    while (f[eggs] < floors) {
        moves++;
        for (int e = eggs; e > 0; e--) f[e] = f[e] + f[e - 1] + 1;
    }
    return moves;
}

int main(void) {
    printf("%d %d %d %d\n", egg_drop(1, 10), egg_drop(2, 100), egg_drop(3, 1000), egg_drop(20, 1000000000000LL));
    return 0;
}
