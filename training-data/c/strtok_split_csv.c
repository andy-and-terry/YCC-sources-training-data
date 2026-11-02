#include <stdio.h>
#include <string.h>

int main(void) {
    char line[] = "alpha,beta,gamma";
    for (char *t = strtok(line, ","); t; t = strtok(NULL, ",")) puts(t);
    return 0;
}
