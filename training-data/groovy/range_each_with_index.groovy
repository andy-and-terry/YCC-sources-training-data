(1..3).each { println it }
['a', 'b', 'c'].eachWithIndex { v, i -> println "$i:$v" }
println (1..<5).toList()
