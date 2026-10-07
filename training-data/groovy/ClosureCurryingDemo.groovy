def volume = { int l, int w, int h -> l * w * h }

def fixedHeight = volume.ncurry(2, 5)
println fixedHeight(2, 3)

def multiply = { int a, int b -> a * b }
def triple = multiply.curry(3)
println triple(5)

def subtract = { int a, int b -> a - b }
def subtractFrom10 = subtract.rcurry(10)
println subtractFrom10(3)
