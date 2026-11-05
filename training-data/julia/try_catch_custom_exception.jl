struct NegativeError <: Exception
    v::Int
end
Base.showerror(io::IO, e::NegativeError) = print(io, "negative value: ", e.v)

function check(x)
    x < 0 && throw(NegativeError(x))
    return sqrt(x)
end

try
    check(-4)
catch e
    println(sprint(showerror, e))
finally
    println("done")
end
