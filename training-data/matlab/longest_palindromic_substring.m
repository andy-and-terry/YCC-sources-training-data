function result = longest_palindromic_substring(s)
    if isempty(s)
        result = '';
        return;
    end

    best_start = 1;
    best_end = 1;
    n = length(s);

    for i = 1:n
        [l1, r1] = expand_around_center(s, i, i);
        if (r1 - l1) > (best_end - best_start)
            best_start = l1;
            best_end = r1;
        end

        [l2, r2] = expand_around_center(s, i, i + 1);
        if (r2 - l2) > (best_end - best_start)
            best_start = l2;
            best_end = r2;
        end
    end

    result = s(best_start:best_end);
end

function [left, right] = expand_around_center(s, left, right)
    n = length(s);
    while left >= 1 && right <= n && s(left) == s(right)
        left = left - 1;
        right = right + 1;
    end
    left = left + 1;
    right = right - 1;
end

disp(longest_palindromic_substring('babad'))
disp(longest_palindromic_substring('cbbd'))
