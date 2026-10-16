#include <iostream>
#include <string>

class Employee {
    static inline int next_id = 1000;
    static int live_count;
    int id_;
    std::string name_;
public:
    explicit Employee(std::string n) : id_(next_id++), name_(std::move(n)) { ++live_count; }
    ~Employee() { --live_count; }
    static int live() { return live_count; }
    int id() const { return id_; }
    const std::string& name() const { return name_; }
};
int Employee::live_count = 0;

int main() {
    Employee a("Ann");
    {
        Employee b("Bob");
        std::cout << b.name() << " has id " << b.id() << ", live=" << Employee::live() << "\n";
    }
    Employee c("Cy");
    std::cout << c.name() << " has id " << c.id() << ", live=" << Employee::live() << "\n";
}
