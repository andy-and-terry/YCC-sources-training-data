const std = @import("std");
const allocator = std.heap.page_allocator;

fn bfs(graph: []const []const usize, start: usize) ![]usize {
    var visited = try allocator.alloc(bool, graph.len);
    defer allocator.free(visited);
    @memset(visited, false);

    var queue = std.ArrayList(usize).init(allocator);
    defer queue.deinit();
    var order = std.ArrayList(usize).init(allocator);

    visited[start] = true;
    try queue.append(start);
    var head: usize = 0;
    while (head < queue.items.len) {
        const node = queue.items[head];
        head += 1;
        try order.append(node);
        for (graph[node]) |neighbor| {
            if (!visited[neighbor]) {
                visited[neighbor] = true;
                try queue.append(neighbor);
            }
        }
    }
    return order.toOwnedSlice();
}

pub fn main() !void {
    const graph = [_][]const usize{
        &[_]usize{ 1, 2 },
        &[_]usize{ 0, 3 },
        &[_]usize{ 0, 3 },
        &[_]usize{ 1, 2 },
    };
    const order = try bfs(&graph, 0);
    defer allocator.free(order);
    std.debug.print("{any}\n", .{order});
}
