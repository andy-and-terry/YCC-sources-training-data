// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
def row = [1L]
def out = [1L]
9.times {
    def next = [0L]
    row.reverse().each { x -> next << next.last() + x }
    row = next
    out << row.last()
}
println out.join(' ')
