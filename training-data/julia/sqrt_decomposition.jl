struct SqrtSum
    a::Vector{Int}
    bs::Int
    blk::Vector{Int}
end

SqrtSum(a, bs) = SqrtSum(a, bs, [sum(a[i:min(i + bs - 1, end)]) for i in 1:bs:length(a)])

function query(t::SqrtSum, l, r)  # 1-based inclusive
    s, i = 0, l
    while i <= r
        if (i - 1) % t.bs == 0 && i + t.bs - 1 <= r
            s += t.blk[(i - 1) ÷ t.bs + 1]
            i += t.bs
        else
            s += t.a[i]
            i += 1
        end
    end
    return s
end

println(query(SqrtSum([5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4), 3, 10))
