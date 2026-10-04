struct Complex2
    re::Float64
    im::Float64
end

function Base.show(io::IO, z::Complex2)
    sign = z.im < 0 ? "-" : "+"
    print(io, z.re, " ", sign, " ", abs(z.im), "i")
end

struct Matrix2
    rows::Vector{Vector{Int}}
end

function Base.show(io::IO, ::MIME"text/plain", m::Matrix2)
    println(io, "Matrix2 with ", length(m.rows), " rows:")
    for r in m.rows
        println(io, "  ", join(r, " "))
    end
end

Base.show(io::IO, m::Matrix2) = print(io, "Matrix2(", length(m.rows), " rows)")

struct Tagged
    tag::Symbol
    value::Any
end
Base.show(io::IO, t::Tagged) = print(io, "#", t.tag, "(", repr(t.value), ")")

z = Complex2(1.5, -2)
println(z)
println([z, Complex2(0, 1)])
display(Matrix2([[1, 2], [3, 4]]))
println(Matrix2([[1]]))
println(Tagged(:name, "Ada"))
println(repr(Tagged(:n, 3)))
println(sprint(show, z))
println(string(z))
println("interpolated: $z")
println(repr("text/plain", Matrix2([[7]])))
