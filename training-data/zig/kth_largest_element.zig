const std = @import("std");

// Kth largest element (1 = largest) via k passes of "find and remove
// the current maximum among the not-yet-removed entries".
fn kthLargest(arr: []const i32, removed: []bool, k: usize) i32 {
    @memset(removed, false);
    var best: i32 = 0;
    for (0..k) |_| {
        var best_idx: usize = 0;
        best = std.math.minInt(i32);
        for (arr, 0..) |v, i| {
            if (!removed[i] and v > best) {
                best = v;
                best_idx = i;
            }
        }
        removed[best_idx] = true;
    }
    return best;
}

pub fn main() void {
    const arr = [_]i32{ 3, 2, 1, 5, 6, 4 };
    var removed: [arr.len]bool = undefined;
    std.debug.print("{d}\n", .{kthLargest(&arr, &removed, 2)});

    const arr2 = [_]i32{ 3, 2, 3, 1, 2, 4, 5, 5, 6 };
    var removed2: [arr2.len]bool = undefined;
    std.debug.print("{d}\n", .{kthLargest(&arr2, &removed2, 4)});
}
