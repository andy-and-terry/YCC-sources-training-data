def toRoman(int n) {
    def values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    def symbols = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I']
    def result = new StringBuilder()
    int remaining = n
    values.eachWithIndex { v, i ->
        while (remaining >= v) {
            result << symbols[i]
            remaining -= v
        }
    }
    return result.toString()
}

println toRoman(1994)
