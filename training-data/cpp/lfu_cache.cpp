#include <iostream>
#include <list>
#include <unordered_map>

class LFUCache {
public:
    explicit LFUCache(int capacity) : capacity(capacity), minFreq(0) {}

    int get(int key) {
        auto it = values.find(key);
        if (it == values.end()) return -1;
        touch(key);
        return it->second;
    }

    void put(int key, int value) {
        if (capacity == 0) return;
        auto it = values.find(key);
        if (it != values.end()) {
            it->second = value;
            touch(key);
            return;
        }
        if (static_cast<int>(values.size()) >= capacity) {
            int evictKey = freqLists[minFreq].back();
            freqLists[minFreq].pop_back();
            keyIter.erase(evictKey);
            values.erase(evictKey);
            keyFreq.erase(evictKey);
        }
        values[key] = value;
        keyFreq[key] = 1;
        freqLists[1].push_front(key);
        keyIter[key] = freqLists[1].begin();
        minFreq = 1;
    }

private:
    void touch(int key) {
        int freq = keyFreq[key];
        freqLists[freq].erase(keyIter[key]);
        if (freqLists[freq].empty() && minFreq == freq) minFreq++;
        keyFreq[key] = freq + 1;
        freqLists[freq + 1].push_front(key);
        keyIter[key] = freqLists[freq + 1].begin();
    }

    int capacity;
    int minFreq;
    std::unordered_map<int, int> values;
    std::unordered_map<int, int> keyFreq;
    std::unordered_map<int, std::list<int>> freqLists;
    std::unordered_map<int, std::list<int>::iterator> keyIter;
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
