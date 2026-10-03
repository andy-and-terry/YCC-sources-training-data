function z = z_algorithm(s)
    n = length(s);
    z = zeros(1, n);
    left = 0; right = 0;
    for i = 2:n
        if i <= right
            z(i) = min(right - i + 1, z(i - left + 1));
        end
        while i + z(i) <= n && s(z(i) + 1) == s(i + z(i))
            z(i) = z(i) + 1;
        end
        if i + z(i) - 1 > right
            left = i;
            right = i + z(i) - 1;
        end
    end
end

function positions = z_search(text, pattern)
    combined = [pattern, '$', text];
    z = z_algorithm(combined);
    positions = [];
    patLen = length(pattern);
    for i = 1:length(z)
        if z(i) == patLen
            positions(end + 1) = i - patLen - 1;
        end
    end
end

disp(z_search('ababcabcabababd', 'abab'))
