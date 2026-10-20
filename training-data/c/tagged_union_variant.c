#include <stdio.h>

enum Kind { INT, DBL, STR };
struct Value { enum Kind kind; union { long i; double d; const char *s; } as; };

static void print(struct Value v) {
    switch (v.kind) {
    case INT: printf("int %ld\n", v.as.i); break;
    case DBL: printf("dbl %.2f\n", v.as.d); break;
    case STR: printf("str %s\n", v.as.s); break;
    }
}

int main(void) {
    struct Value vs[] = { {INT, {.i = 7}}, {DBL, {.d = 2.5}}, {STR, {.s = "hi"}} };
    for (int i = 0; i < 3; i++) print(vs[i]);
    return 0;
}
