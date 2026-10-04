struct Box{T}
    value::T
end

struct Pair2{A, B}
    first::A
    second::B
end

struct NumericBox{T<:Number}
    value::T
end

unbox(b::Box) = b.value
Base.:+(a::NumericBox{T}, b::NumericBox{T}) where {T} = NumericBox(a.value + b.value)

function swap(p::Pair2{A, B}) where {A, B}
    return Pair2{B, A}(p.second, p.first)
end

function describe(v::Vector{T}) where {T}
    return "Vector of $(T) with $(length(v)) elements"
end

println(typeof(Box(1)), " ", typeof(Box("s")), " ", typeof(Box([1.0])))
println(unbox(Box(:sym)))
println(swap(Pair2(1, "one")))
println((NumericBox(2) + NumericBox(40)).value)
println(describe([1, 2, 3]))
println(describe(["a"]))
println(Box{Int} <: Box, Box{Int} <: Box{Number}, Box{Int} <: Box{<:Number})

try
    NumericBox("not a number")
catch e
    println(typeof(e))
end
