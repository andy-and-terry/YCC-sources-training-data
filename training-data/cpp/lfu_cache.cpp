#include <iostream>
#include <list>
#include <unordered_map>

class LFUCache {
public:
    explicit LFUCache(size_t capacity) : capacity(capacity) {}

    int get(int key) {
        auto it = entries.find(key);
        if (it == entries.end()) return -1;
        touch(it);
        return it->second.value;
    }

    void put(int key, int value) {
        if (capacity == 0) return;
        auto it = entries.find(key);
        if (it != entries.end()) {
            it->second.value = value;
            touch(it);
            return;
        }

        if (entries.size() >= capacity) {
            int leastFrequent = minFrequency;
            int evictKey = frequencyList[leastFrequent].back();
            frequencyList[leastFrequent].pop_back();
            entries.erase(evictKey);
        }

        frequencyList[1].push_front(key);
        entries[key] = {value, 1, frequencyList[1].begin()};
        minFrequency = 1;
    }

private:
    struct Entry {
        int value;
        int frequency;
        std::list<int>::iterator position;
    };

    size_t capacity;
    int minFrequency = 0;
    std::unordered_map<int, Entry> entries;
    std::unordered_map<int, std::list<int>> frequencyList;

    void touch(std::unordered_map<int, Entry>::iterator it) {
        int key = it->first;
        int frequency = it->second.frequency;
        frequencyList[frequency].erase(it->second.position);
        if (frequencyList[frequency].empty() && minFrequency == frequency) minFrequency++;

        it->second.frequency++;
        frequencyList[frequency + 1].push_front(key);
        it->second.position = frequencyList[frequency + 1].begin();
    }
};

int main() {
    LFUCache cache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    std::cout << cache.get(1) << std::endl;
    cache.put(3, 3);
    std::cout << cache.get(2) << std::endl;
    std::cout << cache.get(3) << std::endl;
    cache.put(4, 4);
    std::cout << cache.get(1) << std::endl;
    std::cout << cache.get(3) << std::endl;
    std::cout << cache.get(4) << std::endl;
    return 0;
}
