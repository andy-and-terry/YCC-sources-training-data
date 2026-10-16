#include <iostream>
#include <string>
#include <vector>

class Registry {
    std::vector<std::string> names_;
    mutable int lookups_ = 0;
public:
    void add(std::string n) { names_.push_back(std::move(n)); }
    bool contains(const std::string& n) const {
        ++lookups_;  // allowed: mutable
        for (const auto& s : names_) if (s == n) return true;
        return false;
    }
    const std::string& first() const { return names_.front(); }
    std::string& first() { return names_.front(); }
    int lookups() const { return lookups_; }
};

int main() {
    Registry r;
    r.add("alpha");
    const Registry& cr = r;
    std::cout << cr.contains("alpha") << cr.contains("beta") << " lookups=" << cr.lookups() << "\n";
    r.first() += "!";
    std::cout << cr.first() << "\n";
    const int* p = nullptr;
    int x = 5;
    int* const q = &x;
    *q = 6;
    p = q;
    std::cout << *p << "\n";
}
