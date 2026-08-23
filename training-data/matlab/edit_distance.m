function dist = edit_distance(a, b)
    m = length(a);
    n = length(b);
    dp = zeros(m + 1, n + 1);
    for i = 0:m
        dp(i + 1, 1) = i;
    end
    for j = 0:n
        dp(1, j + 1) = j;
    end
    for i = 1:m
        for j = 1:n
            if a(i) == b(j)
                cost = 0;
            else
                cost = 1;
            end
            dp(i + 1, j + 1) = min([dp(i, j + 1) + 1, dp(i + 1, j) + 1, dp(i, j) + cost]);
        end
    end
    dist = dp(m + 1, n + 1);
end
