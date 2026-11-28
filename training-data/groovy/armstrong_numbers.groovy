boolean isArmstrong(int n) {
    def digits = n.toString().collect { it as int }.collect { it - 48 }
    return digits.sum { (it ** digits.size()) as int } == n
}

println((1..999).findAll { isArmstrong(it) }) // [1..9, 153, 370, 371, 407]
