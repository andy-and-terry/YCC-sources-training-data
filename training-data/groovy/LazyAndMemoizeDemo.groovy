class Service {
    @Lazy volatile String config = loadConfig()

    private String loadConfig() {
        println "loading config..."
        "prod-config"
    }
}

def s = new Service()
println "created"
println s.config
println s.config

def slowSquare = { n -> println "computing $n"; n * n }
def fast = slowSquare.memoize()
println fast(4)
println fast(4)
println fast(5)
