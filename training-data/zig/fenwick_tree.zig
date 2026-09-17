const std = @import("std");

const FenwickTree = struct {
    tree: []i32,
    n: usize,
    allocator: std.mem.Allocator,

    fn init(allocator: std.mem.Allocator, n: usize) !FenwickTree {
        const tree = try allocator.alloc(i32, n + 1);
        @memset(tree, 0);
        return FenwickTree{ .tree = tree, .n = n, .allocator = allocator };
    }

    fn deinit(self: *FenwickTree) void {
        self.allocator.free(self.tree);
    }

    fn update(self: *FenwickTree, pos: usize, delta: i32) void {
        var i = pos;
        while (i <= self.n) {
            self.tree[i] += delta;
            i += i & (0 -% i);
        }
    }

    fn prefixSum(self: *FenwickTree, pos: usize) i32 {
        var i = pos;
        var total: i32 = 0;
        while (i > 0) {
            total += self.tree[i];
            i -= i & (0 -% i);
        }
        return total;
    }

    fn rangeSum(self: *FenwickTree, l: usize, r: usize) i32 {
        return self.prefixSum(r) - self.prefixSum(l - 1);
    }
};

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var ft = try FenwickTree.init(allocator, 6);
    defer ft.deinit();

    const values = [_]i32{ 1, 3, 5, 7, 9, 11 };
    var idx: usize = 1;
    for (values) |v| {
        ft.update(idx, v);
        idx += 1;
    }

    std.debug.print("{d}\n", .{ft.prefixSum(4)});
    std.debug.print("{d}\n", .{ft.rangeSum(2, 4)});
    ft.update(2, 10);
    std.debug.print("{d}\n", .{ft.rangeSum(2, 4)});
}
