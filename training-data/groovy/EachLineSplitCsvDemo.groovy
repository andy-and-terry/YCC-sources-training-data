def csv = '''name,qty,price
apple,3,0.5
pear,10,0.25
fig,1,2.0'''
def lines = csv.readLines()
def header = lines.head().split(',')
def rows = lines.tail().collect { l ->
    [header, l.split(',')].transpose().collectEntries()
}
println rows
def total = rows.sum { it.qty.toInteger() * it.price.toBigDecimal() }
println total
rows.each { printf '%-6s %3d %6.2f%n', it.name, it.qty as int, it.price as double }
println rows.collect { it.name }.sort().join('|')
