class Config {
    String host = 'default-host'
    int port = 80
}

def withConfig(Config cfg, int strategy, Closure body) {
    def c = body.clone()
    c.delegate = cfg
    c.resolveStrategy = strategy
    c()
}

def cfg = new Config()

// Owner-first lookup: the Outer instance (closure owner) wins over the delegate.
class Holder {
    String host = 'owner-host'

    Closure build(Config cfg) {
        Closure c = { -> host }
        c.delegate = cfg
        c.resolveStrategy = Closure.OWNER_FIRST
        c
    }
}

println withConfig(cfg, Closure.DELEGATE_FIRST) { host }
println withConfig(cfg, Closure.DELEGATE_ONLY) { port }
println withConfig(cfg, Closure.DELEGATE_FIRST) { "${host}:${port}" }

def configure(Closure c) {
    def cfg = new Config()
    c.delegate = cfg
    c.resolveStrategy = Closure.DELEGATE_FIRST
    c()
    cfg
}

def result = configure {
    host = 'example.org'
    port = 8080
}
println "${result.host}:${result.port}"
println new Holder().build(cfg)()
