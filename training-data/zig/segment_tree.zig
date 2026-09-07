const std = @import("std");

const SegmentTree = struct {
    tree: []i32,
    n: usize,
    allocator: std.mem.Allocator,

    fn init(allocator: std.mem.Allocator, data: []const i32) !SegmentTree {
        const n = data.len;
        const tree = try allocator.alloc(i32, 4 * n);
        var self = SegmentTree{ .tree = tree, .n = n, .allocator = allocator };
        self.build(data, 1, 0, n - 1);
        return self;
    }

    fn deinit(self: *SegmentTree) void {
        self.allocator.free(self.tree);
    }

    fn build(self: *SegmentTree, data: []const i32, node: usize, lo: usize, hi: usize) void {
        if (lo == hi) {
            self.tree[node] = data[lo];
            return;
        }
        const mid = lo + (hi - lo) / 2;
        self.build(data, 2 * node, lo, mid);
        self.build(data, 2 * node + 1, mid + 1, hi);
        self.tree[node] = self.tree[2 * node] + self.tree[2 * node + 1];
    }

    fn query(self: *SegmentTree, node: usize, lo: usize, hi: usize, l: usize, r: usize) i32 {
        if (r < lo or hi < l) return 0;
        if (l <= lo and hi <= r) return self.tree[node];
        const mid = lo + (hi - lo) / 2;
        return self.query(2 * node, lo, mid, l, r) + self.query(2 * node + 1, mid + 1, hi, l, r);
    }

    fn rangeSum(self: *SegmentTree, l: usize, r: usize) i32 {
        return self.query(1, 0, self.n - 1, l, r);
    }
};

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const data = [_]i32{ 1, 3, 5, 7, 9, 11 };
    var tree = try SegmentTree.init(allocator, &data);
    defer tree.deinit();

    std.debug.print("{d}\n", .{tree.rangeSum(1, 3)});
    std.debug.print("{d}\n", .{tree.rangeSum(0, 5)});
}
