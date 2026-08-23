#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int *data;
    int size;
    int capacity;
} DynArray;

void da_init(DynArray *arr) {
    arr->size = 0;
    arr->capacity = 2;
    arr->data = malloc(arr->capacity * sizeof(int));
}

void da_push(DynArray *arr, int value) {
    if (arr->size >= arr->capacity) {
        arr->capacity *= 2;
        arr->data = realloc(arr->data, arr->capacity * sizeof(int));
    }
    arr->data[arr->size++] = value;
}

int main(void) {
    DynArray arr;
    da_init(&arr);
    for (int i = 1; i <= 5; i++) da_push(&arr, i * 10);
    for (int i = 0; i < arr.size; i++) printf("%d ", arr.data[i]);
    printf("\n");
    free(arr.data);
    return 0;
}
