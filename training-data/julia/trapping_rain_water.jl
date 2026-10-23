function trap(h::Vector{Int})
    l, r = 1, length(h)
    lmax = rmax = total = 0
    while l < r
        if h[l] < h[r]
            lmax = max(lmax, h[l])
            total += lmax - h[l]
            l += 1
        else
            rmax = max(rmax, h[r])
            total += rmax - h[r]
            r -= 1
        end
    end
    return total
end

println(trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
println(trap([4, 2, 0, 3, 2, 5]))
println(trap([1, 2, 3]))
