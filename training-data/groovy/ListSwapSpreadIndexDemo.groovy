def list = [10, 20, 30, 40, 50]
println "${list[0]} ${list[-1]}"
println list[1..3]
println list[-2..-1]
println list[[0, 2, 4]]
list[1, 3] = list[3, 1]
println list
(list[0], list[-1]) = [list[-1], list[0]]
println list
println list.indices
println list.head() + list.last()
println list.init().tail()
def (first, second, *rest) = list
println "$first $second $rest"
println list*.plus(1)
