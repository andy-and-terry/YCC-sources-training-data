#include <algorithm>
#include <iostream>
#include <string>
// Remove consecutive duplicates with std::unique.
int main() {
    std::string s = "aabbbcdd";
    s.erase(std::unique(s.begin(), s.end()), s.end());
    std::cout << s << '\n';
}
