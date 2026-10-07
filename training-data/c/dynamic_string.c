#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char *data;
    size_t len, cap;
} dstr;

static void dstr_reserve(dstr *s, size_t extra) {
    if (s->len + extra + 1 <= s->cap) return;
    size_t cap = s->cap ? s->cap : 16;
    while (cap < s->len + extra + 1) cap *= 2;
    s->data = realloc(s->data, cap);
    s->cap = cap;
}

void dstr_appendf(dstr *s, const char *fmt, ...) {
    va_list ap, ap2;
    va_start(ap, fmt);
    va_copy(ap2, ap);
    int n = vsnprintf(NULL, 0, fmt, ap);
    va_end(ap);
    dstr_reserve(s, (size_t)n);
    vsnprintf(s->data + s->len, (size_t)n + 1, fmt, ap2);
    va_end(ap2);
    s->len += (size_t)n;
}

int main(void) {
    dstr s = {0};
    for (int i = 1; i <= 5; i++) dstr_appendf(&s, "%s%d^2=%d", i > 1 ? ", " : "", i, i * i);
    printf("%s (len=%zu cap=%zu)\n", s.data, s.len, s.cap);
    free(s.data);
    return 0;
}
