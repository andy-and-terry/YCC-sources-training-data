def isArmstrong(int n) {
    def digits = String.valueOf(n)
    int power = digits.length()
    int total = digits.chars().collect { Character.getNumericValue(it) }
        .sum { Math.pow(it, power) as int }
    return total == n
}

println isArmstrong(153)
println isArmstrong(154)
