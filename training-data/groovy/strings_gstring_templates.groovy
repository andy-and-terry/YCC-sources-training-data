def name = 'Ada'
def n = 3
println "Hello $name, ${n * 2} items, ${name.toUpperCase()}"
println 'single $quoted'
println """multi
  line $name"""
println '''triple'''
def s = 'Hello, World'
println s.reverse() + s.size() + s[0] + s[-1] + s[0..4] + s.substring(7)
println s.replaceAll(/o/, '0') + ' ' + (s =~ /W\w+/)[0] + ' ' + (s ==~ /Hello.*/)
println s.tokenize(', ') + s.split(', ').toList()
println "x".padLeft(4, '.') + "x".padRight(4, '.') + 'ab' * 3
println s.contains('World') && s.startsWith('He') && s.endsWith('ld')
println 'a1b22c333'.findAll(/\d+/)
println 'camelCaseString'.replaceAll(/([A-Z])/, '_$1').toLowerCase()
println String.format('%05.1f|%-5s|%x', 3.14159, 'ab', 255)
println "${1}${'a'}".class.simpleName
println 'it''s'
println (s.collect { it.toUpperCase() }).join()
println s.capitalize() + 'abc'.capitalize() + '  trim '.trim() + 'CSV,line'.split(',').size()
println(/regex\d+/)
