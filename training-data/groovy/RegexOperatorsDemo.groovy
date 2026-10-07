def text = "Order #123 shipped on 2024-03-15, order #456 pending"

println(text =~ /#\d+/ ? "has order" : "none")
println((text =~ /#(\d+)/).collect { it[1] })
println text.replaceAll(/(\d{4})-(\d{2})-(\d{2})/) { all, y, m, d -> "$d/$m/$y" }

def m = text =~ /(\d{4})-(\d{2})-(\d{2})/
if (m.find()) {
    println "year=${m.group(1)} month=${m.group(2)}"
}
println("abc123" ==~ /[a-z]+\d+/)
println "a1b2c3".findAll(/\d/)*.toInteger().sum()
println "CamelCaseString".split(/(?=[A-Z])/).join("_").toLowerCase()
