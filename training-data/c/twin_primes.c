#include <stdio.h>
#include <stdbool.h>

#define N 50

int main(void) {
    bool composite[N + 1] = {false};
    for (int i = 2; i * i <= N; i++)
        if (!composite[i])
            for (int j = i * i; j <= N; j += i) composite[j] = true;
    for (int p = 3; p + 2 <= N; p++)
        if (!composite[p] && !composite[p + 2]) printf("(%d, %d) ", p, p + 2);
    printf("\n");
    return 0;
}
