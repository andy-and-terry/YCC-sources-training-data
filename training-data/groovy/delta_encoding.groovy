def encode(List xs) { xs.indexed().collect { i, x -> i == 0 ? x : x - xs[i - 1] } }
def decode(List ds) { int acc = 0; ds.collect { acc += it } }

def d = encode([10, 12, 15, 15, 20])
println d
println decode(d)
