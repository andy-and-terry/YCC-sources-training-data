def makeCounter() {
    def count = 0
    return { -> count += 1; count }
}

def counter = makeCounter()
println "${counter()} ${counter()} ${counter()}"

def numbers = [1, 2, 3, 4, 5]
println numbers.collect { it * it }
println numbers.inject(0) { acc, n -> acc + n }
