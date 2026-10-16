let csv = """
name,qty,price
apple,3,0.5
pear,10,0.25
plum,7,0.4
"""

let rows = csv.split(separator: "\n").dropFirst()
var total = 0.0

for row in rows {
    let cols = row.split(separator: ",")
    let qty = Double(cols[1])!
    let price = Double(cols[2])!
    total += qty * price
    print("\(cols[0]): \(qty * price)")
}
print("total: \(total)")
print(csv.split(separator: "\n", maxSplits: 1, omittingEmptySubsequences: true).count)
