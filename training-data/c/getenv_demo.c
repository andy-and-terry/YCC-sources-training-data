#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>

int main(void) {
    const char *home = getenv("HOME");
    printf("HOME = %s\n", home ? home : "(unset)");

    setenv("APP_MODE", "debug", 1);   /* overwrite = 1 */
    printf("APP_MODE = %s\n", getenv("APP_MODE"));

    unsetenv("APP_MODE");
    printf("after unset: %s\n", getenv("APP_MODE") ? "set" : "unset");
    return 0;
}
