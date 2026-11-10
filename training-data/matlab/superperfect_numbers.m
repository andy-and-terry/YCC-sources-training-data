function superperfect_numbers()
    out = [];
    for n = 1:99
        if sigma(sigma(n)) == 2 * n
            out(end + 1) = n; %#ok<AGROW>
        end
    end
    disp(out); % 2 4 16 64
end

function s = sigma(n)
    d = 1:n;
    s = sum(d(mod(n, d) == 0));
end
