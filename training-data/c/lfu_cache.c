#include <stdio.h>
#include <limits.h>

#define CAPACITY 2
#define EMPTY -1

typedef struct {
    int key, value, freq;
    int used;
} Entry;

Entry cache[CAPACITY];

void lfu_init(void) {
    for (int i = 0; i < CAPACITY; i++) {
        cache[i].used = 0;
    }
}

int lfu_get(int key) {
    for (int i = 0; i < CAPACITY; i++) {
        if (cache[i].used && cache[i].key == key) {
            cache[i].freq++;
            return cache[i].value;
        }
    }
    return EMPTY;
}

void lfu_put(int key, int value) {
    for (int i = 0; i < CAPACITY; i++) {
        if (cache[i].used && cache[i].key == key) {
            cache[i].value = value;
            cache[i].freq++;
            return;
        }
    }
    int slot = -1;
    for (int i = 0; i < CAPACITY; i++) {
        if (!cache[i].used) {
            slot = i;
            break;
        }
    }
    if (slot == -1) {
        int min_freq = INT_MAX;
        for (int i = 0; i < CAPACITY; i++) {
            if (cache[i].freq < min_freq) {
                min_freq = cache[i].freq;
                slot = i;
            }
        }
    }
    cache[slot].key = key;
    cache[slot].value = value;
    cache[slot].freq = 1;
    cache[slot].used = 1;
}

int main(void) {
    lfu_init();
    lfu_put(1, 100);
    lfu_put(2, 200);
    printf("%d\n", lfu_get(1));
    lfu_put(3, 300);
    printf("%d\n", lfu_get(2));
    printf("%d\n", lfu_get(3));
    return 0;
}
