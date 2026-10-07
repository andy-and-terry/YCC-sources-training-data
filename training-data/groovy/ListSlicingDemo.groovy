def letters = ('a'..'j').toList()

println letters[0]
println letters[-1]
println letters[2..4]
println letters[-3..-1]
println letters[4..<7]
println letters[7..2]
println letters[0, 3, 5]
println letters[1..3, 8]
println letters.take(3)
println letters.drop(7)
println letters.takeRight(2)
println letters.head() + letters.tail().join()
println letters.last()
println letters.subList(2, 5)
println letters.indices
println letters.step(3)
println letters.withIndex().findAll { l, i -> i % 4 == 0 }*.first()
println letters.collate(4)
println letters.reverse().take(2)

letters[1..2] = ['X']
println letters
letters[0] = 'A'
println letters
println letters.findIndexOf { it == 'X' }
println letters.indexed()[3]
