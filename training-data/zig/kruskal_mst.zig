const std = @import("std");

const Edge = struct { u: usize, v: usize, w: i32 };

var parent: [5]usize = undefined;

fn find(x: usize) usize {
    if (parent[x] == x) return x;
    parent[x] = find(parent[x]);
    return parent[x];
}

// Kruskal's minimum-spanning-tree algorithm: sort edges by weight,
// then greedily add each edge whose endpoints are in different
// union-find sets.
fn kruskalMst(edges: []Edge, n: usize) i32 {
    for (0..n) |i| parent[i] = i;

    std.mem.sort(Edge, edges, {}, struct {
        fn lessThan(_: void, a: Edge, b: Edge) bool {
            return a.w < b.w;
        }
    }.lessThan);

    var total: i32 = 0;
    for (edges) |e| {
        const root_u = find(e.u);
        const root_v = find(e.v);
        if (root_u != root_v) {
            parent[root_u] = root_v;
            total += e.w;
        }
    }
    return total;
}

pub fn main() void {
    var edges = [_]Edge{
        .{ .u = 0, .v = 1, .w = 2 },
        .{ .u = 0, .v = 3, .w = 6 },
        .{ .u = 1, .v = 2, .w = 3 },
        .{ .u = 1, .v = 3, .w = 8 },
        .{ .u = 1, .v = 4, .w = 5 },
        .{ .u = 2, .v = 4, .w = 7 },
        .{ .u = 3, .v = 4, .w = 9 },
    };
    std.debug.print("{d}\n", .{kruskalMst(&edges, 5)});
}
