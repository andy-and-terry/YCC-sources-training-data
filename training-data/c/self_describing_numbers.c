#include <stdio.h>


#include <string.h>

int is_self_describing(const char *s) {
    int len = (int)strlen(s);
    for (int i = 0; i < len; i++) {
        int count = 0;
        for (int j = 0; j < len; j++)
            if (s[j] - '0' == i) count++;
        if (count != s[i] - '0') return 0;
    }
    return 1;
}

int main(void) {
    const char *values[] = {"1210", "2020", "21200", "1211"};
    for (int i = 0; i < 4; i++)
        printf("%s %s\n", values[i], is_self_describing(values[i]) ? "true" : "false");
    return 0;
}
