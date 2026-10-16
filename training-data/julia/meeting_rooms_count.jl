function min_rooms(intervals::Vector{Tuple{Int,Int}})
    starts = sort([i[1] for i in intervals])
    ends = sort([i[2] for i in intervals])
    rooms = 0
    best = 0
    e = 1
    for s in starts
        if s < ends[e]
            rooms += 1
        else
            e += 1
        end
        best = max(best, rooms)
    end
    return best
end

println(min_rooms([(0, 30), (5, 10), (15, 20)]))
println(min_rooms([(7, 10), (2, 4)]))
println(min_rooms([(1, 5), (2, 6), (3, 7), (8, 9)]))
