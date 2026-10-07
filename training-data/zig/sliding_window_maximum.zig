const std = @import("std");

fn slidingWindowMaximum(allocator: std.mem.Allocator, nums: []const i32, k: usize) ![]i32 {
    var deque = std.ArrayList(usize).init(allocator);
    defer deque.deinit();
    var result = std.ArrayList(i32).init(allocator);

    for (nums, 0..) |num, i| {
        while (deque.items.len > 0 and nums[deque.items[deque.items.len - 1]] <= num) {
            _ = deque.pop();
        }
        try deque.append(i);
        if (deque.items[0] + k <= i) {
            _ = deque.orderedRemove(0);
        }
        if (i + 1 >= k) {
            try result.append(nums[deque.items[0]]);
        }
    }
    return result.toOwnedSlice();
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const nums = [_]i32{ 1, 3, -1, -3, 5, 3, 6, 7 };
    const maxes = try slidingWindowMaximum(allocator, &nums, 3);
    defer allocator.free(maxes);
    std.debug.print("{any}\n", .{maxes});
}
