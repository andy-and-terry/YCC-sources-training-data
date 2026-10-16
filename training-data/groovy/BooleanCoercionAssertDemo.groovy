def check = { v -> v ? 'truthy' : 'falsy' }
[0, 1, '', 'x', [], [0], [:], [a: 1], null, 0.0, new Object()].each {
    println "${it.inspect().padRight(12)} ${check(it)}"
}
println (!!'abc')
println (null ?: 'default')
println ('' ?: 'empty')
def m = [:]
println (m.missing ?: 'no value')
println (1 && 'a')
println (0 || 'fallback')
