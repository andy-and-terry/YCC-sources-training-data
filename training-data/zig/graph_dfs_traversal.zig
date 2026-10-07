const std = @import("std");
const allocator = std.heap.page_allocator;

fn dfs(graph: []const []const usize, node: usize, visited: []bool, order: *std.ArrayList(usize)) !void {
    if (visited[node]) return;
    visited[node] = true;
    try order.append(node);
    for (graph[node]) |neighbor| {
        try dfs(graph, neighbor, visited, order);
    }
}

pub fn main() !void {
    const graph = [_][]const usize{
        &[_]usize{ 1, 2 },
        &[_]usize{ 0, 3 },
        &[_]usize{ 0, 3 },
        &[_]usize{ 1, 2 },
    };

    var visited = [_]bool{false} ** 4;
    var order = std.ArrayList(usize).init(allocator);
    defer order.deinit();

    try dfs(&graph, 0, &visited, &order);
    std.debug.print("{any}\n", .{order.items});
}
