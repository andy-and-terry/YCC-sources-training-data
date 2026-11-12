#include <stdio.h>
#include <string.h>
int main(void) {
    char line[] = "a,b,,d";
    for (char *t = strtok(line, ","); t; t = strtok(NULL, ",")) printf("[%s]\n", t);
    return 0;
}
