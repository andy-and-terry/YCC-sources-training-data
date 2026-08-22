#include <algorithm>
#include <iostream>
#include <string>

std::string reverseString(std::string s) {
    std::reverse(s.begin(), s.end());
    return s;
}

int main() {
    std::cout << reverseString("hello") << std::endl;
    return 0;
}
