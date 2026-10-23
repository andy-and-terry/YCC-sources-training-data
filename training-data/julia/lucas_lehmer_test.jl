function lucas_lehmer(p)
    p == 2 && return true
    m = 2^p - 1
    s = 4
    for _ in 1:(p - 2)
        s = mod(s * s - 2, m)
    end
    return s == 0
end

println(join(filter(lucas_lehmer, [2, 3, 5, 7, 11, 13, 17, 19]), " "))
