public struct Account {
    public private(set) var balance: Double
    fileprivate var log: [String] = []
    public init(balance: Double) { self.balance = balance }
    public mutating func deposit(_ x: Double) { balance += x; log.append("dep \(x)") }
    internal func history() -> [String] { log }
}
extension Account: CustomStringConvertible {
    public var description: String { "Account(\(balance))" }
}
extension Int { var squared: Int { self * self }; func times(_ f: () -> Void) { for _ in 0..<self { f() } } }
var a = Account(balance: 10)
a.deposit(5)
print(a, a.history(), 7.squared)
3.times { print("tick", terminator: " ") }
print()
