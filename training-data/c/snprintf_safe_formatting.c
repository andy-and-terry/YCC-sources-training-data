#include <stdio.h>

int main(void) {
    char buf[16];
    int needed = snprintf(buf, sizeof buf, "value=%d name=%s", 12345, "truncated-example");
    printf("'%s' needed=%d truncated=%d\n", buf, needed, needed >= (int)sizeof buf);
    printf("%5.1f|%-6s|%06d|%x|%c|%%\n", 3.14159, "ab", 42, 255, 'z');
    return 0;
}
