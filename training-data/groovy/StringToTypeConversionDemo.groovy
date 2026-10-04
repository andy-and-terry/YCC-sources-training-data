println '42'.toInteger() + 1
println '3.14'.toDouble() * 2
println '1e3'.toBigDecimal()
println '99999999999'.toLong()
println 'true'.toBoolean()
println 'yes'.toBoolean()
println 'x'.isInteger()
println '123'.isInteger()
println '12.5'.isNumber()
println 'abc'.isNumber()

println 255.toString(16)
println Integer.toBinaryString(10)
println Integer.parseInt('ff', 16)
println '0b101'.substring(2).with { Integer.parseInt(it, 2) }

println(5 as String)
println('7' as int)
println(3.99 as int)
println(65 as char)
println(('A' as char) as int)
println([1, 2, 3] as Set)
println 'hello'.toList()
println((['a', 'b'] as String[]).class.simpleName)
println 10.intdiv(3)
println 10 / 4
println 10.0.toBigInteger()
println 7.5.round()
println 7.456.round(2)
println 'a,b,c'.tokenize(',')
println 'line1\nline2'.readLines().size()
