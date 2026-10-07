const std = @import("std");

// In-place 3-way partition of a 0/1/2 array around pivot 1, using
// low/mid/high pointers (the Dutch national flag problem).
fn dutchFlag(arr: []i32) void {
    var low: usize = 0;
    var mid: usize = 0;
    var high: usize = arr.len - 1;

    while (mid <= high) {
        switch (arr[mid]) {
            0 => {
                std.mem.swap(i32, &arr[low], &arr[mid]);
                low += 1;
                mid += 1;
            },
            1 => mid += 1,
            else => {
                std.mem.swap(i32, &arr[mid], &arr[high]);
                if (high == 0) break;
                high -= 1;
            },
        }
    }
}

pub fn main() void {
    var arr = [_]i32{ 2, 0, 1, 1, 0, 2, 1, 0, 2 };
    dutchFlag(&arr);
    std.debug.print("{any}\n", .{arr});
}
