#include <stdio.h>
#include <string.h>

#define CAP 16

struct slot { char key[16]; int value; int used; };
static struct slot table[CAP];

static unsigned hash(const char *s) {
    unsigned h = 5381;
    while (*s) h = h * 33 + (unsigned char)*s++;
    return h;
}

static int put(const char *key, int value) {
    unsigned i = hash(key) % CAP;
    for (int n = 0; n < CAP; n++, i = (i + 1) % CAP) {
        if (!table[i].used || strcmp(table[i].key, key) == 0) {
            strncpy(table[i].key, key, sizeof table[i].key - 1);
            table[i].value = value;
            table[i].used = 1;
            return 0;
        }
    }
    return -1; /* full */
}

static int *get(const char *key) {
    unsigned i = hash(key) % CAP;
    for (int n = 0; n < CAP && table[i].used; n++, i = (i + 1) % CAP)
        if (strcmp(table[i].key, key) == 0) return &table[i].value;
    return NULL;
}

int main(void) {
    put("apple", 3);
    put("pear", 5);
    put("apple", 9);
    int *v = get("apple");
    printf("apple=%d pear=%d kiwi=%s\n", *v, *get("pear"), get("kiwi") ? "found" : "missing");
    return 0;
}
