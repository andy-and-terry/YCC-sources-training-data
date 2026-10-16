let big = Int8.max
print(big)

let (sum, overflowed) = big.addingReportingOverflow(1)
print(sum, overflowed)

print(big &+ 1)
print(Int8.min &- 1)
print(UInt8.max &* 2)

let clamped = min(Int(big) + 100, Int(Int8.max))
print(clamped)
print(Int.max.multipliedReportingOverflow(by: 2).overflow)
print(UInt8(truncatingIfNeeded: 300))
print(Int8(exactly: 300) as Any)
