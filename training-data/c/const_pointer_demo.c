#include <stdio.h>

int main(void) {
    int a = 1, b = 2;
    const int *p1 = &a;        /* pointer to const int: cannot modify *p1 */
    int *const p2 = &a;        /* const pointer: cannot reseat p2 */
    const int *const p3 = &a;  /* neither */

    p1 = &b;                   /* ok */
    *p2 = 10;                  /* ok */
    /* *p1 = 5;  error: assignment of read-only location */
    /* p2 = &b;  error: assignment of read-only variable */
    printf("*p1=%d *p2=%d *p3=%d a=%d\n", *p1, *p2, *p3, a);
    return 0;
}
