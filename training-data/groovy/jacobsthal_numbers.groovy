// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
def terms = []
long a = 0, b = 1
15.times {
    terms << a
    (a, b) = [b, b + 2 * a]
}
println terms.join(' ')
