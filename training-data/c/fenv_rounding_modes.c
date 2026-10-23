#include <stdio.h>
#include <fenv.h>
#include <math.h>

#pragma STDC FENV_ACCESS ON

/* The floating point rounding mode can be switched at run time.
 * nearbyint() rounds according to the current mode. Compile with -lm. */
static void show(const char *label, int mode, double x) {
    fesetround(mode);
    printf("%-12s nearbyint(%5.1f) = %4.1f\n", label, x, nearbyint(x));
}

int main(void) {
    double values[] = {2.5, 3.5, -2.5, 2.7, -2.7};
    int n = (int)(sizeof values / sizeof values[0]);

    for (int i = 0; i < n; i++) {
        show("to-nearest", FE_TONEAREST, values[i]);
        show("upward", FE_UPWARD, values[i]);
        show("downward", FE_DOWNWARD, values[i]);
        show("toward-zero", FE_TOWARDZERO, values[i]);
        printf("\n");
    }

    fesetround(FE_TONEAREST);
    printf("restored mode is nearest: %d\n", fegetround() == FE_TONEAREST);
    return 0;
}
