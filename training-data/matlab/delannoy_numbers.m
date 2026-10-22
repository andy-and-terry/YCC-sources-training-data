% Central Delannoy numbers: D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
last = 9;
D = ones(last + 1, last + 1);
for m = 2:last + 1
    for n = 2:last + 1
        D(m, n) = D(m - 1, n) + D(m, n - 1) + D(m - 1, n - 1);
    end
end
disp(strjoin(arrayfun(@num2str, diag(D)', 'UniformOutput', false), ' '))
