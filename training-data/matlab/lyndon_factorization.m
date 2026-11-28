s = 'banana';
n = numel(s);
i = 1;
while i <= n
    j = i + 1; k = i;
    while j <= n && s(k) <= s(j)
        if s(k) < s(j), k = i; else, k = k + 1; end
        j = j + 1;
    end
    while i <= k
        disp(s(i:i + j - k - 1));
        i = i + j - k;
    end
end
