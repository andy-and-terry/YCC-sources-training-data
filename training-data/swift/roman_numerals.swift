func intToRoman(_ num: Int) -> String {
    let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    var n = num
    var result = ""
    for (i, value) in values.enumerated() {
        while n >= value {
            result += symbols[i]
            n -= value
        }
    }
    return result
}

print(intToRoman(1994))
