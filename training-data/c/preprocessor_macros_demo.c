#include <stdio.h>

#define SQUARE(x) ((x) * (x))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define STRINGIFY(x) #x
#define CONCAT(a, b) a##b

int main(void) {
    int x = 5;
    printf("SQUARE(%d) = %d\n", x, SQUARE(x));
    printf("MAX(3, 7) = %d\n", MAX(3, 7));
    printf("STRINGIFY(hello) = %s\n", STRINGIFY(hello));

    int CONCAT(count, er) = 42;
    printf("counter = %d\n", counter);

    return 0;
}
