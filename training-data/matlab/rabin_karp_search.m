function positions = rabin_karp_search(text, pattern)
    n = length(text);
    m = length(pattern);
    base = 256;
    prime = 101;
    positions = [];
    if m > n
        return
    end

    patHash = 0; textHash = 0; h = 1;
    for i = 1:m - 1
        h = mod(h * base, prime);
    end
    for i = 1:m
        patHash = mod(patHash * base + double(pattern(i)), prime);
        textHash = mod(textHash * base + double(text(i)), prime);
    end

    for i = 1:(n - m + 1)
        if patHash == textHash && strcmp(text(i:i + m - 1), pattern)
            positions(end + 1) = i;
        end
        if i < n - m + 1
            textHash = mod((textHash - double(text(i)) * h) * base + double(text(i + m)), prime);
            textHash = mod(textHash + prime, prime);
        end
    end
end

disp(rabin_karp_search('abxabcabcaby', 'abc'))
