#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct str { size_t len; char data[]; };

static struct str *make(const char *s) {
    size_t n = strlen(s);
    struct str *p = malloc(sizeof *p + n + 1);
    p->len = n;
    memcpy(p->data, s, n + 1);
    return p;
}

int main(void) {
    struct str *p = make("flex");
    printf("%zu %s\n", p->len, p->data);
    free(p);
    return 0;
}
