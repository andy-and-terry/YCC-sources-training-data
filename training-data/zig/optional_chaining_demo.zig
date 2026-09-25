const std = @import("std");

const Manager = struct {
    name: []const u8,
};

const Department = struct {
    name: []const u8,
    manager: ?*const Manager,
};

const Employee = struct {
    name: []const u8,
    department: ?*const Department,
};

fn managerName(employee: Employee) []const u8 {
    const department = employee.department orelse return "no department";
    const manager = department.manager orelse return "no manager";
    return manager.name;
}

pub fn main() void {
    const boss = Manager{ .name = "Grace" };
    const engineering = Department{ .name = "Engineering", .manager = &boss };
    const unstaffed = Department{ .name = "Research", .manager = null };

    const alice = Employee{ .name = "Alice", .department = &engineering };
    const bob = Employee{ .name = "Bob", .department = &unstaffed };
    const carol = Employee{ .name = "Carol", .department = null };

    std.debug.print("{s}: {s}\n", .{ alice.name, managerName(alice) });
    std.debug.print("{s}: {s}\n", .{ bob.name, managerName(bob) });
    std.debug.print("{s}: {s}\n", .{ carol.name, managerName(carol) });
}
