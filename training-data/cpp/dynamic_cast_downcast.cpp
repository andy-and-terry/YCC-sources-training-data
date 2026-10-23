#include <iostream>
#include <memory>
#include <vector>

struct Animal {
    virtual ~Animal() = default;
};
struct Dog : Animal {
    void fetch() const { std::cout << "dog fetches\n"; }
};
struct Cat : Animal {
    void purr() const { std::cout << "cat purrs\n"; }
};

int main() {
    std::vector<std::unique_ptr<Animal>> zoo;
    zoo.push_back(std::make_unique<Dog>());
    zoo.push_back(std::make_unique<Cat>());

    for (const auto& a : zoo) {
        // A failed pointer dynamic_cast yields nullptr.
        if (auto* d = dynamic_cast<Dog*>(a.get())) d->fetch();
        else if (auto* c = dynamic_cast<Cat*>(a.get())) c->purr();
    }

    // A failed reference dynamic_cast throws std::bad_cast.
    try {
        Dog& d = dynamic_cast<Dog&>(*zoo[1]);
        d.fetch();
    } catch (const std::bad_cast&) {
        std::cout << "bad_cast caught\n";
    }
    return 0;
}
