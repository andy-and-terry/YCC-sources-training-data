def name = 'World'
def n = 3
println "Hello, ${name.toUpperCase()}! ${n * 2}"
println '''multi
line'''
println "a,b,c".split(',').collect { it.capitalize() }.join('|')
