function escape(c::Complex)
    z = 0.0 + 0.0im
    for n in 0:29
        abs2(z) >= 4 && return n
        z = z * z + c
    end
    return 30
end

for yi in -5:5
    println(join(escape(complex(xi / 20, yi / 5)) == 30 ? '#' : '.' for xi in -40:12))
end
