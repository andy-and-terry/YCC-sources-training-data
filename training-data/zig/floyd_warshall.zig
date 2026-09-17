const std = @import("std");

const INF: i32 = 999999;

fn floydWarshall(dist: [][4]i32) void {
    const n = dist.len;
    for (0..n) |k| {
        for (0..n) |i| {
            for (0..n) |j| {
                if (dist[i][k] != INF and dist[k][j] != INF and dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j];
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
