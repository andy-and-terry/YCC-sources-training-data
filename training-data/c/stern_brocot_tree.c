#include <stdio.h>

static int gcd(int a, int b) { return b ? gcd(b, a % b) : a; }

int main(void) {
    int p = 3, q = 5;
    int g = gcd(p, q);
    p /= g; q /= g;
    int lp = 0, lq = 1, hp = 1, hq = 0;
    for (;;) {
        int mp = lp + hp, mq = lq + hq;
        if (mp == p && mq == q) break;
        if (p * mq < mp * q) { putchar('L'); hp = mp; hq = mq; }
        else { putchar('R'); lp = mp; lq = mq; }
    }
    putchar('\n');
    return 0;
}
