interface Greeter { String greet(String name) }

Greeter g = { n -> "Hi, $n" } as Greeter
println g.greet("Ann")

Runnable r = { println "running" } as Runnable
r.run()

def cmp = { a, b -> b <=> a } as Comparator
println([3, 1, 2].sort(false, cmp))

def multi = [greet: { n -> "Yo $n" }, toString: { "proxy-greeter" }] as Greeter
println multi.greet("Bob")
println multi

Closure<Integer> twice = { it * 2 }
println twice.andThen { it + 1 }(5)
println twice.compose { it + 1 }(5)
