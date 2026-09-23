#include <stdio.h>

/* Simulates a multi-file, modular design in a single translation unit:
 * each "module" implements a common interface through a function-pointer
 * table, and calling code depends only on that interface. */

typedef struct {
    const char *name;
    double (*area)(double a, double b);
    double (*perimeter)(double a, double b);
} ShapeModule;

double rectangle_area(double w, double h) {
    return w * h;
}

double rectangle_perimeter(double w, double h) {
    return 2 * (w + h);
}

double triangle_area(double base, double height) {
    return 0.5 * base * height;
}

double triangle_perimeter(double a, double b) {
    /* Illustrative only: treats a, b as two sides plus an implied base. */
    return a + b + (a > b ? a : b);
}

const ShapeModule rectangle_module = {"rectangle", rectangle_area, rectangle_perimeter};
const ShapeModule triangle_module = {"triangle", triangle_area, triangle_perimeter};

void describe_shape(const ShapeModule *module, double a, double b) {
    printf("%s: area=%.2f perimeter=%.2f\n",
           module->name, module->area(a, b), module->perimeter(a, b));
}

int main(void) {
    const ShapeModule *modules[] = {&rectangle_module, &triangle_module};
    double dims[2][2] = {{4.0, 5.0}, {6.0, 3.0}};

    for (int i = 0; i < 2; i++) {
        describe_shape(modules[i], dims[i][0], dims[i][1]);
    }
    return 0;
}
