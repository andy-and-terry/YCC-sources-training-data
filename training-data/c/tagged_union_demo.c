#include <stdio.h>

typedef enum { SHAPE_CIRCLE, SHAPE_RECTANGLE } ShapeKind;

typedef struct {
    ShapeKind kind;
    union {
        struct { double radius; } circle;
        struct { double width, height; } rectangle;
    } as;
} Shape;

double shape_area(const Shape *s) {
    switch (s->kind) {
        case SHAPE_CIRCLE:
            return 3.14159 * s->as.circle.radius * s->as.circle.radius;
        case SHAPE_RECTANGLE:
            return s->as.rectangle.width * s->as.rectangle.height;
    }
    return 0.0;
}

int main(void) {
    Shape shapes[2];
    shapes[0].kind = SHAPE_CIRCLE;
    shapes[0].as.circle.radius = 2.0;

    shapes[1].kind = SHAPE_RECTANGLE;
    shapes[1].as.rectangle.width = 3.0;
    shapes[1].as.rectangle.height = 4.0;

    for (int i = 0; i < 2; i++) {
        printf("shape %d area = %.2f (union size = %zu bytes)\n",
               i, shape_area(&shapes[i]), sizeof(shapes[i].as));
    }

    return 0;
}
