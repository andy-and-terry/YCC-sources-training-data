const std = @import("std");

// Prim's minimum-spanning-tree algorithm over a dense adjacency
// matrix (0 meaning "no edge").
fn primMst(graph: []const [5]i32, n: usize) i32 {
    var key: [5]i32 = [_]i32{999999} ** 5;
    var in_mst: [5]bool = [_]bool{false} ** 5;
    key[0] = 0;
    var total: i32 = 0;

    for (0..n) |_| {
        var u: usize = 0;
        var best: i32 = 1000000;
        for (0..n) |i| {
            if (!in_mst[i] and key[i] < best) {
                best = key[i];
                u = i;
            }
        }
        in_mst[u] = true;
        total += best;

        for (0..n) |v| {
            const w = graph[u][v];
            if (w > 0 and !in_mst[v] and w < key[v]) {
                key[v] = w;
            }
        }
    }
    return total;
}

pub fn main() void {
    const graph = [5][5]i32{
        .{ 0, 2, 0, 6, 0 },
        .{ 2, 0, 3, 8, 5 },
        .{ 0, 3, 0, 0, 7 },
        .{ 6, 8, 0, 0, 9 },
        .{ 0, 5, 7, 9, 0 },
    };
    std.debug.print("{d}\n", .{primMst(&graph, 5)});
}
