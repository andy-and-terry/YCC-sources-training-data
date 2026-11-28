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
    struct str *s = make("flexible");
    printf("%zu %s\n", s->len, s->data);
    free(s);
    return 0;
}
