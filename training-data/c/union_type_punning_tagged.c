#include <stdio.h>

/* Tagged union: the tag records which member is active. */
struct value {
    enum { INT, DOUBLE, STR } tag;
    union { int i; double d; const char *s; } as;
};

static void print_value(struct value v) {
    switch (v.tag) {
    case INT:    printf("int %d\n", v.as.i); break;
    case DOUBLE: printf("double %.2f\n", v.as.d); break;
    case STR:    printf("str %s\n", v.as.s); break;
    }
}

int main(void) {
    struct value vs[] = {{INT, {.i = 4}}, {DOUBLE, {.d = 2.5}}, {STR, {.s = "hi"}}};
    for (int i = 0; i < 3; i++) print_value(vs[i]);
    return 0;
}
