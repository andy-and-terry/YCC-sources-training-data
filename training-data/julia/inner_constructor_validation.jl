struct Temperature
    kelvin::Float64

    function Temperature(k::Real)
        k < 0 && throw(ArgumentError("kelvin must be non-negative, got $k"))
        new(Float64(k))
    end
end

celsius(c) = Temperature(c + 273.15)
to_celsius(t::Temperature) = t.kelvin - 273.15

t = celsius(25)
println(t.kelvin)
println(to_celsius(t))

try
    Temperature(-5)
catch e
    println(e)
end

struct Range1
    lo::Int
    hi::Int
    Range1(lo, hi) = lo <= hi ? new(lo, hi) : new(hi, lo)
end
println(Range1(9, 3))
