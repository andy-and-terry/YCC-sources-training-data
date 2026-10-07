def text = 'Order #123 shipped on 2024-05-17, order #456 on 2024-06-01.'

println((text =~ /#(\d+)/) ? 'has orders' : 'none')
println((text =~ /#(\d+)/).collect { it[1] })
println text.findAll(/\d{4}-\d{2}-\d{2}/)

def m = text =~ /(\d{4})-(\d{2})-(\d{2})/
if (m.find()) {
    def (all, y, mo, d) = m[0]
    println "year=$y month=$mo day=$d"
}

println 'abc123' ==~ /[a-z]+\d+/
println text.replaceAll(/#(\d+)/) { full, id -> "No.${(id as int) + 1}" }
println 'a1b2c3'.replaceAll(/\d/, '#')
println 'one  two   three'.split(/\s+/).toList()

def pattern = ~/(?<key>\w+)=(?<value>\w+)/
'a=1;b=2'.split(';').each { pair ->
    def mm = pattern.matcher(pair)
    if (mm.matches()) println "${mm.group('key')} -> ${mm.group('value')}"
}
