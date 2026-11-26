% Circular primes below 100; expect 13.
c = 0;
for n = 2:99
  s = num2str(n);
  ok = true;
  for i = 0:length(s)-1
    if ~is_prime_n(str2double([s(i+1:end) s(1:i)])), ok = false; end
  end
  c = c + ok;
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
