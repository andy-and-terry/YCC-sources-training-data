#include <cstdlib>
#include <iostream>
#include <vector>

constexpr int kMaxLevel = 4;

struct SkipNode {
    int value;
    std::vector<SkipNode*> forward;
    explicit SkipNode(int v, int level) : value(v), forward(level, nullptr) {}
};

class SkipList {
public:
    SkipList() : head(new SkipNode(0, kMaxLevel)), level(0) {}

    void insert(int value) {
        std::vector<SkipNode*> update(kMaxLevel, head);
        SkipNode* current = head;
        for (int i = level; i >= 0; i--) {
            while (current->forward[i] && current->forward[i]->value < value) current = current->forward[i];
            update[i] = current;
        }
        int newLevel = randomLevel();
        if (newLevel > level) {
            for (int i = level + 1; i <= newLevel; i++) update[i] = head;
            level = newLevel;
        }
        SkipNode* node = new SkipNode(value, newLevel + 1);
        for (int i = 0; i <= newLevel; i++) {
            node->forward[i] = update[i]->forward[i];
            update[i]->forward[i] = node;
        }
    }

    bool contains(int value) const {
        SkipNode* current = head;
        for (int i = level; i >= 0; i--) {
            while (current->forward[i] && current->forward[i]->value < value) current = current->forward[i];
        }
        current = current->forward[0];
        return current && current->value == value;
    }

private:
    SkipNode* head;
    int level;

    static int randomLevel() {
        int lvl = 0;
        while (lvl < kMaxLevel - 1 && (std::rand() % 2 == 0)) lvl++;
        return lvl;
    }
};

int main() {
    SkipList list;
    for (int v : {3, 6, 7, 9, 12, 19, 17}) list.insert(v);
    std::cout << list.contains(9) << " " << list.contains(15) << std::endl;
    return 0;
}
