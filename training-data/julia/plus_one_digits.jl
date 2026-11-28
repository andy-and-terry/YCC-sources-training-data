function plus_one(digits)
    d = copy(digits)
    for i in length(d):-1:1
        if d[i] < 9
            d[i] += 1
            return d
        end
        d[i] = 0
    end
    return pushfirst!(d, 1)
end

println(plus_one([1, 2, 9])) # [1, 3, 0]
println(plus_one([9, 9]))    # [1, 0, 0]
