#import <Foundation/Foundation.h>

void sinkIsland(NSMutableArray<NSMutableArray<NSNumber *> *> *grid, NSInteger r, NSInteger c) {
    if (r < 0 || r >= (NSInteger)grid.count || c < 0 || c >= (NSInteger)grid[0].count) return;
    if (grid[r][c].integerValue != 1) return;
    grid[r][c] = @0;
    sinkIsland(grid, r - 1, c);
    sinkIsland(grid, r + 1, c);
    sinkIsland(grid, r, c - 1);
    sinkIsland(grid, r, c + 1);
}

NSInteger numIslands(NSMutableArray<NSMutableArray<NSNumber *> *> *grid) {
    NSInteger count = 0;
    for (NSInteger r = 0; r < (NSInteger)grid.count; r++) {
        for (NSInteger c = 0; c < (NSInteger)grid[0].count; c++) {
            if (grid[r][c].integerValue == 1) {
                count++;
                sinkIsland(grid, r, c);
            }
        }
    }
    return count;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<NSMutableArray<NSNumber *> *> *grid = [@[
            [@[ @1, @1, @0, @0 ] mutableCopy],
            [@[ @1, @1, @0, @0 ] mutableCopy],
            [@[ @0, @0, @1, @0 ] mutableCopy],
            [@[ @0, @0, @0, @1 ] mutableCopy]
        ] mutableCopy];
        NSLog(@"%ld", (long)numIslands(grid));
    }
    return 0;
}
