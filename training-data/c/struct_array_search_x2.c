#include <stdio.h>
#include <string.h>

struct Item { const char *k; int v; };

static int lookup(const struct Item *t, int n, const char *k) {
    for (int i = 0; i < n; i++) if (!strcmp(t[i].k, k)) return t[i].v;
    return -1;
}

int main(void) {
    struct Item t[] = { {"a", 1}, {"b", 2} };
    printf("%d %d\n", lookup(t, 2, "b"), lookup(t, 2, "z"));
    return 0;
}
