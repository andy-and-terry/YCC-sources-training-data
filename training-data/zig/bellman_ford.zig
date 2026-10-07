const std = @import("std");

const Edge = struct { u: usize, v: usize, w: i32 };

// Single-source shortest paths tolerant of negative edge weights,
// detecting a negative-weight cycle on the final relaxation pass.
fn bellmanFord(edges: []const Edge, n: usize, src: usize, dist: []i32) bool {
    for (dist) |*d| d.* = 999999;
    dist[src] = 0;

    for (0..n - 1) |_| {
        for (edges) |e| {
            if (dist[e.u] != 999999 and dist[e.u] + e.w < dist[e.v]) {
                dist[e.v] = dist[e.u] + e.w;
            }
        }
    }

    for (edges) |e| {
        if (dist[e.u] != 999999 and dist[e.u] + e.w < dist[e.v]) {
            return false; // negative-weight cycle found
        }
    }
    return true;
}

pub fn main() void {
    const edges = [_]Edge{
        .{ .u = 0, .v = 1, .w = 4 },
        .{ .u = 0, .v = 2, .w = 5 },
        .{ .u = 1, .v = 2, .w = -3 },
        .{ .u = 2, .v = 3, .w = 4 },
        .{ .u = 1, .v = 3, .w = 6 },
    };
    var dist: [4]i32 = undefined;
    const ok = bellmanFord(&edges, 4, 0, &dist);
    std.debug.print("{any}\n", .{dist});
    std.debug.print("{}\n", .{ok});
}
