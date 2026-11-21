// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
def isMunchausen = { int n ->
    n.toString().collect { it as int }.sum { d -> d == 0 ? 0 : d ** d } == n
}

println((1..<5000).findAll(isMunchausen).join(' '))
