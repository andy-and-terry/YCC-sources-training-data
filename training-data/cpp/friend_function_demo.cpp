#include <iostream>
#include <string>

class Vault {
    std::string secret_;
    int attempts_ = 0;
    friend void audit(const Vault&);
    friend class Locksmith;
public:
    explicit Vault(std::string s) : secret_(std::move(s)) {}
    friend std::ostream& operator<<(std::ostream& os, const Vault& v) {
        return os << "Vault(" << v.secret_.size() << " chars)";
    }
};

void audit(const Vault& v) { std::cout << "audit: attempts=" << v.attempts_ << "\n"; }

class Locksmith {
public:
    static void reset(Vault& v, const std::string& s) { v.secret_ = s; ++v.attempts_; }
};

int main() {
    Vault v("hunter2");
    std::cout << v << "\n";
    Locksmith::reset(v, "correct horse battery");
    std::cout << v << "\n";
    audit(v);
}
