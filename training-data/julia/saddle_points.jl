function saddle_points(m::AbstractMatrix)
    row_max = maximum(m, dims = 2)
    col_min = minimum(m, dims = 1)
    return [(r, c) for r in axes(m, 1), c in axes(m, 2) if m[r, c] == row_max[r] == col_min[c]]
end

println(saddle_points([9 8 7; 5 3 2; 6 6 7]))
