const std = @import("std");
const allocator = std.heap.page_allocator;

const AvlNode = struct {
    value: i32,
    height: i32,
    left: ?*AvlNode,
    right: ?*AvlNode,
};

fn height(node: ?*AvlNode) i32 {
    if (node) |n| return n.height;
    return 0;
}

fn updateHeight(n: *AvlNode) void {
    n.height = 1 + @max(height(n.left), height(n.right));
}

fn balanceFactor(node: ?*AvlNode) i32 {
    if (node) |n| return height(n.left) - height(n.right);
    return 0;
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
        new_node.* = AvlNode{ .value = value, .height = 1, .left = null, .right = null };
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
    // Classic textbook sequence: 30 ends up as the balanced root after a
    // right-right rotation (inserting 30) and a left-right rotation
    // (inserting 25).
    const values = [_]i32{ 10, 20, 30, 40, 50, 25 };
    for (values) |v| {
        root = try insert(root, v);
    }
    var result = std.ArrayList(i32).init(allocator);
    defer result.deinit();
    try inorder(root, &result);
    std.debug.print("{any}\n", .{result.items});
    std.debug.print("root value: {}\n", .{root.?.value});
}
