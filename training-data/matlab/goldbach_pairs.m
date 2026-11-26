% Goldbach partitions of 100; expect 6.
c = 0;
for p = 2:50
  if is_prime_n(p) && is_prime_n(100 - p), c = c + 1; end
end
disp(c)

function r = is_prime_n(n)
  r = false;
  if n < 2, return; end
  r = true;
  for d = 2:floor(sqrt(n))
    if mod(n, d) == 0, r = false; return; end
  end
end
