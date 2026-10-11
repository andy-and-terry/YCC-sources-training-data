#include <iostream>
#include <new>
#include <string>

struct Probe {
    std::string name;
    Probe(std::string n) : name(std::move(n)) { std::cout << "construct " << name << "\n"; }
    ~Probe() { std::cout << "destroy " << name << "\n"; }
};

int main() {
    alignas(Probe) unsigned char buffer[sizeof(Probe) * 2];
    Probe* a = new (buffer) Probe("first");
    Probe* b = new (buffer + sizeof(Probe)) Probe("second");
    std::cout << a->name << " and " << b->name << " live in the same buffer\n";
    b->~Probe();
    a->~Probe();
}
