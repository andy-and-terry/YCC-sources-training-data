@enum TriangleKind equilateral isosceles scalene invalid

function classify(a, b, c)
    x, y, z = sort([a, b, c])
    (x <= 0 || x + y <= z) && return invalid
    n = length(unique([a, b, c]))
    return n == 1 ? equilateral : n == 2 ? isosceles : scalene
end

for t in ((3, 3, 3), (3, 4, 4), (3, 4, 5), (1, 1, 3))
    println(t, " ", classify(t...))
end
