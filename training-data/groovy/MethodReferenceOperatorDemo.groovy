def words = ['pear', 'fig', 'banana']
println words.collect(String::length)
println words.collect(String::toUpperCase)
def f = this.&twice
println f(21)
println [1, 2, 3].collect(f)
def sorter = words.&sort
println sorter { it.size() }

def twice(x) { x * 2 }

def m = Math.&max
println m(3, 9)
println ['1', '2'].collect(Integer.&parseInt)
