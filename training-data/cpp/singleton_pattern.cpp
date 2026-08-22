#include <iostream>

class Singleton {
public:
    static Singleton& getInstance(int value) {
        static Singleton instance(value);
        return instance;
    }

    int value;

    Singleton(const Singleton&) = delete;
    Singleton& operator=(const Singleton&) = delete;

private:
    explicit Singleton(int v) : value(v) {}
};

int main() {
    Singleton& a = Singleton::getInstance(1);
    Singleton& b = Singleton::getInstance(2);
    std::cout << (&a == &b) << " " << a.value << " " << b.value << std::endl;
    return 0;
}
