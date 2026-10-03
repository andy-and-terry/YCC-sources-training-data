const std = @import("std");

const INF: i32 = 999999;

// All-pairs shortest paths over a dense n x n distance matrix.
fn floydWarshall(dist: *[4][4]i32) void {
    for (0..4) |k| {
        for (0..4) |i| {
            for (0..4) |j| {
                const through_k = dist[i][k] + dist[k][j];
                if (through_k < dist[i][j]) {
                    dist[i][j] = through_k;
                }
            }
        }
    }
}

pub fn main() void {
    var dist = [4][4]i32{
        .{ 0, 3, INF, 7 },
        .{ 8, 0, 2, INF },
        .{ 5, INF, 0, 1 },
        .{ 2, INF, INF, 0 },
    };
    floydWarshall(&dist);
    for (dist) |row| {
        std.debug.print("{any}\n", .{row});
    }
}
