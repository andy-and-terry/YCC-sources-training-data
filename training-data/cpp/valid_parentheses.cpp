#include <iostream>
#include <stack>
#include <string>
#include <unordered_map>

bool isValid(const std::string& s) {
    std::unordered_map<char, char> pairs = {{')', '('}, {']', '['}, {'}', '{'}};
    std::stack<char> stack;
    for (char ch : s) {
        if (ch == '(' || ch == '[' || ch == '{') {
            stack.push(ch);
        } else if (pairs.count(ch)) {
            if (stack.empty() || stack.top() != pairs[ch]) return false;
            stack.pop();
        }
    }
    return stack.empty();
}

int main() {
    std::cout << isValid("([{}])") << std::endl;
    std::cout << isValid("([)]") << std::endl;
    return 0;
}
