#include <stdio.h>
#include <string.h>

#define MAX_ITEMS 32

typedef struct {
    char sku[16];
    char name[32];
    int qty, reorder_level;
    long price_cents;
} item;

typedef struct {
    item items[MAX_ITEMS];
    int count;
} inventory;

static item *find(inventory *inv, const char *sku) {
    for (int i = 0; i < inv->count; i++)
        if (strcmp(inv->items[i].sku, sku) == 0) return &inv->items[i];
    return NULL;
}

int add_product(inventory *inv, const char *sku, const char *name, long price, int reorder) {
    if (inv->count == MAX_ITEMS || find(inv, sku)) return -1;
    item *it = &inv->items[inv->count++];
    snprintf(it->sku, sizeof it->sku, "%s", sku);
    snprintf(it->name, sizeof it->name, "%s", name);
    it->price_cents = price;
    it->reorder_level = reorder;
    it->qty = 0;
    return 0;
}

long sell(inventory *inv, const char *sku, int qty) {
    item *it = find(inv, sku);
    if (!it || it->qty < qty) return -1;
    it->qty -= qty;
    return qty * it->price_cents;
}

int main(void) {
    inventory inv = {.count = 0};
    add_product(&inv, "A1", "apple", 50, 10);
    add_product(&inv, "P1", "pear", 75, 5);
    find(&inv, "A1")->qty += 40;
    find(&inv, "P1")->qty += 8;
    long revenue = sell(&inv, "A1", 32) + sell(&inv, "P1", 2);
    printf("revenue: %ld.%02ld\n", revenue / 100, revenue % 100);
    printf("oversell attempt: %ld\n", sell(&inv, "P1", 100));
    for (int i = 0; i < inv.count; i++) {
        item *it = &inv.items[i];
        printf("%-6s qty=%-3d %s\n", it->name, it->qty, it->qty <= it->reorder_level ? "REORDER" : "");
    }
    return 0;
}
