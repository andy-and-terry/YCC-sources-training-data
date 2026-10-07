const std = @import("std");
const allocator = std.heap.page_allocator;

fn bfsDistances(graph: []const []const usize, source: usize) !std.AutoHashMap(usize, i32) {
    var dist = std.AutoHashMap(usize, i32).init(allocator);
    var queue = std.ArrayList(usize).init(allocator);
    defer queue.deinit();

    try dist.put(source, 0);
    try queue.append(source);

    var head: usize = 0;
    while (head < queue.items.len) {
        const node = queue.items[head];
        head += 1;
        const current_dist = dist.get(node).?;
        for (graph[node]) |neighbor| {
            if (!dist.contains(neighbor)) {
                try dist.put(neighbor, current_dist + 1);
                try queue.append(neighbor);
            }
        }
    }
    return dist;
}

pub fn main() !void {
    const graph = [_][]const usize{
        &[_]usize{ 1, 2 },
        &[_]usize{ 0, 3 },
        &[_]usize{ 0, 3 },
        &[_]usize{ 1, 2, 4 },
        &[_]usize{3},
    };

    var dist = try bfsDistances(&graph, 0);
    defer dist.deinit();

    for (0..graph.len) |node| {
        std.debug.print("dist[{d}] = {d}\n", .{ node, dist.get(node).? });
    }
}
