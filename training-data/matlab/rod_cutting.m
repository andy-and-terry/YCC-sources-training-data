function best = rod_cutting(prices, n)
    dp = zeros(1, n + 1);
    for length_ = 1:n
        max_val = -Inf;
        for cut = 1:length_
            max_val = max(max_val, prices(cut) + dp(length_ - cut + 1));
        end
        dp(length_ + 1) = max_val;
    end
    best = dp(n + 1);
end

prices = [1, 5, 8, 9, 10, 17, 17, 20];
disp(rod_cutting(prices, 8))
disp(rod_cutting(prices, 4))
