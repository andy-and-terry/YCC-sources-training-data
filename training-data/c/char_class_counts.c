#include <stdio.h>
#include <ctype.h>

int main(void) {
    const char *s = "Hello, World! 2024 -- C is fun.";
    int up = 0, lo = 0, dg = 0, sp = 0, pu = 0;
    for (const char *p = s; *p; p++) {
        unsigned char c = (unsigned char)*p;
        if (isupper(c)) up++;
        else if (islower(c)) lo++;
        else if (isdigit(c)) dg++;
        else if (isspace(c)) sp++;
        else if (ispunct(c)) pu++;
    }
    printf("upper=%d lower=%d digit=%d space=%d punct=%d\n", up, lo, dg, sp, pu);
    return 0;
}
