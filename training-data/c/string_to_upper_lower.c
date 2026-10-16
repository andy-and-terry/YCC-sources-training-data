#include <stdio.h>
#include <ctype.h>

static void transform(char *s, int (*f)(int)) {
    for (; *s; s++) *s = (char)f((unsigned char)*s);
}

int main(void) {
    char a[] = "Mixed Case 123";
    char b[] = "Mixed Case 123";
    transform(a, toupper);
    transform(b, tolower);
    printf("%s\n%s\n", a, b);
    return 0;
}
