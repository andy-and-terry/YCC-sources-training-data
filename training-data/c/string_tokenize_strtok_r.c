#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <string.h>

int main(void) {
    char line[] = "alpha,beta;gamma,delta";
    char *save = NULL;
    for (char *tok = strtok_r(line, ",;", &save); tok; tok = strtok_r(NULL, ",;", &save))
        printf("[%s]\n", tok);
    return 0;
}
