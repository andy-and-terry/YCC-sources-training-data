#include <stdio.h>
#include <stddef.h>

struct Packet {
    char tag;
    int  id;
    char flag;
    double value;
};

int main(void) {
    printf("tag   @ %zu\n", offsetof(struct Packet, tag));
    printf("id    @ %zu\n", offsetof(struct Packet, id));
    printf("flag  @ %zu\n", offsetof(struct Packet, flag));
    printf("value @ %zu\n", offsetof(struct Packet, value));
    printf("total   %zu\n", sizeof(struct Packet));
    return 0;
}
