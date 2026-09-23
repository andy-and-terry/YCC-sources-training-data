function matrix_chain_order(dims::Vector{Int})
    n = length(dims) - 1  # number of matrices
    dp = zeros(Int, n, n)

    for len in 2:n
        for i in 1:(n - len + 1)
            j = i + len - 1
            dp[i, j] = typemax(Int)
            for k in i:(j - 1)
                cost = dp[i, k] + dp[k + 1, j] + dims[i] * dims[k + 1] * dims[j + 1]
                if cost < dp[i, j]
                    dp[i, j] = cost
                end
            end
        end
    end

    return dp[1, n]
end

println(matrix_chain_order([40, 20, 30, 10, 30]))
