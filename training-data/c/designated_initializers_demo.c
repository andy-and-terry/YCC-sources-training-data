#include <stdio.h>

typedef struct {
    int id;
    const char *name;
    double price;
} Product;

int main(void) {
    Product p = {.name = "Widget", .price = 9.99, .id = 1001};
    printf("id=%d name=%s price=%.2f\n", p.id, p.name, p.price);

    int sparse[10] = {[2] = 20, [5] = 50, [9] = 90};
    for (int i = 0; i < 10; i++) printf("%d ", sparse[i]);
    printf("\n");

    Product catalog[] = {
        [0] = {.id = 1, .name = "A", .price = 1.5},
        [2] = {.id = 3, .name = "C", .price = 3.5},
    };
    for (int i = 0; i < 3; i++) {
        printf("slot %d: id=%d name=%s\n", i, catalog[i].id,
               catalog[i].name ? catalog[i].name : "(empty)");
    }

    return 0;
}
