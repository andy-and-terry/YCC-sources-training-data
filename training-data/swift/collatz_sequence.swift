func collatz(_ start: Int) -> [Int] {
    precondition(start > 0, "start must be positive")
    var n = start
    var sequence = [n]
    while n != 1 {
        n = n.isMultiple(of: 2) ? n / 2 : 3 * n + 1
        sequence.append(n)
    }
    return sequence
}

let seq = collatz(27)
print("Steps for 27: \(seq.count - 1)")
print("Peak value: \(seq.max()!)")
print(collatz(6))
