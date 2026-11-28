function area(pts)
    n = length(pts)
    s = sum(pts[i][1] * pts[mod1(i + 1, n)][2] - pts[mod1(i + 1, n)][1] * pts[i][2] for i in 1:n)
    return abs(s) / 2
end

println(area([(0, 0), (4, 0), (4, 3), (0, 3)]))
