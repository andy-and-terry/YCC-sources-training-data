def s = 'Hello, Groovy!'
println s[0]
println s[-1]
println s[0..4]
println s[7..-2]
println s[-1..0]
println s.take(5) + '|' + s.drop(7)
println s.center(24, '*')
println s.padLeft(20, '.')
println s.tokenize(', !')
println s * 2
println s.reverse()
println s.toList().unique().size()
println 'a,b;c'.split(/[,;]/).toList()
println "${s.length()} chars, vowels: ${s.count { it in 'aeiouAEIOU'.toList() }}"
