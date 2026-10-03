function result = longest_palindromic_substring(s)
    n = length(s);
    if n == 0
        result = '';
        return
    end
    start = 1; maxLen = 1;
    for center = 1:n
        [lo, hi] = expand(s, center, center, n);
        if hi - lo + 1 > maxLen
            start = lo; maxLen = hi - lo + 1;
        end
        [lo, hi] = expand(s, center, center + 1, n);
        if hi - lo + 1 > maxLen
            start = lo; maxLen = hi - lo + 1;
        end
    end
    result = s(start:start + maxLen - 1);
end

function [lo, hi] = expand(s, left, right, n)
    while left >= 1 && right <= n && s(left) == s(right)
        left = left - 1;
        right = right + 1;
    end
    lo = left + 1;
    hi = right - 1;
end

disp(longest_palindromic_substring('babad'))
disp(longest_palindromic_substring('cbbd'))
