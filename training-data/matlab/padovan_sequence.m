% Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
n = 15;
p = ones(1, n);
for i = 4:n          % 1-based indexing
    p(i) = p(i-2) + p(i-3);
end
disp(p)
