#include <iostream>
#include <string>
#include <vector>

bool isPalindrome(const std::string& s) {
    int i = 0, j = static_cast<int>(s.size()) - 1;
    while (i < j) {
        if (s[i] != s[j]) return false;
        i++; j--;
    }
    return true;
}

void backtrack(const std::string& s, size_t start, std::vector<std::string>& path,
               std::vector<std::vector<std::string>>& result) {
    if (start == s.size()) {
        result.push_back(path);
        return;
    }
    for (size_t end = start + 1; end <= s.size(); end++) {
        std::string sub = s.substr(start, end - start);
        if (isPalindrome(sub)) {
            path.push_back(sub);
            backtrack(s, end, path, result);
            path.pop_back();
        }
    }
}

std::vector<std::vector<std::string>> partition(const std::string& s) {
    std::vector<std::vector<std::string>> result;
    std::vector<std::string> path;
    backtrack(s, 0, path, result);
    return result;
}

int main() {
    for (auto& group : partition("aab")) {
        for (auto& s : group) std::cout << s << " ";
        std::cout << "| ";
    }
    std::cout << std::endl;
    return 0;
}
