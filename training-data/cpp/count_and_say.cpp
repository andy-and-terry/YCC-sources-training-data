#include <iostream>
#include <string>

std::string count_and_say(int n) {
    std::string s = "1";
    while (--n > 0) {
        std::string next;
        for (std::size_t i = 0; i < s.size();) {
            std::size_t j = s.find_first_not_of(s[i], i);
            if (j == std::string::npos) j = s.size();
            next += std::to_string(j - i);
            next += s[i];
            i = j;
        }
        s = std::move(next);
    }
    return s;
}

int main() {
    for (int i = 1; i <= 10; ++i) std::cout << i << ' ' << count_and_say(i) << '\n';
    std::cout << "length of term 40: " << count_and_say(40).size() << '\n';
}
