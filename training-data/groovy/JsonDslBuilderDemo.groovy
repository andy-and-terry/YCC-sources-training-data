class ConfigBuilder {
    def config = [:]

    def methodMissing(String name, args) {
        if (args.length == 1 && args[0] instanceof Closure) {
            def nested = new ConfigBuilder()
            args[0].delegate = nested
            args[0].resolveStrategy = Closure.DELEGATE_FIRST
            args[0]()
            config[name] = nested.config
        } else if (args.length == 1) {
            config[name] = args[0]
        } else {
            config[name] = args as List
        }
        return null
    }
}

def build(Closure spec) {
    def builder = new ConfigBuilder()
    spec.delegate = builder
    spec.resolveStrategy = Closure.DELEGATE_FIRST
    spec()
    return builder.config
}

def cfg = build {
    host "localhost"
    port 8080
    database {
        name "app_db"
        pool 10
    }
}

println cfg
println cfg.database.name
