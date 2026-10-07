#include <stdio.h>
#include <string.h>

int main(void) {
    char text[] = "red,green,blue,,yellow";
    char *token = strtok(text, ",");
    while (token != NULL) {
        printf("[%s]\n", token);
        token = strtok(NULL, ",");
    }
    return 0;
}
