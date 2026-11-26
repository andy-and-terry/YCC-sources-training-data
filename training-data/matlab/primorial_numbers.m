% Primorials up to 1e6, including 1; expect 8.
values = 1;
acc = 1;
p = 2;
while true
  if is_prime_n(p)
    acc = acc * p;
    if acc > 1e6, break; end
    values(end + 1) = acc;
  end
  p = p + 1;
end
fprintf('%d: %s\n', numel(values), mat2str(values));

function r = is_prime_n(n)
  r = false;
  if n < 2, return; end
  r = true;
  for d = 2:floor(sqrt(n))
    if mod(n, d) == 0, r = false; return; end
  end
end
