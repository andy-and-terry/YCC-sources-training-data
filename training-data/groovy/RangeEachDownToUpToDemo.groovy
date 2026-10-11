1.upto(3) { print "$it " }
println()
3.downto(1) { print "$it " }
println()
0.step(10, 3) { print "$it " }
println()
10.step(0, -4) { print "$it " }
println()
5.times { print it }
println()
for (i in 0..<3) print "i$i "
println()
(1..3).each { a -> (1..3).each { b -> if (a != b) print "$a$b " } }
println()
