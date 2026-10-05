function spiral(m::Matrix{Int})
    out = Int[]
    top, bottom, left, right = 1, size(m, 1), 1, size(m, 2)
    while top <= bottom && left <= right
        for j in left:right
            push!(out, m[top, j])
        end
        top += 1
        for i in top:bottom
            push!(out, m[i, right])
        end
        right -= 1
        if top <= bottom
            for j in right:-1:left
                push!(out, m[bottom, j])
            end
            bottom -= 1
        end
        if left <= right
            for i in bottom:-1:top
                push!(out, m[i, left])
            end
            left += 1
        end
    end
    return out
end

println(spiral([1 2 3; 4 5 6; 7 8 9]))
