// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
#include <algorithm>
#include <iostream>
#include <string_view>

int max_depth(std::string_view s) {
    int depth = 0, best = 0;
    for (char ch : s) {
        if (ch == '(') best = std::max(best, ++depth);
        else if (ch == ')' && --depth < 0) return -1;
    }
    return depth == 0 ? best : -1;
}

int main() { std::cout << max_depth("(1+(2*(3)))") << ' ' << max_depth("(()") << '\n'; }
