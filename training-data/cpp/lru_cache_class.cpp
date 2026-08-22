#include <iostream>
#include <list>
#include <unordered_map>

class LRUCache {
public:
    explicit LRUCache(size_t capacity) : capacity(capacity) {}

    int get(int key) {
        auto it = index.find(key);
        if (it == index.end()) return -1;
        items.splice(items.begin(), items, it->second);
        return it->second->second;
    }

    void put(int key, int value) {
        auto it = index.find(key);
        if (it != index.end()) {
            it->second->second = value;
            items.splice(items.begin(), items, it->second);
            return;
        }
        items.emplace_front(key, value);
        index[key] = items.begin();
        if (index.size() > capacity) {
            auto last = items.back();
            index.erase(last.first);
            items.pop_back();
        }
    }

private:
    size_t capacity;
    std::list<std::pair<int, int>> items;
    std::unordered_map<int, std::list<std::pair<int, int>>::iterator> index;
};

int main() {
    LRUCache cache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.get(1);
    cache.put(3, 3);
    std::cout << cache.get(2) << " " << cache.get(1) << " " << cache.get(3) << std::endl;
    return 0;
}
