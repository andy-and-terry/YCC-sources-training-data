let mixed: [AnyHashable] = [1, "two", 3.0, "two", 1]
let unique = Set(mixed)
print(unique.count)

var counts: [AnyHashable: Int] = [:]
for item in mixed {
    counts[item, default: 0] += 1
}
print(counts[1] ?? 0)
print(counts["two"] ?? 0)
print(counts[3.0] ?? 0)

let numbers = AnySequence([1, 2, 3, 4])
let letters = AnySequence("abcd")
func describe<S: Sequence>(_ seq: S) -> String {
    seq.map { "\($0)" }.joined(separator: ",")
}
print(describe(numbers))
print(describe(letters))
