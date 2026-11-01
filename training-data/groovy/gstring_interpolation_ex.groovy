def name = 'World'
def n = 3
println "Hello, ${name.toUpperCase()}! ${n * 2}"
println '''multi
line'''
println "Total: ${String.format('%.2f', 3.14159)}"
println "a-b-c".tokenize('-')
