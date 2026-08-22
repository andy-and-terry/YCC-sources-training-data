#include <iostream>
#include <vector>
#include <list>
#include <utility>
#include <functional>

template <typename K, typename V>
class HashMap {
public:
    explicit HashMap(size_t size = 16) : buckets(size) {}

    void set(const K& key, const V& value) {
        auto& bucket = buckets[hash(key)];
        for (auto& [k, v] : bucket) {
            if (k == key) {
                v = value;
                return;
            }
        }
        bucket.emplace_back(key, value);
    }

    bool get(const K& key, V& outValue) const {
        const auto& bucket = buckets[hash(key)];
        for (const auto& [k, v] : bucket) {
            if (k == key) {
                outValue = v;
                return true;
            }
        }
        return false;
    }

private:
    size_t hash(const K& key) const {
        return std::hash<K>{}(key) % buckets.size();
    }

    std::vector<std::list<std::pair<K, V>>> buckets;
};

int main() {
    HashMap<std::string, int> map;
    map.set("a", 1);
    map.set("b", 2);
    int value;
    if (map.get("a", value)) std::cout << value << std::endl;
    return 0;
}
