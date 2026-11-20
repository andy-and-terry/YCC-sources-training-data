% Lattice paths via DP row and the binomial coefficient.
n = 3;
row = ones(1, n + 1);
for k = 1:n
    row = cumsum(row);
end
disp(row(end))
disp(nchoosek(2*n, n))
