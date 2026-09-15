#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TABLE_SIZE 16

typedef struct Entry {
    char *key;
    int value;
    struct Entry *next;
} Entry;

typedef struct {
    Entry *buckets[TABLE_SIZE];
} HashTable;

char *copy_string(const char *src) {
    size_t len = strlen(src) + 1;
    char *dst = malloc(len);
    memcpy(dst, src, len);
    return dst;
}

unsigned int hash_string(const char *key) {
    unsigned int hash = 5381;
    for (const char *p = key; *p; p++) {
        hash = ((hash << 5) + hash) + (unsigned char)*p;
    }
    return hash % TABLE_SIZE;
}

void ht_init(HashTable *table) {
    for (int i = 0; i < TABLE_SIZE; i++) {
        table->buckets[i] = NULL;
    }
}

void ht_set(HashTable *table, const char *key, int value) {
    unsigned int idx = hash_string(key);
    for (Entry *e = table->buckets[idx]; e; e = e->next) {
        if (strcmp(e->key, key) == 0) {
            e->value = value;
            return;
        }
    }
    Entry *entry = malloc(sizeof(Entry));
    entry->key = copy_string(key);
    entry->value = value;
    entry->next = table->buckets[idx];
    table->buckets[idx] = entry;
}

int ht_get(HashTable *table, const char *key, int *found) {
    unsigned int idx = hash_string(key);
    for (Entry *e = table->buckets[idx]; e; e = e->next) {
        if (strcmp(e->key, key) == 0) {
            *found = 1;
            return e->value;
        }
    }
    *found = 0;
    return 0;
}

void ht_free(HashTable *table) {
    for (int i = 0; i < TABLE_SIZE; i++) {
        Entry *e = table->buckets[i];
        while (e) {
            Entry *next = e->next;
            free(e->key);
            free(e);
            e = next;
        }
    }
}

int main(void) {
    HashTable table;
    ht_init(&table);

    ht_set(&table, "apple", 3);
    ht_set(&table, "banana", 5);
    ht_set(&table, "cherry", 7);
    ht_set(&table, "apple", 9);

    int found;
    printf("%d\n", ht_get(&table, "apple", &found));
    printf("found apple: %d\n", found);
    printf("%d\n", ht_get(&table, "banana", &found));
    ht_get(&table, "missing", &found);
    printf("found missing: %d\n", found);

    ht_free(&table);
    return 0;
}
