function max_product(nums::AbstractVector{<:Integer})
    best = hi = lo = first(nums)
    for x in @view nums[2:end]
        x < 0 && ((hi, lo) = (lo, hi))
        hi = max(x, hi * x)
        lo = min(x, lo * x)
        best = max(best, hi)
    end
    return best
end

println(max_product.([[2, 3, -2, 4], [-2, 0, -1], [-2, 3, -4]]))
