#include <stdio.h>

int main(void) {
    for (double y = -1.0; y <= 1.0; y += 0.2) {
        for (double x = -2.0; x <= 0.6; x += 0.05) {
            double zr = 0, zi = 0;
            int n = 0;
            while (n < 30 && zr * zr + zi * zi < 4) {
                double t = zr * zr - zi * zi + x;
                zi = 2 * zr * zi + y;
                zr = t;
                n++;
            }
            putchar(n == 30 ? '#' : '.');
        }
        putchar('\n');
    }
    return 0;
}
