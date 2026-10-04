#include <stdio.h>

int main(void) {
    const char *line = "alice 30 55000.50";
    char name[32];
    int age;
    double salary;

    int n = sscanf(line, "%31s %d %lf", name, &age, &salary);
    printf("fields parsed: %d\n", n);
    printf("name=%s age=%d salary=%.2f\n", name, age, salary);

    int y, m, d;
    if (sscanf("2024-05-17", "%d-%d-%d", &y, &m, &d) == 3) {
        printf("date: %02d/%02d/%04d\n", d, m, y);
    }

    unsigned int r, g, b;
    if (sscanf("#FF8040", "#%2x%2x%2x", &r, &g, &b) == 3) {
        printf("rgb: %u %u %u\n", r, g, b);
    }

    /* %n records the number of characters consumed so far */
    int used = 0;
    int a, c;
    sscanf("10,20 rest", "%d,%d%n", &a, &c, &used);
    printf("a=%d c=%d consumed=%d\n", a, c, used);

    /* scanset: read up to the first comma */
    char key[16];
    if (sscanf("color=blue", "%15[^=]", key) == 1) {
        printf("key=%s\n", key);
    }

    /* failed conversion returns the number of successful ones */
    int bad;
    n = sscanf("abc", "%d", &bad);
    printf("bad parse returned %d\n", n);
    return 0;
}
