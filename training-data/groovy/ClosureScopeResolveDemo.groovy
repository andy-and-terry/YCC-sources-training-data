class Config {
    String name = "config-owner"
}

class Runner {
    String name = "runner-owner"

    def build() {
        def c = { name }
        c.delegate = new Config()
        [c(), delegateFirst(c)]
    }

    def delegateFirst(Closure c) {
        c.resolveStrategy = Closure.DELEGATE_FIRST
        c()
    }
}

println new Runner().build()

def counter = 0
def inc = { counter++ }
3.times { inc() }
println counter

def outer = { x -> return { y -> x + y } }
println outer(3)(4)
println inc.maximumNumberOfParameters
