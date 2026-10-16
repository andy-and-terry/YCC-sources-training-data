function partition_labels(s::String)
    last = Dict(c => i for (i, c) in enumerate(s))
    sizes = Int[]
    start = 1
    stop = 1
    for (i, c) in enumerate(s)
        stop = max(stop, last[c])
        if i == stop
            push!(sizes, stop - start + 1)
            start = i + 1
        end
    end
    return sizes
end

println(partition_labels("ababcbacadefegdehijhklij"))
println(partition_labels("eccbbbbdec"))
