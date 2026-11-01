% Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
out = [];
for n = 2:109
    if sum(factor(n)) == sum(factor(n + 1))
        out(end + 1) = n; %#ok<AGROW>
    end
end
disp(num2str(out));
