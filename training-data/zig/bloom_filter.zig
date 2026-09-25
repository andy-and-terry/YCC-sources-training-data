const std = @import("std");

const BloomFilter = struct {
    bits: [64]bool = [_]bool{false} ** 64,

    fn hash1(word: []const u8) usize {
        return std.hash.Wyhash.hash(0, word) % 64;
    }

    fn hash2(word: []const u8) usize {
        return std.hash.Wyhash.hash(42, word) % 64;
    }

    fn add(self: *BloomFilter, word: []const u8) void {
        self.bits[hash1(word)] = true;
        self.bits[hash2(word)] = true;
    }

    fn mightContain(self: *BloomFilter, word: []const u8) bool {
        return self.bits[hash1(word)] and self.bits[hash2(word)];
    }
};

pub fn main() void {
    var filter = BloomFilter{};
    filter.add("apple");
    filter.add("banana");

    std.debug.print("{}\n", .{filter.mightContain("apple")});
    std.debug.print("{}\n", .{filter.mightContain("banana")});
    std.debug.print("{}\n", .{filter.mightContain("cherry")});
}
