def x = 1
def eager = "x is $x"
def lazy = "x is ${-> x}"
x = 2
println eager
println lazy

def map = [a: 1]
def key = 'a'
println "value: ${map[key]} and ${map.a + 1}"
println "calc: ${[1, 2, 3].sum()}"
println 'single $x not interpolated'
println "escaped \$x and tab\there"
println "${'nested'.toUpperCase()}"
println "$x$x".class.simpleName
println ("$x" as String).class.simpleName
