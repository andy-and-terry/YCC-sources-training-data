function search_rotated(a::Vector{Int}, target::Int)
    lo, hi = 1, length(a)
    while lo <= hi
        mid = (lo + hi) ÷ 2
        a[mid] == target && return mid
        if a[lo] <= a[mid]
            if a[lo] <= target < a[mid]
                hi = mid - 1
            else
                lo = mid + 1
            end
        else
            if a[mid] < target <= a[hi]
                lo = mid + 1
            else
                hi = mid - 1
            end
        end
    end
    return 0
end

a = [4, 5, 6, 7, 0, 1, 2]
println(search_rotated(a, 0))
println(search_rotated(a, 6))
println(search_rotated(a, 3))
