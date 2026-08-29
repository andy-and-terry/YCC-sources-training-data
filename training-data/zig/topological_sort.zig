const std = @import("std");
const allocator = std.heap.page_allocator;

const Graph = std.StringHashMap([]const []const u8);

fn visit(node: []const u8, graph: *Graph, visited: *std.StringHashMap(bool), order: *std.ArrayList([]const u8)) !void {
    if (visited.contains(node)) return;
    try visited.put(node, true);
    if (graph.get(node)) |deps| {
        for (deps) |dep| {
            try visit(dep, graph, visited, order);
        }
    }
    try order.append(node);
}

pub fn main() !void {
    var graph = Graph.init(allocator);
    defer graph.deinit();
    try graph.put("a", &[_][]const u8{ "b", "c" });
    try graph.put("b", &[_][]const u8{"d"});
    try graph.put("c", &[_][]const u8{"d"});
    try graph.put("d", &[_][]const u8{});

    var visited = std.StringHashMap(bool).init(allocator);
    defer visited.deinit();
    var order = std.ArrayList([]const u8).init(allocator);
    defer order.deinit();

    var it = graph.keyIterator();
    while (it.next()) |key| {
        try visit(key.*, &graph, &visited, &order);
    }
    std.debug.print("{s}\n", .{order.items});
}
