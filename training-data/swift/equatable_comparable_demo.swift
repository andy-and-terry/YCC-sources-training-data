struct Version: Equatable, Comparable {
    let major: Int
    let minor: Int
    let patch: Int

    static func < (lhs: Version, rhs: Version) -> Bool {
        if lhs.major != rhs.major { return lhs.major < rhs.major }
        if lhs.minor != rhs.minor { return lhs.minor < rhs.minor }
        return lhs.patch < rhs.patch
    }
}

let versions = [
    Version(major: 1, minor: 2, patch: 0),
    Version(major: 1, minor: 0, patch: 5),
    Version(major: 2, minor: 0, patch: 0),
]

print(versions.sorted().map { "\($0.major).\($0.minor).\($0.patch)" })
print(Version(major: 1, minor: 0, patch: 0) == Version(major: 1, minor: 0, patch: 0))
print(Version(major: 1, minor: 0, patch: 0) < Version(major: 1, minor: 1, patch: 0))
