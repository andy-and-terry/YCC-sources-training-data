const std = @import("std");

// Tarjan's strongly-connected-components algorithm over a small fixed
// adjacency list, using an explicit stack and index/lowlink arrays.
const N = 6;

var index_of: [N]i32 = [_]i32{-1} ** N;
var lowlink: [N]i32 = [_]i32{-1} ** N;
var on_stack: [N]bool = [_]bool{false} ** N;
var stack: [N]usize = undefined;
var stack_len: usize = 0;
var counter: i32 = 0;

fn strongConnect(graph: []const []const usize, v: usize, components: *std.ArrayList([]usize), allocator: std.mem.Allocator) !void {
    index_of[v] = counter;
    lowlink[v] = counter;
    counter += 1;
    stack[stack_len] = v;
    stack_len += 1;
    on_stack[v] = true;

    for (graph[v]) |w| {
        if (index_of[w] == -1) {
            try strongConnect(graph, w, components, allocator);
            lowlink[v] = @min(lowlink[v], lowlink[w]);
        } else if (on_stack[w]) {
            lowlink[v] = @min(lowlink[v], index_of[w]);
        }
    }

    if (lowlink[v] == index_of[v]) {
        var comp = std.ArrayList(usize).init(allocator);
        while (true) {
            stack_len -= 1;
            const w = stack[stack_len];
            on_stack[w] = false;
            try comp.append(w);
            if (w == v) break;
        }
        try components.append(try comp.toOwnedSlice());
    }
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const graph = [_][]const usize{
        &[_]usize{1},
        &[_]usize{2},
        &[_]usize{ 0, 3 },
        &[_]usize{4},
        &[_]usize{5},
        &[_]usize{3},
    };

    var components = std.ArrayList([]usize).init(allocator);
    defer components.deinit();

    for (0..N) |v| {
        if (index_of[v] == -1) {
            try strongConnect(&graph, v, &components, allocator);
        }
    }

    for (components.items) |comp| {
        std.debug.print("{any}\n", .{comp});
    }
}
