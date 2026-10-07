def s = "Hello, Groovy World"

println s.reverse()
println s.toLowerCase().replaceAll(/[^a-z]/, "")
println s.tokenize(", ").collect { it.capitalize() }
println s[0..4] + "|" + s[-5..-1] + "|" + s[7, 8]
println s.center(30, "*")
println s.padLeft(25, ".")
println s - "Hello, "
println s.count("o")
println s.toList().unique().size()
println s.chars().filter { Character.isUpperCase(it as char) }.count()
println "%-6s|%6.2f|%03d".formatted("ab", 3.14159, 7)
println "a,b;c".split(/[,;]/) as List
