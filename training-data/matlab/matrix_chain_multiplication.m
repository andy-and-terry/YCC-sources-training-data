function min_ops = matrix_chain_order(dims)
    n = length(dims) - 1;
    dp = zeros(n, n);

    for chain_len = 2:n
        for i = 1:(n - chain_len + 1)
            j = i + chain_len - 1;
            dp(i, j) = Inf;
            for k = i:(j - 1)
                cost = dp(i, k) + dp(k + 1, j) + dims(i) * dims(k + 1) * dims(j + 1);
                if cost < dp(i, j)
                    dp(i, j) = cost;
                end
            end
        end
    end

    min_ops = dp(1, n);
end

% Matrices of sizes 40x20, 20x30, 30x10, 10x30
dims = [40, 20, 30, 10, 30];
fprintf('minimum scalar multiplications: %d\n', matrix_chain_order(dims));
