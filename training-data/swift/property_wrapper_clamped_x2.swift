@propertyWrapper
struct Clamped {
    private var v: Int
    let range: ClosedRange<Int>
    init(wrappedValue: Int, _ r: ClosedRange<Int>) { range = r; v = min(max(wrappedValue, r.lowerBound), r.upperBound) }
    var wrappedValue: Int { get { v } set { v = min(max(newValue, range.lowerBound), range.upperBound) } }
}
struct S { @Clamped(0...10) var level = 50 }
print(S().level)
