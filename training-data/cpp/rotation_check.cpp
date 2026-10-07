#include <iostream>
#include <string>

bool isRotation(const std::string& a, const std::string& b) {
    return a.size() == b.size() && (a + a).find(b) != std::string::npos;
}

int main() {
    std::cout << std::boolalpha << isRotation("waterbottle", "erbottlewat") << ' ' << isRotation("abc", "acb") << '\n';
}
