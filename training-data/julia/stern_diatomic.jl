function stern(count::Int)
    seq = zeros(Int, max(count, 2))
    seq[2] = 1  # seq[i+1] holds s(i)
    for i in 2:count-1
        h = i ÷ 2
        seq[i+1] = iseven(i) ? seq[h+1] : seq[h+1] + seq[h+2]
    end
    return seq[1:count]
end

println(stern(15)) # [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
