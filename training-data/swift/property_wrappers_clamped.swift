@propertyWrapper
struct Clamped {
    private var v: Int
    let range: ClosedRange<Int>
    var wrappedValue: Int {
        get { v }
        set { v = min(max(newValue, range.lowerBound), range.upperBound) }
    }
    init(wrappedValue: Int, _ r: ClosedRange<Int>) { range = r; v = min(max(wrappedValue, r.lowerBound), r.upperBound) }
}
struct Vol { @Clamped(0...10) var level = 5 }
var v = Vol()
v.level = 99
print(v.level)
