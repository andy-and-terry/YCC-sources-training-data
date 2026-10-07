struct Polynomial
    coeffs::Vector{Float64}
end

function evaluate(p::Polynomial, x::Float64)
    return sum(c * x^(i - 1) for (i, c) in enumerate(p.coeffs))
end

pad(v::Vector{Float64}, n::Int) = vcat(v, zeros(n - length(v)))

function Base.:+(p::Polynomial, q::Polynomial)
    n = max(length(p.coeffs), length(q.coeffs))
    return Polynomial(pad(p.coeffs, n) .+ pad(q.coeffs, n))
end

Base.show(io::IO, p::Polynomial) = print(io, join(["$(c)x^$(i-1)" for (i, c) in enumerate(p.coeffs)], " + "))

p1 = Polynomial([1.0, 2.0, 3.0])
p2 = Polynomial([5.0, 1.0])
println(evaluate(p1, 2.0))
println(p1 + p2)
