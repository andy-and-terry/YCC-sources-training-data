#include <stdio.h>

typedef struct {
    unsigned int is_readable : 1;
    unsigned int is_writable : 1;
    unsigned int is_executable : 1;
    unsigned int permission_level : 4;
} FilePermissions;

void print_permissions(FilePermissions p) {
    printf("r=%u w=%u x=%u level=%u size=%zu bytes\n",
           p.is_readable, p.is_writable, p.is_executable,
           p.permission_level, sizeof(FilePermissions));
}

int main(void) {
    FilePermissions perms = {0};
    perms.is_readable = 1;
    perms.is_writable = 1;
    perms.is_executable = 0;
    perms.permission_level = 7;

    print_permissions(perms);

    perms.is_executable = 1;
    perms.permission_level = 15;
    print_permissions(perms);

    return 0;
}
