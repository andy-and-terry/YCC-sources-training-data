% Emirps below 200; expect 15.
c = 0;
for n = 2:199
  r = str2double(fliplr(num2str(n)));
  if r ~= n && is_prime_n(n) && is_prime_n(r), c = c + 1; end
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
