const std = @import("std");
const allocator = std.heap.page_allocator;

const TrieNode = struct {
    children: std.AutoHashMap(u8, *TrieNode),
    is_end: bool,

    fn init() !*TrieNode {
        const node = try allocator.create(TrieNode);
        node.* = TrieNode{ .children = std.AutoHashMap(u8, *TrieNode).init(allocator), .is_end = false };
        return node;
    }
};

fn trieInsert(root: *TrieNode, word: []const u8) !void {
    var node = root;
    for (word) |c| {
        if (node.children.get(c)) |child| {
            node = child;
        } else {
            const new_node = try TrieNode.init();
            try node.children.put(c, new_node);
            node = new_node;
        }
    }
    node.is_end = true;
}

fn trieContains(root: *TrieNode, word: []const u8) bool {
    var node = root;
    for (word) |c| {
        if (node.children.get(c)) |child| {
            node = child;
        } else {
            return false;
        }
    }
    return node.is_end;
}

pub fn main() !void {
    const trie = try TrieNode.init();
    try trieInsert(trie, "cat");
    try trieInsert(trie, "car");
    std.debug.print("{}\n", .{trieContains(trie, "cat")});
    std.debug.print("{}\n", .{trieContains(trie, "ca")});
}
