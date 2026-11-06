// Integer (1..3999) to Roman numeral using a greedy table.
def table = [
    1000: 'M', 900: 'CM', 500: 'D', 400: 'CD', 100: 'C', 90: 'XC',
    50: 'L', 40: 'XL', 10: 'X', 9: 'IX', 5: 'V', 4: 'IV', 1: 'I'
]

String toRoman(int n, Map table) {
    def sb = new StringBuilder()
    table.each { value, symbol ->
        while (n >= value) {
            sb << symbol
            n -= value
        }
    }
    sb.toString()
}

println "${toRoman(1994, table)} ${toRoman(58, table)}"
