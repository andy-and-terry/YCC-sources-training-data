#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TABLE_SIZE 16

typedef struct Entry {
    char key[32];
    int value;
    struct Entry *next;
} Entry;

typedef struct {
    Entry *buckets[TABLE_SIZE];
} HashTable;

unsigned int hash_string(const char *key) {
    unsigned int hash = 5381;
    while (*key) {
        hash = ((hash << 5) + hash) + (unsigned char)(*key);
        key++;
    }
    return hash % TABLE_SIZE;
}

void ht_init(HashTable *table) {
    for (int i = 0; i < TABLE_SIZE; i++) table->buckets[i] = NULL;
}

void ht_put(HashTable *table, const char *key, int value) {
    unsigned int idx = hash_string(key);
    Entry *cur = table->buckets[idx];
    while (cur) {
        if (strcmp(cur->key, key) == 0) {
            cur->value = value;
            return;
        }
        cur = cur->next;
    }
    Entry *entry = malloc(sizeof(Entry));
    strcpy(entry->key, key);
    entry->value = value;
    entry->next = table->buckets[idx];
    table->buckets[idx] = entry;
}

int ht_get(HashTable *table, const char *key, int *found) {
    unsigned int idx = hash_string(key);
    Entry *cur = table->buckets[idx];
    while (cur) {
        if (strcmp(cur->key, key) == 0) {
            *found = 1;
            return cur->value;
        }
        cur = cur->next;
    }
    *found = 0;
    return 0;
}

void ht_free(HashTable *table) {
    for (int i = 0; i < TABLE_SIZE; i++) {
        Entry *cur = table->buckets[i];
        while (cur) {
            Entry *next = cur->next;
            free(cur);
            cur = next;
        }
    }
}

int main(void) {
    HashTable table;
    ht_init(&table);

    ht_put(&table, "apple", 3);
    ht_put(&table, "banana", 7);
    ht_put(&table, "cherry", 12);
    ht_put(&table, "apple", 5);

    const char *keys[] = {"apple", "banana", "cherry", "durian"};
    for (int i = 0; i < 4; i++) {
        int found;
        int value = ht_get(&table, keys[i], &found);
        if (found) printf("%s -> %d\n", keys[i], value);
        else printf("%s -> not found\n", keys[i]);
    }

    ht_free(&table);
    return 0;
}
