#include <iostream>
#include <unordered_set>
#include <vector>

void backtrack(int row, int n, std::vector<int>& board, std::unordered_set<int>& columns,
               std::unordered_set<int>& diagonals, std::unordered_set<int>& antiDiagonals,
               std::vector<std::vector<int>>& solutions) {
    if (row == n) {
        solutions.push_back(board);
        return;
    }
    for (int col = 0; col < n; col++) {
        if (columns.count(col) || diagonals.count(row - col) || antiDiagonals.count(row + col)) continue;
        columns.insert(col);
        diagonals.insert(row - col);
        antiDiagonals.insert(row + col);
        board[row] = col;
        backtrack(row + 1, n, board, columns, diagonals, antiDiagonals, solutions);
        columns.erase(col);
        diagonals.erase(row - col);
        antiDiagonals.erase(row + col);
    }
}

std::vector<std::vector<int>> solveNQueens(int n) {
    std::vector<std::vector<int>> solutions;
    std::vector<int> board(n, -1);
    std::unordered_set<int> columns, diagonals, antiDiagonals;
    backtrack(0, n, board, columns, diagonals, antiDiagonals, solutions);
    return solutions;
}

int main() {
    std::cout << solveNQueens(6).size() << std::endl;
    return 0;
}
