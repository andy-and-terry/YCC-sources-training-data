def a = new String('hi')
def b = new String('hi')
println a == b
println a.is(b)
println a.equals(b)
println a <=> b
println null == null
println null == 0
println [1, 2] == [1, 2]
println ([1, 2] as Set) == ([2, 1] as Set)
println [a: 1] == [a: 1]
println 1 == 1.0
println 'a'.equals('a' as char)
println([1 <=> 2, 'b' <=> 'a', 3 <=> 3])
