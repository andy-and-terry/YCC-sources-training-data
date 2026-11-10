function refactorable_numbers()
    out = [];
    for n = 1:59
        tau = sum(mod(n, 1:n) == 0);
        if mod(n, tau) == 0
            out(end + 1) = n; %#ok<AGROW>
        end
    end
    disp(out); % 1 2 8 9 12 18 24 36 40 56
end
