macro myassert(expr)
    msg = string(expr)
    return :($(esc(expr)) || error("Assertion failed: " * $msg))
end

x = 5
@myassert x > 0
println("x is positive")

try
    @myassert x > 10
catch e
    println(e)
end
