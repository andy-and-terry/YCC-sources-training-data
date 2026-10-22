% Hofstadter Q sequence: Q(1) = Q(2) = 1, Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2))
count = 20;
q = zeros(1, count);
q(1) = 1;
q(2) = 1;
for n = 3:count
    q(n) = q(n - q(n - 1)) + q(n - q(n - 2));
end
disp(q)
