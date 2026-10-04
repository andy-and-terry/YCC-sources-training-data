def stock = [apple: 5, pear: 0, fig: 12]

stock.banana = 7
stock['kiwi'] = 3
println stock
println stock.get('plum', -1)
println stock.getOrDefault('plum', 0)

println stock.findAll { k, v -> v > 4 }
println stock.collectEntries { k, v -> [k.toUpperCase(), v * 2] }
println stock.sort { -it.value }.keySet()
println stock.max { it.value }.key
println stock.values().sum()
println stock.subMap(['apple', 'fig'])
println stock.groupBy { it.value % 2 == 0 ? 'even' : 'odd' }

def merged = stock + [fig: 100, lime: 1]
println merged
println stock.keySet().intersect(merged.keySet()).sort()

stock.each { name, qty -> if (qty == 0) println "$name is out" }
stock.removeAll { it.value == 0 }
println stock.containsKey('pear')

def counts = [:].withDefault { 0 }
'mississippi'.each { counts[it]++ }
println counts

def nested = [a: [b: [c: 1]]]
println nested.a.b.c
println nested?.x?.y
