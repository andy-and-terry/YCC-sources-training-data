function delannoy_numbers()
    n = 5;
    g = ones(n + 1);
    for i = 2:n + 1
        for j = 2:n + 1
            g(i, j) = g(i - 1, j) + g(i, j - 1) + g(i - 1, j - 1);
        end
    end
    disp(diag(g)'); % 1 3 13 63 321 1683
end
