#include <stdio.h>
#include <stdlib.h>

typedef struct {
    const char *name;
    double value, weight;
} item;

static int by_ratio_desc(const void *a, const void *b) {
    const item *x = a, *y = b;
    double rx = x->value / x->weight, ry = y->value / y->weight;
    return (rx < ry) - (rx > ry);
}

double fractional_knapsack(item *items, int n, double capacity) {
    qsort(items, (size_t)n, sizeof *items, by_ratio_desc);
    double total = 0;
    for (int i = 0; i < n && capacity > 0; i++) {
        double take = items[i].weight < capacity ? items[i].weight : capacity;
        total += items[i].value * take / items[i].weight;
        capacity -= take;
        printf("take %.1f of %s\n", take, items[i].name);
    }
    return total;
}

int main(void) {
    item items[] = {{"gold", 60, 10}, {"silver", 100, 20}, {"bronze", 120, 30}};
    printf("total %.2f\n", fractional_knapsack(items, 3, 50));
    return 0;
}
