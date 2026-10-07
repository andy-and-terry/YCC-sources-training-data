#include <stdio.h>

int main(void) {
    int a = 1, b = 2;

    const int *ptr_to_const = &a;     /* cannot modify *ptr_to_const */
    int *const const_ptr = &a;        /* cannot repoint const_ptr */
    const int *const both = &b;       /* neither */

    ptr_to_const = &b;                /* ok: pointer can move */
    *const_ptr = 10;                  /* ok: pointee can change */

    printf("a=%d b=%d\n", a, b);
    printf("*ptr_to_const=%d *const_ptr=%d *both=%d\n",
           *ptr_to_const, *const_ptr, *both);

    /* The following would not compile:
       *ptr_to_const = 5;
       const_ptr = &b;
       *both = 5;                                                     */
    return 0;
}
