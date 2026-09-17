const std = @import("std");

const INF: i32 = 999999;

const Edge = struct { from: usize, to: usize, weight: i32 };

fn bellmanFord(edges: []const Edge, n: usize, source: usize, dist: []i32) bool {
    for (dist) |*d| d.* = INF;
    dist[source] = 0;

    for (0..n - 1) |_| {
        for (edges) |e| {
            if (dist[e.from] != INF and dist[e.from] + e.weight < dist[e.to]) {
                dist[e.to] = dist[e.from] + e.weight;
            }
        }
    }

    for (edges) |e| {
        if (dist[e.from] != INF and dist[e.from] + e.weight < dist[e.to]) {
            return false;
        }
    }
    return true;
}

pub fn main() void {
    const edges = [_]Edge{
        .{ .from = 0, .to = 1, .weight = 4 },
        .{ .from = 0, .to = 2, .weight = 5 },
        .{ .from = 1, .to = 2, .weight = -3 },
        .{ .from = 2, .to = 3, .weight = 4 },
        .{ .from = 1, .to = 3, .weight = 6 },
    };
    var dist: [4]i32 = undefined;
    const ok = bellmanFord(&edges, 4, 0, &dist);
    std.debug.print("{any} no_negative_cycle={}\n", .{ dist, ok });
}
