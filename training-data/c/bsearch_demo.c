#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char name[16];
    int id;
} Employee;

int compare_ints(const void *a, const void *b) {
    int x = *(const int *)a;
    int y = *(const int *)b;
    return x - y;
}

int compare_employee_ids(const void *key, const void *element) {
    int target_id = *(const int *)key;
    const Employee *emp = element;
    return target_id - emp->id;
}

int compare_employees_by_id(const void *a, const void *b) {
    const Employee *ea = a;
    const Employee *eb = b;
    return ea->id - eb->id;
}

int main(void) {
    int numbers[] = {2, 4, 8, 15, 16, 23, 42, 91};
    int n = sizeof(numbers) / sizeof(numbers[0]);

    int targets[] = {16, 5, 91, 2};
    for (int i = 0; i < 4; i++) {
        int *found = bsearch(&targets[i], numbers, n, sizeof(int), compare_ints);
        if (found) printf("%d found at index %ld\n", targets[i], (long)(found - numbers));
        else printf("%d not found\n", targets[i]);
    }

    Employee staff[] = {
        {"Dan", 412}, {"Alice", 101}, {"Carol", 310}, {"Bob", 205}
    };
    int staff_count = sizeof(staff) / sizeof(staff[0]);
    qsort(staff, staff_count, sizeof(Employee), compare_employees_by_id);

    int lookup_id = 310;
    Employee *match = bsearch(&lookup_id, staff, staff_count, sizeof(Employee), compare_employee_ids);
    if (match) printf("employee %d -> %s\n", lookup_id, match->name);
    else printf("employee %d not found\n", lookup_id);

    return 0;
}
