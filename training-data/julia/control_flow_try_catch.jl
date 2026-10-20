function risky(x)
    x < 0 && throw(ArgumentError("negative"))
    x == 0 && error("zero not allowed")
    return sqrt(x)
end
for v in (4, -1, 0)
    try
        println(risky(v))
    catch e
        println(typeof(e), ": ", e isa ArgumentError ? e.msg : sprint(showerror, e))
    finally
        println("checked ", v)
    end
end
struct MyErr <: Exception; code::Int; end
Base.showerror(io::IO, e::MyErr) = print(io, "MyErr code ", e.code)
try throw(MyErr(7)) catch e; println(sprint(showerror, e)) end
println(try parse(Int, "x") catch; -1 end)
r = tryparse(Float64, "1.5")
println(something(r, 0.0), " ", isnothing(tryparse(Int, "z")))
i = 0
while true
    i += 1
    i == 2 && continue
    i > 4 && break
    print(i, " ")
end
println()
println(ifelse(3 > 2, "yes", "no"), " ", 3 > 2 ? "t" : "f", " ", (1 < 2) && (2 < 3))
