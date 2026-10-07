func generateGrayCode(_ n: Int) -> [Int] {
    var result: [Int] = [0]
    for i in 0..<n {
        let increment = 1 << i
        for j in stride(from: result.count - 1, through: 0, by: -1) {
            result.append(result[j] + increment)
        }
    }
    return result
}

func binaryString(_ value: Int, bits: Int) -> String {
    var s = String(value, radix: 2)
    while s.count < bits {
        s = "0" + s
    }
    return s
}

let n = 3
let codes = generateGrayCode(n)
for code in codes {
    print(binaryString(code, bits: n))
}
