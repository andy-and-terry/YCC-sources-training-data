#include <stdio.h>

typedef enum { CELSIUS, FAHRENHEIT, KELVIN } unit_t;

static double to_c(double v, unit_t u) {
    switch (u) {
        case FAHRENHEIT: return (v - 32) * 5 / 9;
        case KELVIN: return v - 273.15;
        default: return v;
    }
}

static double from_c(double v, unit_t u) {
    switch (u) {
        case FAHRENHEIT: return v * 9 / 5 + 32;
        case KELVIN: return v + 273.15;
        default: return v;
    }
}

double convert(double v, unit_t from, unit_t to) { return from_c(to_c(v, from), to); }

int main(void) {
    printf("%.2f %.2f\n", convert(100, CELSIUS, FAHRENHEIT), convert(212, FAHRENHEIT, KELVIN));
    return 0;
}
