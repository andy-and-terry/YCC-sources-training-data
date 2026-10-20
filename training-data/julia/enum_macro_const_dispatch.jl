@enum Color red green blue
@enum Level::UInt8 low=1 mid=5 high=10
println(red, " ", Int(blue), " ", Color(1), " ", instances(Color), " ", high, " ", Int(mid))
describe(c::Color) = c == red ? "warm" : "cool"
println(map(describe, [red, green]))
println(Symbol("abc"), " ", :a == :a, " ", Symbol("x", 1), " ", string(:sym))
const SHAPES = (:circle, :square)
area(::Val{:circle}, r) = π * r^2
area(::Val{:square}, s) = s^2
println(area(Val(:square), 3), " ", area(Val(:circle), 1) |> x -> round(x, digits=2))
Base.@kwdef struct Config
    host::String = "localhost"
    port::Int = 80
end
println(Config(), " ", Config(port=8080))
println(isa(1, Number), " ", Int <: Number, " ", supertype(Int), " ", subtypes(Real) |> length >= 3)
println(Union{Int,String} <: Any, " ", typeof(nothing), " ", something(nothing, 5), " ", coalesce(missing, 1))
