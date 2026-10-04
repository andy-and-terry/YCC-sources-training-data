const std = @import("std");

const Person = struct {
    name: []const u8,
    age: u8,
};

fn byAge(_: void, a: Person, b: Person) bool {
    return a.age < b.age;
}

pub fn main() void {
    var nums = [_]i32{ 5, 2, 9, -1, 7, 2 };
    std.mem.sort(i32, &nums, {}, std.sort.asc(i32));
    std.debug.print("asc:  {any}\n", .{nums});

    std.mem.sort(i32, &nums, {}, std.sort.desc(i32));
    std.debug.print("desc: {any}\n", .{nums});

    var people = [_]Person{
        .{ .name = "Cleo", .age = 41 },
        .{ .name = "Abe", .age = 19 },
        .{ .name = "Bea", .age = 30 },
    };
    std.mem.sort(Person, &people, {}, byAge);
    for (people) |p| {
        std.debug.print("{s} ({d})\n", .{ p.name, p.age });
    }

    std.debug.print("min={d} max={d}\n", .{ std.mem.min(i32, &nums), std.mem.max(i32, &nums) });
    std.debug.print("sorted? {}\n", .{std.sort.isSorted(i32, &nums, {}, std.sort.desc(i32))});
}
