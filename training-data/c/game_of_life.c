#include <stdio.h>
#include <string.h>

#define W 10
#define H 8

static int neighbours(const unsigned char g[H][W], int r, int c) {
    int n = 0;
    for (int dr = -1; dr <= 1; dr++)
        for (int dc = -1; dc <= 1; dc++) {
            if (!dr && !dc) continue;
            int rr = (r + dr + H) % H, cc = (c + dc + W) % W; /* toroidal */
            n += g[rr][cc];
        }
    return n;
}

void step(unsigned char g[H][W]) {
    unsigned char next[H][W];
    for (int r = 0; r < H; r++)
        for (int c = 0; c < W; c++) {
            int n = neighbours((const unsigned char(*)[W])g, r, c);
            next[r][c] = (unsigned char)(n == 3 || (g[r][c] && n == 2));
        }
    memcpy(g, next, sizeof next);
}

int main(void) {
    unsigned char g[H][W] = {{0}};
    g[0][1] = g[1][2] = g[2][0] = g[2][1] = g[2][2] = 1; /* glider */
    for (int gen = 0; gen < 3; gen++) {
        printf("gen %d\n", gen);
        for (int r = 0; r < H; r++) {
            for (int c = 0; c < W; c++) putchar(g[r][c] ? '#' : '.');
            putchar('\n');
        }
        step(g);
    }
    return 0;
}
