// combinations() builds the cartesian product of lists of lists
def sizes = ['S', 'M', 'L']
def colors = ['red', 'blue']

def variants = [sizes, colors].combinations()
variants.each { println it }
println "count: ${variants.size()}"

// Use it to generate coordinate grids
def grid = [0..2, 0..1].combinations().collect { x, y -> "($x,$y)" }
println grid.join(' ')

// Closure form transforms each combination
def tags = [['a', 'b'], ['1', '2']].combinations { it.join('-') }
println tags

// Other combinatorics helpers
println([1, 2, 3].permutations().size())
println([1, 2, 3, 4].subsequences().findAll { it.size() == 2 }.size())
