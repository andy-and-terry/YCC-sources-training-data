cross(o, a, b) = (a[1] - o[1]) * (b[2] - o[2]) - (a[2] - o[2]) * (b[1] - o[1])

function half_hull(pts)
    h = eltype(pts)[]
    for q in pts
        while length(h) >= 2 && cross(h[end-1], h[end], q) <= 0
            pop!(h)
        end
        push!(h, q)
    end
    pop!(h)
    return h
end

# Andrew's monotone chain, counter-clockwise result
function convex_hull(points)
    p = sort(points)
    return vcat(half_hull(p), half_hull(reverse(p)))
end

println(convex_hull([(0, 0), (2, 0), (1, 1), (2, 2), (0, 2), (1, 3)]))
