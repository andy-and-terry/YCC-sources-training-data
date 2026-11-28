function lis_length(a)
    tails = Int[]
    for x in a
        i = searchsortedfirst(tails, x)
        i > length(tails) ? push!(tails, x) : (tails[i] = x)
    end
    return length(tails)
end

println(lis_length([10, 9, 2, 5, 3, 7, 101, 18]))
