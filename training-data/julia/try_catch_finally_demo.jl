function safe_div(a, b)
    try
        return a ÷ b
    catch e
        if e isa DivideError
            println("caught: ", sprint(showerror, e))
            return nothing
        end
        rethrow()
    finally
        println("finished dividing $a by $b")
    end
end

println(safe_div(10, 2))
println(safe_div(1, 0))

struct ValidationError <: Exception
    field::Symbol
    msg::String
end

Base.showerror(io::IO, e::ValidationError) = print(io, "invalid ", e.field, ": ", e.msg)

function validate(age)
    age < 0 && throw(ValidationError(:age, "must be non-negative"))
    return age
end

for a in (5, -1)
    try
        println("ok: ", validate(a))
    catch err
        println(sprint(showerror, err))
    end
end

result = try
    parse(Int, "abc")
catch
    -1
end
println(result)

try
    [1, 2, 3][5]
catch e
    println(typeof(e))
end
println(something(nothing, "fallback"))
