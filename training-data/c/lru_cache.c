#include <stdio.h>

#define CAP 2

int keys[CAP], values[CAP], size = 0;

int get(int key) {
    for (int i = 0; i < size; i++) {
        if (keys[i] == key) {
            int val = values[i];
            int k = keys[i], v = values[i];
            for (int j = i; j < size - 1; j++) {
                keys[j] = keys[j + 1];
                values[j] = values[j + 1];
            }
            keys[size - 1] = k;
            values[size - 1] = v;
            return val;
        }
    }
    return -1;
}

void put(int key, int value) {
    for (int i = 0; i < size; i++) {
        if (keys[i] == key) {
            values[i] = value;
            return;
        }
    }
    if (size >= CAP) {
        for (int j = 0; j < size - 1; j++) {
            keys[j] = keys[j + 1];
            values[j] = values[j + 1];
        }
        size--;
    }
    keys[size] = key;
    values[size] = value;
    size++;
}

int main(void) {
    put(1, 1);
    put(2, 2);
    printf("%d\n", get(1));
    put(3, 3);
    printf("%d\n", get(2));
    return 0;
}
