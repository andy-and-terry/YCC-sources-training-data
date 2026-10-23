# Teach Julia how to mix a custom type with built-in numbers using
# convert and promote_rule, so arithmetic "just works".
struct Meters <: Number
    value::Float64
end

Base.convert(::Type{Meters}, x::Real) = Meters(Float64(x))
Base.promote_rule(::Type{Meters}, ::Type{<:Real}) = Meters

Base.:+(a::Meters, b::Meters) = Meters(a.value + b.value)
Base.:*(a::Meters, b::Meters) = Meters(a.value * b.value)
Base.show(io::IO, m::Meters) = print(io, m.value, " m")

a = Meters(2.5)
println(a + Meters(1.5))
println(a + 4)          # 4 is promoted to Meters
println(3 + a)          # works in either order
println(2 * a)

println(promote_type(Meters, Int))
println(promote_type(Int, Float32))
x, y = promote(1, 2.5)
println(typeof(x), " ", typeof(y))
println(convert(Meters, 7))
println(sum([Meters(1.0), Meters(2.0), Meters(3.0)]))
