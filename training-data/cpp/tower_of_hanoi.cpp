#include <iostream>
#include <utility>
#include <vector>

void hanoi(int n, char source, char target, char auxiliary, std::vector<std::pair<char, char>>& moves) {
    if (n == 1) {
        moves.emplace_back(source, target);
        return;
    }
    hanoi(n - 1, source, auxiliary, target, moves);
    moves.emplace_back(source, target);
    hanoi(n - 1, auxiliary, target, source, moves);
}

int main() {
    std::vector<std::pair<char, char>> moves;
    hanoi(3, 'A', 'C', 'B', moves);
    for (auto& [s, t] : moves) std::cout << s << " -> " << t << std::endl;
    return 0;
}
