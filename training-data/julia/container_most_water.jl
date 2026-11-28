function max_area(h)
    lo, hi, best = 1, length(h), 0
    while lo < hi
        best = max(best, min(h[lo], h[hi]) * (hi - lo))
        h[lo] < h[hi] ? (lo += 1) : (hi -= 1)
    end
    return best
end

println(max_area([1, 8, 6, 2, 5, 4, 8, 3, 7])) # 49
