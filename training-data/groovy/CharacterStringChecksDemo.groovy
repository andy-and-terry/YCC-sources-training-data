def s = "Hello, World 123!"
println s.count { it.isUpperCase() }
println s.findAll { it.isDigit() }.join()
println s.toList().groupBy { it.isLetter() ? 'letter' : 'other' }.collectEntries { k, v -> [k, v.size()] }
println s.replaceAll(/[^A-Za-z]/, '')
println s.reverse()
println s.toLowerCase().toSet().size()
println (s as List).unique().size()
println s.tr('lo', '01')
println s.center(25, '*')
println s.padLeft(20, '.')
println s.padRight(20, '.') + '|'
println s.capitalize()
