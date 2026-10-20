def adder = { int a, int b -> a + b }
def add5 = adder.curry(5)
println add5(10)
def compose = { f, g -> { x -> f(g(x)) } }
def inc = { it + 1 }
def dbl = { it * 2 }
println compose(inc, dbl)(5)
println (inc >> dbl)(5)
println (inc << dbl)(5)
def counter = { int n = 0; return { -> ++n } }()
counter(); counter()
println counter()
class Config { String name; int port }
def build = { name = 'svc'; port = 8080 }
build.delegate = new Config()
build.resolveStrategy = Closure.DELEGATE_FIRST
build()
println "${build.delegate.name}:${build.delegate.port}"
println([1, 2, 3].collect { it * it }.inject(0) { acc, v -> acc + v })
def memo = { n -> n * 2 }.memoize()
println memo(4) + memo(4)
