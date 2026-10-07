Base.@kwdef struct Config
    host::String = "localhost"
    port::Int = 8080
    debug::Bool = false
end

default_config = Config()
custom_config = Config(port = 9090, debug = true)

println(default_config)
println(custom_config)
println(custom_config.port)
