#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int length;
    int data[];
} IntVector;

IntVector *vector_create(int length) {
    IntVector *v = malloc(sizeof(IntVector) + length * sizeof(int));
    if (!v) return NULL;
    v->length = length;
    for (int i = 0; i < length; i++) v->data[i] = 0;
    return v;
}

int vector_sum(const IntVector *v) {
    int sum = 0;
    for (int i = 0; i < v->length; i++) sum += v->data[i];
    return sum;
}

int main(void) {
    IntVector *v = vector_create(5);
    for (int i = 0; i < v->length; i++) v->data[i] = i + 1;

    printf("length=%d sum=%d\n", v->length, vector_sum(v));
    printf("struct size (no data): %zu, allocated size: %zu\n",
           sizeof(IntVector), sizeof(IntVector) + v->length * sizeof(int));

    free(v);
    return 0;
}
