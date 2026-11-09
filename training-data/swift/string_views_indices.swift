let s = "Hello, Swift"
print(s.count, s.prefix(5), s.suffix(5))
let i = s.firstIndex(of: ",")!
print(s[..<i], s[s.index(after: i)...])
print(s.split(separator: " ").map { $0.uppercased() })
