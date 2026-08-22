const std = @import("std");

fn bubbleSort(arr: []i32) void {
    var i: usize = 0;
    while (i < arr.len) : (i += 1) {
        var j: usize = 0;
        while (j < arr.len - i - 1) : (j += 1) {
            if (arr[j] > arr[j + 1]) {
                const temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

pub fn main() void {
    var data = [_]i32{ 5, 2, 9, 1, 5, 6 };
    bubbleSort(&data);
    std.debug.print("{any}\n", .{data});
}
