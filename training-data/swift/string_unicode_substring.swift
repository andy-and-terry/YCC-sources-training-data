let s = "Héllo, 世界 👋"
print(s.count, s.utf8.count, s.unicodeScalars.count)
print(s.prefix(5), s.suffix(2), s.uppercased(), s.reversed().map(String.init).joined())
let idx = s.firstIndex(of: ",")!
print(s[s.startIndex..<idx], s[s.index(after: idx)...].trimmingCharacters(in: .whitespaces))
print(s.contains("世界"), s.hasPrefix("Hé"), s.split(separator: " ").count)
print("a-b-c".replacingOccurrences(of: "-", with: "+"), "swift".capitalized, String(repeating: "ab", count: 3))
let multi = """
    line one
      indented
    """
print(multi.components(separatedBy: "\n").count, "x\(1 + 1)y", "%03d".format(7))
extension String { func format(_ v: Int) -> String { String(format: self, v) } }
