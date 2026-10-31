function cube_from_odds(n)
    start = n * n - n + 1
    sum(start + 2i for i in 0:n-1)
end

for n in 1:5
    println(n, " ", cube_from_odds(n), " ", cube_from_odds(n) == n^3)
end
