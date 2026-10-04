def text = 'Order 1042 shipped on 2024-03-09; order 2077 pending since 2024-04-01.'

// =~ builds a Matcher, ==~ requires a full match
def matcher = text =~ /(\d{4})-(\d{2})-(\d{2})/
println matcher.count
matcher.each { full, y, m, d -> println "date: $d/$m/$y" }

println text.findAll(/\d{4}(?!-)/)
println(('2024-03-09' ==~ /\d{4}-\d{2}-\d{2}/) ? 'full match' : 'no match')
println(('x2024-03-09' ==~ /\d{4}-\d{2}-\d{2}/) ? 'full match' : 'no match')

println text.replaceAll(/order (\d+)/) { all, id -> "#${id}" }
println text.replaceFirst(/\d{4}-\d{2}-\d{2}/, 'DATE')

def m = 'key=value' =~ /(\w+)=(\w+)/
if (m.matches()) {
    println "${m.group(1)} -> ${m.group(2)}"
}

def pattern = ~/(?i)ship+ed/
println pattern.matcher(text).find()
println 'a1b22c333'.split(/\d+/).toList()
println 'hello world'.replaceAll(/\b(\w)/) { all, c -> c.toUpperCase() }
