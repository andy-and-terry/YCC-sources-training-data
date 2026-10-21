% P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
p = zeros(1, 15);
p(2) = 1;
for k = 3:15
    p(k) = 2 * p(k-1) + p(k-2);
end
for k = 1:15
    fprintf('P(%d) = %d\n', k - 1, p(k));
end
