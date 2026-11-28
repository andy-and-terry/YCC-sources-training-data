function order(n, k)
    cycle = 2 * (k - 1)
    rail(i) = (r = i % cycle; r < k ? r : cycle - r)
    return sortperm([rail(i) for i in 0:n-1])  # sortperm is stable
end

encrypt(t, k) = String(collect(t)[order(length(t), k)])

function decrypt(c, k)
    out = Vector{Char}(undef, length(c))
    chars = collect(c)
    for (pos, i) in enumerate(order(length(c), k))
        out[i] = chars[pos]
    end
    return String(out)
end

c = encrypt("WEAREDISCOVERED", 3)
println(c, " ", decrypt(c, 3))
