% Kadane's algorithm: best sum of a contiguous subarray
a = [-2 1 -3 4 -1 2 1 -5 4];
best = a(1);
cur = a(1);
for i = 2:numel(a)
    cur = max(a(i), cur + a(i));
    best = max(best, cur);
end
disp(best);

% Same idea with a running-minimum prefix-sum formulation
p = [0 cumsum(a)];
disp(max(p(2:end) - cummin(p(1:end-1))));
