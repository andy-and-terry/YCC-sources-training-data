function result = coin_change(coins, amount)
    dp = -ones(1, amount + 1);
    dp(1) = 0;
    for n = 1:amount
        for c = coins
            if c <= n && dp(n - c + 1) ~= -1
                if dp(n + 1) == -1 || dp(n - c + 1) + 1 < dp(n + 1)
                    dp(n + 1) = dp(n - c + 1) + 1;
                end
            end
        end
    end
    result = dp(amount + 1);
end
