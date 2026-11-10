#include <stdio.h>

#define LIMIT 80

int main(void) {
    char composite[LIMIT + 1] = {0};
    for (int i = 2; i * i <= LIMIT; i++)
        if (!composite[i])
            for (int j = i * i; j <= LIMIT; j += i) composite[j] = 1;
    for (int p = 3; p + 2 <= LIMIT; p++)
        if (!composite[p] && !composite[p + 2]) printf("(%d,%d) ", p, p + 2);
    printf("\n"); /* (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73) */
    return 0;
}
