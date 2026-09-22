#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char name[16];
    int age;
} Person;

int compare_ints_asc(const void *a, const void *b) {
    int x = *(const int *)a;
    int y = *(const int *)b;
    return x - y;
}

int compare_ints_desc(const void *a, const void *b) {
    return compare_ints_asc(b, a);
}

int compare_people_by_age(const void *a, const void *b) {
    const Person *pa = a;
    const Person *pb = b;
    return pa->age - pb->age;
}

int main(void) {
    int numbers[] = {5, 2, 9, 1, 5, 6};
    int n = sizeof(numbers) / sizeof(numbers[0]);

    qsort(numbers, n, sizeof(int), compare_ints_asc);
    for (int i = 0; i < n; i++) printf("%d ", numbers[i]);
    printf("\n");

    qsort(numbers, n, sizeof(int), compare_ints_desc);
    for (int i = 0; i < n; i++) printf("%d ", numbers[i]);
    printf("\n");

    Person people[] = {{"Alice", 30}, {"Bob", 25}, {"Carol", 40}};
    int p = sizeof(people) / sizeof(people[0]);
    qsort(people, p, sizeof(Person), compare_people_by_age);
    for (int i = 0; i < p; i++) printf("%s(%d) ", people[i].name, people[i].age);
    printf("\n");

    return 0;
}
