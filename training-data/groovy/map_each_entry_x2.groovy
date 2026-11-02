def m = [x: 1, y: 2]
m.each { k, v -> println "$k -> $v" }
println m.collectEntries { k, v -> [(v): k] }
