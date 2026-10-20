#include <stdio.h>
#include <string.h>

int main(void) {
    char line[] = "key1=val1;key2=val2;key3=val3";
    char *save1;
    for (char *kv = strtok_r(line, ";", &save1); kv; kv = strtok_r(NULL, ";", &save1)) {
        char *save2;
        char *k = strtok_r(kv, "=", &save2);
        char *v = strtok_r(NULL, "=", &save2);
        printf("%s => %s\n", k, v);
    }
    return 0;
}
