#include <iostream>
#include <string>
#include <utility>
#include <vector>

int main() {
    std::string a = "hello";
    std::string b = std::move(a);
    std::vector<std::string> v;
    v.push_back(std::move(b));
    std::cout << "[" << a << "] " << v[0] << "\n";
}
