const std = @import("std");
const allocator = std.heap.page_allocator;

const AvlNode = struct {
    value: i32,
    left: ?*AvlNode,
    right: ?*AvlNode,
    height: i32,
};

fn height(node: ?*AvlNode) i32 {
    return if (node) |n| n.height else 0;
}

fn updateHeight(node: *AvlNode) void {
    node.height = 1 + @max(height(node.left), height(node.right));
}

fn balanceFactor(node: ?*AvlNode) i32 {
    return if (node) |n| height(n.left) - height(n.right) else 0;
}

fn rotateRight(y: *AvlNode) *AvlNode {
    const x = y.left.?;
    const t2 = x.right;
    x.right = y;
    y.left = t2;
    updateHeight(y);
    updateHeight(x);
    return x;
}

fn rotateLeft(x: *AvlNode) *AvlNode {
    const y = x.right.?;
    const t2 = y.left;
    y.left = x;
    x.right = t2;
    updateHeight(x);
    updateHeight(y);
    return y;
}

fn insert(node: ?*AvlNode, value: i32) !*AvlNode {
    if (node == null) {
        const new_node = try allocator.create(AvlNode);
        new_node.* = AvlNode{ .value = value, .left = null, .right = null, .height = 1 };
        return new_node;
    }
    const n = node.?;
    if (value < n.value) {
        n.left = try insert(n.left, value);
    } else if (value > n.value) {
        n.right = try insert(n.right, value);
    } else {
        return n;
    }

    updateHeight(n);
    const balance = balanceFactor(n);

    if (balance > 1 and value < n.left.?.value) {
        return rotateRight(n);
    }
    if (balance < -1 and value > n.right.?.value) {
        return rotateLeft(n);
    }
    if (balance > 1 and value > n.left.?.value) {
        n.left = rotateLeft(n.left.?);
        return rotateRight(n);
    }
    if (balance < -1 and value < n.right.?.value) {
        n.right = rotateRight(n.right.?);
        return rotateLeft(n);
    }

    return n;
}

fn inorder(node: ?*AvlNode, result: *std.ArrayList(i32)) !void {
    if (node) |n| {
        try inorder(n.left, result);
        try result.append(n.value);
        try inorder(n.right, result);
    }
}

pub fn main() !void {
    var root: ?*AvlNode = null;
    const values = [_]i32{ 10, 20, 30, 40, 50, 25 };
    for (values) |v| {
        root = try insert(root, v);
    }

    var result = std.ArrayList(i32).init(allocator);
    defer result.deinit();
    try inorder(root, &result);
    std.debug.print("{any}\n", .{result.items});
    std.debug.print("{d} {d}\n", .{ root.?.value, root.?.height });
}
