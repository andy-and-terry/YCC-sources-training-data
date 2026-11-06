// Repunits: numbers made only of the digit 1.
def r = 0L
def out = (1..5).collect { r = r * 10 + 1 }
println out
