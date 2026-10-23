#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    size_t len;
    char data[];
} Blob;

static Blob *blob_new(const char *s) {
    size_t n = strlen(s);
    Blob *b = malloc(sizeof *b + n + 1);
    if (!b) return NULL;
    b->len = n;
    memcpy(b->data, s, n + 1);
    return b;
}

int main(void) {
    Blob *b = blob_new("flexible");
    printf("len=%zu data=%s sizeof=%zu\n", b->len, b->data, sizeof(Blob));
    free(b);
    return 0;
}
