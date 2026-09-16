const std = @import("std");

/// BFS 2-coloring: returns true if the graph has no odd cycle (is bipartite).
fn isBipartite(graph: []const []const usize, color: []i32) bool {
    for (color) |*c| c.* = -1;

    var queue: [16]usize = undefined;
    for (0..graph.len) |start| {
        if (color[start] != -1) continue;
        color[start] = 0;
        var head: usize = 0;
        var tail: usize = 0;
        queue[tail] = start;
        tail += 1;
        while (head < tail) {
            const node = queue[head];
            head += 1;
            for (graph[node]) |neighbor| {
                if (color[neighbor] == -1) {
                    color[neighbor] = 1 - color[node];
                    queue[tail] = neighbor;
                    tail += 1;
                } else if (color[neighbor] == color[node]) {
                    return false;
                }
            }
        }
    }
    return true;
}

pub fn main() void {
    const even_cycle = [_][]const usize{
        &[_]usize{ 1, 3 },
        &[_]usize{ 0, 2 },
        &[_]usize{ 1, 3 },
        &[_]usize{ 0, 2 },
    };
    var color: [4]i32 = undefined;
    std.debug.print("{}\n", .{isBipartite(&even_cycle, &color)});

    const odd_cycle = [_][]const usize{
        &[_]usize{ 1, 2 },
        &[_]usize{ 0, 2 },
        &[_]usize{ 0, 1 },
    };
    var color2: [3]i32 = undefined;
    std.debug.print("{}\n", .{isBipartite(&odd_cycle, &color2)});
}
