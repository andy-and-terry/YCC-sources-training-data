const std = @import("std");

fn partition(items: []i32) usize {
    const pivot = items[items.len - 1];
    var i: usize = 0;
    var j: usize = 0;
    while (j < items.len - 1) : (j += 1) {
        if (items[j] < pivot) {
            const tmp = items[i];
            items[i] = items[j];
            items[j] = tmp;
            i += 1;
        }
    }
    const tmp = items[i];
    items[i] = items[items.len - 1];
    items[items.len - 1] = tmp;
    return i;
}

/// Returns the k-th smallest element (0-indexed) via Lomuto-partition quickselect.
fn quickselect(items: []i32, k: usize) i32 {
    if (items.len == 1) return items[0];
    const p = partition(items);
    if (k == p) return items[p];
    if (k < p) return quickselect(items[0..p], k);
    return quickselect(items[p + 1 ..], k - p - 1);
}

pub fn main() void {
    var data = [_]i32{ 7, 2, 1, 6, 8, 5, 3, 4 };
    const fourth_smallest = quickselect(&data, 3);
    std.debug.print("{d}\n", .{fourth_smallest});

    var data2 = [_]i32{ 9, 1, 5, 3 };
    const median_low = quickselect(&data2, 1);
    std.debug.print("{d}\n", .{median_low});
}
