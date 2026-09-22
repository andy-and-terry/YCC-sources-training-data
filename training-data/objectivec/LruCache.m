#include <stdio.h>

// Deliberately Foundation-free: this sandbox only has bare clang (no
// Foundation framework), so this uses a plain C struct + arrays
// instead of NSDictionary. get/put are O(capacity) via linear scan
// and array shifting rather than hash-map backed, which keeps the
// eviction logic (move most-recently-used to the end) easy to follow.

#define CAPACITY 3

typedef struct {
    int capacity;
    int size;
    int keys[16];
    int values[16];
} LruCache;

void lruInit(LruCache *cache, int capacity) {
    cache->capacity = capacity;
    cache->size = 0;
}

int lruIndexOf(LruCache *cache, int key) {
    for (int i = 0; i < cache->size; i++) {
        if (cache->keys[i] == key) return i;
    }
    return -1;
}

void lruTouch(LruCache *cache, int idx) {
    int k = cache->keys[idx];
    int v = cache->values[idx];
    for (int i = idx; i < cache->size - 1; i++) {
        cache->keys[i] = cache->keys[i + 1];
        cache->values[i] = cache->values[i + 1];
    }
    cache->keys[cache->size - 1] = k;
    cache->values[cache->size - 1] = v;
}

int lruGet(LruCache *cache, int key) {
    int idx = lruIndexOf(cache, key);
    if (idx == -1) return -1;
    int value = cache->values[idx];
    lruTouch(cache, idx);
    return value;
}

void lruPut(LruCache *cache, int key, int value) {
    int idx = lruIndexOf(cache, key);
    if (idx != -1) {
        cache->values[idx] = value;
        lruTouch(cache, idx);
        return;
    }
    if (cache->size == cache->capacity) {
        for (int i = 0; i < cache->size - 1; i++) {
            cache->keys[i] = cache->keys[i + 1];
            cache->values[i] = cache->values[i + 1];
        }
        cache->size--;
    }
    cache->keys[cache->size] = key;
    cache->values[cache->size] = value;
    cache->size++;
}

void lruPrint(LruCache *cache) {
    printf("[");
    for (int i = 0; i < cache->size; i++) {
        printf("%d:%d%s", cache->keys[i], cache->values[i], (i == cache->size - 1) ? "" : ", ");
    }
    printf("]\n");
}

int main(void) {
    LruCache cache;
    lruInit(&cache, CAPACITY);

    lruPut(&cache, 1, 100);
    lruPut(&cache, 2, 200);
    lruPut(&cache, 3, 300);
    lruPrint(&cache);

    printf("get(1) = %d\n", lruGet(&cache, 1));
    lruPrint(&cache);

    lruPut(&cache, 4, 400);
    lruPrint(&cache);

    printf("get(2) = %d\n", lruGet(&cache, 2));

    return 0;
}
