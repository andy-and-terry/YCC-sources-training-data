const std = @import("std");

const Edge = struct { to: usize, weight: i32 };

fn dijkstra(graph: []const []const Edge, source: usize, dist: []i32) void {
    for (dist) |*d| d.* = 999999;
    dist[source] = 0;
    var visited: [4]bool = [_]bool{false} ** 4;

    for (0..graph.len) |_| {
        var best_node: ?usize = null;
        var best_dist: i32 = 999999;
        for (0..graph.len) |i| {
            if (!visited[i] and dist[i] < best_dist) {
                best_node = i;
                best_dist = dist[i];
            }
        }
        if (best_node) |node| {
            visited[node] = true;
            for (graph[node]) |edge| {
                const new_dist = best_dist + edge.weight;
                if (new_dist < dist[edge.to]) dist[edge.to] = new_dist;
            }
        }
    }
}

pub fn main() void {
    const graph = [_][]const Edge{
        &[_]Edge{ .{ .to = 1, .weight = 1 }, .{ .to = 2, .weight = 4 } },
        &[_]Edge{ .{ .to = 2, .weight = 2 }, .{ .to = 3, .weight = 5 } },
        &[_]Edge{.{ .to = 3, .weight = 1 }},
        &[_]Edge{},
    };
    var dist: [4]i32 = undefined;
    dijkstra(&graph, 0, &dist);
    std.debug.print("{any}\n", .{dist});
}
