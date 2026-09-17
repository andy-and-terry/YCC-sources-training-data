const std = @import("std");

const BASE: u64 = 256;
const MOD: u64 = 1_000_000_007;

/// Rolling-hash substring search; returns the first matching index or null.
fn rabinKarpSearch(text: []const u8, pattern: []const u8) ?usize {
    const n = text.len;
    const m = pattern.len;
    if (m == 0 or m > n) return null;

    var pattern_hash: u64 = 0;
    var window_hash: u64 = 0;
    var high_order: u64 = 1;

    var i: usize = 0;
    while (i < m) : (i += 1) {
        pattern_hash = (pattern_hash * BASE + pattern[i]) % MOD;
        window_hash = (window_hash * BASE + text[i]) % MOD;
        if (i < m - 1) high_order = (high_order * BASE) % MOD;
    }

    i = 0;
    while (true) {
        if (window_hash == pattern_hash and std.mem.eql(u8, text[i .. i + m], pattern)) {
            return i;
        }
        if (i + m >= n) break;
        window_hash = (window_hash + MOD - (@as(u64, text[i]) * high_order) % MOD) % MOD;
        window_hash = (window_hash * BASE + text[i + m]) % MOD;
        i += 1;
    }
    return null;
}

pub fn main() void {
    const text = "abxabcabcaby";
    const pattern = "abcaby";
    if (rabinKarpSearch(text, pattern)) |idx| {
        std.debug.print("{d}\n", .{idx});
    } else {
        std.debug.print("-1\n", .{});
    }

    if (rabinKarpSearch("hello world", "xyz")) |idx| {
        std.debug.print("{d}\n", .{idx});
    } else {
        std.debug.print("-1\n", .{});
    }
}
