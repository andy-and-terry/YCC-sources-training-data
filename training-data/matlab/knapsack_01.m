function result = knapsack_01(weights, values, capacity)
    dp = zeros(1, capacity + 1);
    for i = 1:numel(weights)
        for cap = capacity:-1:weights(i)
            dp(cap + 1) = max(dp(cap + 1), dp(cap - weights(i) + 1) + values(i));
        end
    end
    result = dp(capacity + 1);
end
