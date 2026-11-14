def people = [[n: 'Ann', a: 30], [n: 'Bob', a: 25]]
println people*.n
println people.collect { it.a }.sum()
println people.findAll { it.a > 26 }.n
println people.groupBy { it.a > 26 }.keySet()
