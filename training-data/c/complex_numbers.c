#include <complex.h>
#include <math.h>
#include <stdio.h>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

/* In-place iterative radix-2 FFT using C99 complex numbers. */
void fft(double complex *a, int n) {
    for (int i = 1, j = 0; i < n; i++) {
        int bit = n >> 1;
        for (; j & bit; bit >>= 1) j ^= bit;
        j ^= bit;
        if (i < j) {
            double complex t = a[i];
            a[i] = a[j];
            a[j] = t;
        }
    }
    for (int len = 2; len <= n; len <<= 1) {
        double complex w = cexp(-2.0 * M_PI * I / len);
        for (int i = 0; i < n; i += len) {
            double complex wn = 1;
            for (int k = 0; k < len / 2; k++) {
                double complex u = a[i + k], v = a[i + k + len / 2] * wn;
                a[i + k] = u + v;
                a[i + k + len / 2] = u - v;
                wn *= w;
            }
        }
    }
}

int main(void) {
    double complex z1 = 3 + 4 * I, z2 = 1 - 2 * I;
    double complex p = z1 * z2, q = z1 / z2;
    printf("z1*z2 = %.1f%+.1fi, z1/z2 = %.1f%+.1fi, |z1| = %.1f\n", creal(p), cimag(p), creal(q), cimag(q), cabs(z1));
    double complex e = cexp(I * M_PI);
    printf("e^(i*pi) = %.3f%+.3fi\n", creal(e), cimag(e));
    double complex sig[8] = {1, 1, 1, 1, 0, 0, 0, 0};
    fft(sig, 8);
    for (int i = 0; i < 8; i++) printf("X[%d] = %6.3f%+6.3fi\n", i, creal(sig[i]), cimag(sig[i]));
    return 0;
}
