#include <stdio.h>

#define CAPACITY 32

typedef struct {
    int data[CAPACITY];
    int size;
} MinHeap;

void swap(int *a, int *b) {
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

void heap_push(MinHeap *heap, int value) {
    int i = heap->size++;
    heap->data[i] = value;

    while (i > 0) {
        int parent = (i - 1) / 2;
        if (heap->data[parent] <= heap->data[i]) break;
        swap(&heap->data[parent], &heap->data[i]);
        i = parent;
    }
}

int heap_pop(MinHeap *heap) {
    int top = heap->data[0];
    heap->data[0] = heap->data[--heap->size];

    int i = 0;
    while (1) {
        int left = 2 * i + 1, right = 2 * i + 2, smallest = i;
        if (left < heap->size && heap->data[left] < heap->data[smallest]) smallest = left;
        if (right < heap->size && heap->data[right] < heap->data[smallest]) smallest = right;
        if (smallest == i) break;
        swap(&heap->data[i], &heap->data[smallest]);
        i = smallest;
    }
    return top;
}

int main(void) {
    MinHeap heap = {.size = 0};
    int values[] = {5, 2, 9, 1, 7, 3};
    for (int i = 0; i < 6; i++) heap_push(&heap, values[i]);

    while (heap.size > 0) printf("%d ", heap_pop(&heap));
    printf("\n");
    return 0;
}
