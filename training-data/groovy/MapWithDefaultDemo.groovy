def counts = [:].withDefault { 0 }
'the quick brown fox jumps over the lazy dog the end'.split().each { counts[it]++ }
println counts.findAll { it.value > 1 }

def groups = [:].withDefault { [] }
(1..10).each { groups[it % 3] << it }
println groups

def nested = [:].withDefault { k -> [:].withDefault { 0 } }
nested.a.x += 2
nested.a.y += 5
nested.b.x += 1
println nested

def config = [host: 'localhost', port: 8080]
println config.get('timeout', 30)
println config
println config.getOrDefault('missing', 'n/a')
println config.subMap(['host'])
println config.findResult { k, v -> v instanceof Integer ? k : null }
println config.collectEntries { k, v -> [k.toUpperCase(), v] }
println config.any { k, v -> v == 8080 }
println (config + [debug: true]).keySet()
println config.sort { a, b -> b.key <=> a.key }
