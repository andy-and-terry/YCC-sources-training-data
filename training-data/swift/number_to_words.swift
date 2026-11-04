let ones = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
            "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
            "seventeen", "eighteen", "nineteen"]
let tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

func words(_ n: Int) -> String {
    switch n {
    case ..<20: return ones[n]
    case ..<100: return tens[n / 10] + (n % 10 > 0 ? "-" + ones[n % 10] : "")
    case ..<1000: return ones[n / 100] + " hundred" + (n % 100 > 0 ? " " + words(n % 100) : "")
    default: return words(n / 1000) + " thousand" + (n % 1000 > 0 ? " " + words(n % 1000) : "")
    }
}

for n in [0, 13, 42, 100, 999, 12345] { print(n, "->", words(n)) }
