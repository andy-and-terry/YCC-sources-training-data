func luhnValid(_ input: String) -> Bool {
    let s = input.filter { $0 != " " }
    guard s.count > 1, s.allSatisfy(\.isNumber) else { return false }
    let sum = s.reversed().enumerated().reduce(0) { acc, pair in
        var d = pair.element.wholeNumberValue!
        if pair.offset % 2 == 1 {
            d *= 2
            if d > 9 { d -= 9 }
        }
        return acc + d
    }
    return sum % 10 == 0
}

print(luhnValid("4539 3195 0343 6467"), luhnValid("8273 1232 7352 0569"))
