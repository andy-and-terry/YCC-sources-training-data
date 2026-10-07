#include <iostream>
#include <vector>

void sinkIsland(std::vector<std::vector<char>>& grid, int r, int c) {
    int rows = static_cast<int>(grid.size());
    int cols = static_cast<int>(grid[0].size());
    if (r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] != '1') return;

    grid[r][c] = '0';
    sinkIsland(grid, r + 1, c);
    sinkIsland(grid, r - 1, c);
    sinkIsland(grid, r, c + 1);
    sinkIsland(grid, r, c - 1);
}

int numIslands(std::vector<std::vector<char>> grid) {
    int count = 0;
    for (size_t r = 0; r < grid.size(); r++) {
        for (size_t c = 0; c < grid[r].size(); c++) {
            if (grid[r][c] == '1') {
                count++;
                sinkIsland(grid, static_cast<int>(r), static_cast<int>(c));
            }
        }
    }
    return count;
}

int main() {
    std::vector<std::vector<char>> grid = {
        {'1', '1', '0', '0', '0'},
        {'1', '1', '0', '0', '0'},
        {'0', '0', '1', '0', '0'},
        {'0', '0', '0', '1', '1'},
    };

    std::cout << "number of islands: " << numIslands(grid) << std::endl;
    return 0;
}
