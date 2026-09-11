function result = longest_common_subsequence(a, b)
    m = length(a);
    n = length(b);
    dp = zeros(m + 1, n + 1);
    for i = 1:m
        for j = 1:n
            if a(i) == b(j)
                dp(i + 1, j + 1) = dp(i, j) + 1;
            else
                dp(i + 1, j + 1) = max(dp(i, j + 1), dp(i + 1, j));
            end
        end
    end

    result = '';
    i = m;
    j = n;
    while i > 0 && j > 0
        if a(i) == b(j)
            result = [a(i), result];
            i = i - 1;
            j = j - 1;
        elseif dp(i, j + 1) >= dp(i + 1, j)
            i = i - 1;
        else
            j = j - 1;
        end
    end
end
