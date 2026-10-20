#include <stdio.h>
#include <string.h>

#define CAP 16
struct Slot { char key[16]; int val; int used; };
static struct Slot tbl[CAP];

static unsigned hash(const char *s) { unsigned h = 5381; while (*s) h = h * 33 + (unsigned char)*s++; return h; }

static void put(const char *k, int v) {
    unsigned i = hash(k) % CAP;
    while (tbl[i].used && strcmp(tbl[i].key, k)) i = (i + 1) % CAP;
    strncpy(tbl[i].key, k, 15); tbl[i].val = v; tbl[i].used = 1;
}

static int *get(const char *k) {
    unsigned i = hash(k) % CAP;
    for (int n = 0; n < CAP && tbl[i].used; n++, i = (i + 1) % CAP)
        if (!strcmp(tbl[i].key, k)) return &tbl[i].val;
    return NULL;
}

int main(void) {
    put("one", 1); put("two", 2); put("one", 11);
    printf("%d %d %p\n", *get("one"), *get("two"), (void *)get("zzz"));
    return 0;
}
