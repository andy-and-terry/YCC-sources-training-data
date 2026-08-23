function lps = build_lps(pattern)
    n = length(pattern);
    lps = zeros(1, n);
    len = 0;
    i = 2;
    while i <= n
        if pattern(i) == pattern(len + 1)
            len = len + 1;
            lps(i) = len;
            i = i + 1;
        elseif len ~= 0
            len = lps(len);
        else
            lps(i) = 0;
            i = i + 1;
        end
    end
end

function idx = kmp_search(text, pattern)
    lps = build_lps(pattern);
    n = length(text);
    m = length(pattern);
    i = 1; j = 1;
    idx = -1;
    while i <= n
        if text(i) == pattern(j)
            i = i + 1;
            j = j + 1;
            if j > m
                idx = i - j;
                return;
            end
        elseif j > 1
            j = lps(j - 1);
        else
            i = i + 1;
        end
    end
end
