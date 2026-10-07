function merge_intervals(intervals::Vector{Tuple{Int,Int}})
    sorted = sort(intervals; by = first)
    out = Tuple{Int,Int}[]
    for (s, e) in sorted
        if !isempty(out) && s <= out[end][2]
            out[end] = (out[end][1], max(out[end][2], e))
        else
            push!(out, (s, e))
        end
    end
    return out
end

println(merge_intervals([(1, 3), (8, 10), (2, 6), (15, 18)]))
