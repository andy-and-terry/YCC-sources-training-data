function histogram(s::AbstractString; width::Int = 30)
    counts = Dict{Char,Int}()
    for c in s
        counts[c] = get(counts, c, 0) + 1
    end
    peak = maximum(values(counts))
    for k in sort(collect(keys(counts)))
        n = counts[k]
        println(k, " | ", "#"^max(1, n * width ÷ peak), " ", n)
    end
end

histogram("theraininspainfallsmainlyontheplain")
