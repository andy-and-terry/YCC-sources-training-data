#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
    FILE *f = fmemopen("alpha\nbeta gamma\n\nlast", 22, "r");
    char *line = NULL;
    size_t cap = 0;
    ssize_t n;
    while ((n = getline(&line, &cap, f)) != -1) {
        if (n && line[n - 1] == '\n') line[--n] = '\0';
        printf("[%zd] %s\n", n, line);
    }
    free(line);
    fclose(f);
    return 0;
}
