#include <functional>
#include <iostream>
#include <string>
#include <vector>

class BloomFilter {
public:
    BloomFilter(size_t size, int numHashes) : bits(size, false), size(size), numHashes(numHashes) {}

    void add(const std::string& item) {
        for (size_t idx : hashes(item)) bits[idx] = true;
    }

    bool mightContain(const std::string& item) const {
        for (size_t idx : hashes(item)) if (!bits[idx]) return false;
        return true;
    }

private:
    std::vector<bool> bits;
    size_t size;
    int numHashes;

    std::vector<size_t> hashes(const std::string& item) const {
        std::vector<size_t> result;
        for (int i = 0; i < numHashes; i++) {
            std::hash<std::string> hasher;
            result.push_back(hasher(std::to_string(i) + ":" + item) % size);
        }
        return result;
    }
};

int main() {
    BloomFilter bf(1000, 3);
    bf.add("hello");
    std::cout << bf.mightContain("hello") << " " << bf.mightContain("world") << std::endl;
    return 0;
}
