function insert_interval(iv, new)
    out = Tuple{Int,Int}[]
    i = 1
    while i <= length(iv) && iv[i][2] < new[1]
        push!(out, iv[i]); i += 1
    end
    while i <= length(iv) && iv[i][1] <= new[2]
        new = (min(new[1], iv[i][1]), max(new[2], iv[i][2]))
        i += 1
    end
    push!(out, new)
    append!(out, iv[i:end])
end

println(insert_interval([(1, 3), (6, 9)], (2, 5))) # [(1, 5), (6, 9)]
