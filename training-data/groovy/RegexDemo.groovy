def text = 'Order 123 shipped on 2024-05-17, order 456 on 2024-06-01'

println text =~ /\d+/ ? 'has digits' : 'no digits'
println (text =~ /order (\d+)/).findAll()*.get(1)

def m = text =~ /(\d{4})-(\d{2})-(\d{2})/
while (m.find()) {
    println "year=${m.group(1)} month=${m.group(2)} day=${m.group(3)}"
}

println 'abc123' ==~ /[a-z]+\d+/
println text.replaceAll(/\d{4}-\d{2}-\d{2}/) { it.replace('-', '/') }
println 'a1b22c333'.findAll(/\d+/)
