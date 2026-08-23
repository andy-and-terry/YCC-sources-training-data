function is_safe(queens::Vector{Int}, col::Int)
    for (i, q) in enumerate(queens)
        dist = length(queens) - i + 1
        if q == col || abs(q - col) == dist
            return false
        end
    end
    return true
end

function solve(queens::Vector{Int}, n::Int)
    if length(queens) == n
        return 1
    end
    count = 0
    for col in 0:n-1
        if is_safe(queens, col)
            count += solve(vcat(queens, [col]), n)
        end
    end
    return count
end

println(solve(Int[], 6))
