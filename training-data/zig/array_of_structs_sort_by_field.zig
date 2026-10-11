const std = @import("std");

const Item = struct { name: []const u8, price: u32 };

fn byPrice(_: void, a: Item, b: Item) bool {
    return a.price < b.price;
}

pub fn main() void {
    var items = [_]Item{
        .{ .name = "lamp", .price = 40 },
        .{ .name = "pen", .price = 2 },
        .{ .name = "desk", .price = 150 },
        .{ .name = "mug", .price = 8 },
    };
    std.mem.sort(Item, &items, {}, byPrice);
    for (items) |it| std.debug.print("{s:<5} {d:>4}\n", .{ it.name, it.price });
}
