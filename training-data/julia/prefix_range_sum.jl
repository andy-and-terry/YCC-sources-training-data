struct RangeSum
    prefix::Vector{Int}
end

RangeSum(values::Vector{Int}) = RangeSum([0; cumsum(values)])

query(r::RangeSum, lo::Int, hi::Int) = r.prefix[hi + 1] - r.prefix[lo + 1]

println(query(RangeSum([3, 1, 4, 1, 5, 9, 2, 6]), 2, 5))
