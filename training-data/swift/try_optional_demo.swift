enum ConversionError: Error {
    case invalid
}

func toEven(_ s: String) throws -> Int {
    guard let n = Int(s), n % 2 == 0 else { throw ConversionError.invalid }
    return n
}

let a = try? toEven("8")
let b = try? toEven("7")
print(a as Any, b as Any)

let c = (try? toEven("x")) ?? -1
print(c)

let all = ["2", "3", "4", "z"].compactMap { try? toEven($0) }
print(all)

let forced = try! toEven("10")
print(forced)
