// Squarefree numbers up to 100; expect 61.
def squarefree(n) { (2..Math.sqrt(n).toInteger()).every { n % (it * it) != 0 } }
println((1..100).count { squarefree(it) })
