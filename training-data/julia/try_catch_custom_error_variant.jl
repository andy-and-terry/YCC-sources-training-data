struct InvalidInput <: Exception
    msg::String
end

check(x) = x < 0 ? throw(InvalidInput("negative: $x")) : sqrt(x)

for v in (4, -1)
    try
        println(check(v))
    catch e
        e isa InvalidInput ? println("error: ", e.msg) : rethrow()
    end
end
