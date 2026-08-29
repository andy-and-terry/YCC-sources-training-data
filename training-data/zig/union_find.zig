const std = @import("std");

const UnionFind = struct {
    parent: [5]usize,

    fn init() UnionFind {
        var uf = UnionFind{ .parent = undefined };
        for (0..5) |i| uf.parent[i] = i;
        return uf;
    }

    fn find(self: *UnionFind, x: usize) usize {
        if (self.parent[x] == x) return x;
        return self.find(self.parent[x]);
    }

    fn unite(self: *UnionFind, x: usize, y: usize) void {
        const rootX = self.find(x);
        const rootY = self.find(y);
        if (rootX != rootY) self.parent[rootX] = rootY;
    }
};

pub fn main() void {
    var uf = UnionFind.init();
    uf.unite(0, 1);
    uf.unite(1, 2);
    std.debug.print("{}\n", .{uf.find(0) == uf.find(2)});
    std.debug.print("{}\n", .{uf.find(0) == uf.find(3)});
}
