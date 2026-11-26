% Sexy primes below 100; expect 16 pairs.
c = 0;
for p = 2:99
  if is_prime_n(p) && is_prime_n(p + 6), c = c + 1; end
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
