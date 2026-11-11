// Square of the sum minus sum of squares for 1..10 (expect 2640)
def xs = 1..10
int total = xs.sum()
int squares = xs.collect { it * it }.sum()
println total * total - squares
