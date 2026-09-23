const std = @import("std");

const Edge = struct { from: usize, to: usize, weight: i32 };

fn bellmanFord(edges: []const Edge, node_count: usize, source: usize, dist: []i32) void {
    for (dist) |*d| d.* = 999999;
    dist[source] = 0;

    for (0..node_count - 1) |_| {
        for (edges) |e| {
            if (dist[e.from] != 999999 and dist[e.from] + e.weight < dist[e.to]) {
                dist[e.to] = dist[e.from] + e.weight;
            }
        }
    }
}

pub fn main() void {
    // Negative weight (b->c) rules out plain Dijkstra; Bellman-Ford still
    // finds the correct shortest paths by relaxing every edge n-1 times.
    const edges = [_]Edge{
        .{ .from = 0, .to = 1, .weight = 4 },
        .{ .from = 0, .to = 2, .weight = 5 },
        .{ .from = 1, .to = 2, .weight = -3 },
        .{ .from = 2, .to = 3, .weight = 2 },
    };
    var dist: [4]i32 = undefined;
    bellmanFord(&edges, 4, 0, &dist);
    std.debug.print("{any}\n", .{dist});
}
