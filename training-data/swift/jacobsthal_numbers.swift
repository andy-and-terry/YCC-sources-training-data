// Jacobsthal numbers: J0 = 0, J1 = 1, Jn = J(n-1) + 2*J(n-2)
func jacobsthal(_ count: Int) -> [Int] {
    var terms = [0, 1]
    while terms.count < count {
        terms.append(terms[terms.count - 1] + 2 * terms[terms.count - 2])
    }
    return Array(terms.prefix(count))
}

print(jacobsthal(15).map(String.init).joined(separator: " "))
