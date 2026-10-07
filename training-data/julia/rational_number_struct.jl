struct Frac
    num::Int
    den::Int
    function Frac(n::Int, d::Int)
        g = gcd(n, d)
        new(div(n, g), div(d, g))
    end
end

Base.:+(a::Frac, b::Frac) = Frac(a.num * b.den + b.num * a.den, a.den * b.den)
Base.:*(a::Frac, b::Frac) = Frac(a.num * b.num, a.den * b.den)
Base.:(==)(a::Frac, b::Frac) = a.num == b.num && a.den == b.den
Base.show(io::IO, r::Frac) = print(io, "$(r.num)/$(r.den)")

a = Frac(1, 2)
b = Frac(1, 3)
println(a + b)
println(a * b)
println(a == Frac(2, 4))
