#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define B 8
typedef struct E { char *k; int v; struct E *n; } E;
static E *tab[B];

static unsigned h(const char *s) { unsigned x = 5381; while (*s) x = x * 33 + *s++; return x % B; }
static void put(const char *k, int v) {
    E *e = malloc(sizeof *e);
    e->k = strdup(k); e->v = v; e->n = tab[h(k)]; tab[h(k)] = e;
}
static int get(const char *k) {
    for (E *e = tab[h(k)]; e; e = e->n) if (!strcmp(e->k, k)) return e->v;
    return -1;
}

int main(void) { put("a", 1); put("b", 2); printf("%d %d %d\n", get("a"), get("b"), get("z")); return 0; }
