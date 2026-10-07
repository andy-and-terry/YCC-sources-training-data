const std = @import("std");

const Edge = struct { to: usize, weight: i32 };

// A* search over a small weighted graph with a given heuristic
// (straight-line estimate to the goal); like Dijkstra but prefers
// nodes whose estimated total cost (g + h) is lowest.
fn aStar(graph: []const []const Edge, heuristic: []const i32, source: usize, goal: usize) i32 {
    var g: [5]i32 = [_]i32{999999} ** 5;
    var visited: [5]bool = [_]bool{false} ** 5;
    g[source] = 0;

    for (0..graph.len) |_| {
        var best_node: ?usize = null;
        var best_f: i32 = 999999;
        for (0..graph.len) |i| {
            if (!visited[i] and g[i] != 999999 and g[i] + heuristic[i] < best_f) {
                best_f = g[i] + heuristic[i];
                best_node = i;
            }
        }
        const node = best_node orelse break;
        if (node == goal) break;
        visited[node] = true;

        for (graph[node]) |edge| {
            const new_g = g[node] + edge.weight;
            if (new_g < g[edge.to]) g[edge.to] = new_g;
        }
    }
    return g[goal];
}

pub fn main() void {
    const graph = [_][]const Edge{
        &[_]Edge{ .{ .to = 1, .weight = 1 }, .{ .to = 2, .weight = 4 } },
        &[_]Edge{ .{ .to = 2, .weight = 2 }, .{ .to = 3, .weight = 5 } },
        &[_]Edge{.{ .to = 3, .weight = 1 }},
        &[_]Edge{.{ .to = 4, .weight = 3 }},
        &[_]Edge{},
    };
    const heuristic = [_]i32{ 4, 3, 1, 1, 0 };
    std.debug.print("{d}\n", .{aStar(&graph, &heuristic, 0, 4)});
}
