% Deficient numbers below 100; expect 76.
c = 0;
for n = 1:99
  d = 1:n-1;
  if sum(d(mod(n, d) == 0)) < n, c = c + 1; end
end
disp(c)
