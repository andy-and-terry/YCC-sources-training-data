struct Permissions: OptionSet {
    let rawValue: Int

    static let read = Permissions(rawValue: 1 << 0)
    static let write = Permissions(rawValue: 1 << 1)
    static let execute = Permissions(rawValue: 1 << 2)

    static let all: Permissions = [.read, .write, .execute]
}

var perms: Permissions = [.read, .write]
print(perms.contains(.write))
print(perms.contains(.execute))

perms.insert(.execute)
perms.remove(.read)
print(perms.rawValue)
print(perms == [.write, .execute])
print(Permissions.all.rawValue)
