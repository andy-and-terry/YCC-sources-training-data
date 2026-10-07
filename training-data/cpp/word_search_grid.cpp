#include <functional>
#include <iostream>
#include <string>
#include <vector>

bool exists(std::vector<std::string> board, const std::string& word) {
    const int R = static_cast<int>(board.size()), C = static_cast<int>(board[0].size());
    std::function<bool(int, int, std::size_t)> dfs = [&](int r, int c, std::size_t i) {
        if (i == word.size()) return true;
        if (r < 0 || c < 0 || r >= R || c >= C || board[r][c] != word[i]) return false;
        char tmp = board[r][c];
        board[r][c] = '#';
        bool found = dfs(r + 1, c, i + 1) || dfs(r - 1, c, i + 1) || dfs(r, c + 1, i + 1) || dfs(r, c - 1, i + 1);
        board[r][c] = tmp;
        return found;
    };
    for (int r = 0; r < R; ++r)
        for (int c = 0; c < C; ++c)
            if (dfs(r, c, 0)) return true;
    return false;
}

int main() {
    std::vector<std::string> b{"ABCE", "SFCS", "ADEE"};
    for (std::string w : {"ABCCED", "SEE", "ABCB"}) std::cout << w << ' ' << std::boolalpha << exists(b, w) << '\n';
}
