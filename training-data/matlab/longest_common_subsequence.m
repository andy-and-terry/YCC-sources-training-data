function len = longest_common_subsequence(a, b)
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
    len = dp(m + 1, n + 1);
end

disp(longest_common_subsequence('abcde', 'ace'))
disp(longest_common_subsequence('abc', 'xyz'))
