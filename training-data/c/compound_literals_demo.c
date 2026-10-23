#include <stdio.h>

/* C99 compound literals create unnamed objects in place, and designated
 * initializers name the members being set. Together they allow passing
 * temporary structs and arrays without declaring variables first. */
struct point {
    int x;
    int y;
};

struct rect {
    struct point top_left;
    struct point bottom_right;
};

static int area(struct rect r) {
    return (r.bottom_right.x - r.top_left.x) *
           (r.bottom_right.y - r.top_left.y);
}

static int sum(const int *values, int n) {
    int total = 0;
    for (int i = 0; i < n; i++) total += values[i];
    return total;
}

int main(void) {
    /* Struct compound literal passed by value. */
    int a = area((struct rect){ .top_left = {0, 0}, .bottom_right = {4, 3} });
    printf("area = %d\n", a);

    /* Array compound literal decays to a pointer. */
    printf("sum = %d\n", sum((int[]){5, 10, 15, 20}, 4));

    /* Designated array initializer: unlisted elements are zero. */
    int sparse[8] = { [1] = 10, [4] = 40, [7] = 70 };
    for (int i = 0; i < 8; i++) printf("%d ", sparse[i]);
    printf("\n");

    /* A pointer to a compound literal is valid for the enclosing block. */
    struct point *p = &(struct point){ .y = 9, .x = 2 };
    p->x += 1;
    printf("p = (%d, %d)\n", p->x, p->y);
    return 0;
}
