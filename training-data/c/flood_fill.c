#include <stdio.h>

#define H 5
#define W 8

/* Recursive 4-way flood fill; returns number of cells painted. */
int flood_fill(char g[H][W + 1], int r, int c, char target, char color) {
    if (r < 0 || r >= H || c < 0 || c >= W || g[r][c] != target) return 0;
    g[r][c] = color;
    return 1 + flood_fill(g, r + 1, c, target, color) + flood_fill(g, r - 1, c, target, color) +
           flood_fill(g, r, c + 1, target, color) + flood_fill(g, r, c - 1, target, color);
}

int main(void) {
    char g[H][W + 1] = {"..####..", ".#....#.", ".#....#.", ".#....#.", "..####.."};
    int n = flood_fill(g, 2, 3, '.', 'o');
    printf("painted %d\n", n);
    for (int r = 0; r < H; r++) printf("%s\n", g[r]);
    return 0;
}
