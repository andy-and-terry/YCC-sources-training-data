const std = @import("std");

fn dfsHasCycle(graph: []const []const usize, node: usize, visited: []bool, on_stack: []bool) bool {
    visited[node] = true;
    on_stack[node] = true;
    for (graph[node]) |neighbor| {
        if (!visited[neighbor]) {
            if (dfsHasCycle(graph, neighbor, visited, on_stack)) return true;
        } else if (on_stack[neighbor]) {
            return true;
        }
    }
    on_stack[node] = false;
    return false;
}

fn hasCycle(graph: []const []const usize) bool {
    var visited: [4]bool = [_]bool{false} ** 4;
    var on_stack: [4]bool = [_]bool{false} ** 4;
    for (0..graph.len) |i| {
        if (!visited[i]) {
            if (dfsHasCycle(graph, i, &visited, &on_stack)) return true;
        }
    }
    return false;
}

pub fn main() void {
    // 0 -> 1 -> 2 -> {0, 3}: the edge 2->0 closes a back edge, so this
    // graph has a cycle.
    const graph = [_][]const usize{
        &[_]usize{1},
        &[_]usize{2},
        &[_]usize{ 0, 3 },
        &[_]usize{},
    };
    std.debug.print("{}\n", .{hasCycle(&graph)});
}
