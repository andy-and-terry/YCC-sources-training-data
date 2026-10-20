struct Version: Comparable, Hashable {
    let major, minor: Int
    static func < (l: Version, r: Version) -> Bool { (l.major, l.minor) < (r.major, r.minor) }
}
let vs = [Version(major: 1, minor: 5), Version(major: 1, minor: 2), Version(major: 0, minor: 9)]
print(vs.sorted().map { "\($0.major).\($0.minor)" }, vs.max()!.minor)
var seen: Set<Version> = []
for v in vs + vs { seen.insert(v) }
print(seen.count)
let people = [("bob", 30), ("al", 30), ("cy", 25)]
print(people.sorted { ($1.1, $0.0) < ($0.1, $1.0) }.map(\.0))
