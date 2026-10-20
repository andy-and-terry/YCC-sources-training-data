def a = null
println a?.length() ?: 'none'
def b = 'text'
println b?.length() ?: 'none'
println (a ?: 'default')
def c
c ?= 5
def list = [[name: 'x', n: 1], [name: 'y', n: 2]]
println list*.name
println list.n.sum()
println 'abc'*.toUpperCase()
def args = [1, 2, 3]
def sum3 = { x, y, z -> x + y + z }
println sum3(*args)
println [*[1, 2], 3]
println ([a: 1, *: [b: 2]])
println 7 <=> 3
println 'a' in ['a', 'b']
println 5 in 1..10
println 2**10
println 7.intdiv(2) + ' ' + 7 % 3 + ' ' + 7 / 2
println 0.1 + 0.2 == 0.3
println 0.1G + 0.2G == 0.3G
println (1 <=> 2) == -1
println 'abc'.is('abc')
println !!''
println !![0]
println (null == false)
def (x, y) = [10, 20]
println x + y
println  "${x > 5 ? 'big' : 'small'}"
