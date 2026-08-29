const std = @import("std");
const allocator = std.heap.page_allocator;

const TreeNode = struct {
    value: i32,
    left: ?*TreeNode,
    right: ?*TreeNode,
};

fn insert(node: ?*TreeNode, value: i32, allo: std.mem.Allocator) !*TreeNode {
    if (node) |n| {
        if (value < n.value) {
            n.left = try insert(n.left, value, allo);
        } else if (value > n.value) {
            n.right = try insert(n.right, value, allo);
        }
        return n;
    }
    const new_node = try allo.create(TreeNode);
    new_node.* = TreeNode{ .value = value, .left = null, .right = null };
    return new_node;
}

fn inorder(node: ?*TreeNode, result: *std.ArrayList(i32)) !void {
    if (node) |n| {
        try inorder(n.left, result);
        try result.append(n.value);
        try inorder(n.right, result);
    }
}

pub fn main() !void {
    var root: ?*TreeNode = null;
    const values = [_]i32{ 5, 3, 8, 1, 4, 7, 9 };
    for (values) |v| {
        root = try insert(root, v, allocator);
    }
    var result = std.ArrayList(i32).init(allocator);
    defer result.deinit();
    try inorder(root, &result);
    std.debug.print("{any}\n", .{result.items});
}
