% Squarefree numbers up to 100; expect 61.
c = 0;
for n = 1:100
  ok = true;
  for d = 2:floor(sqrt(n))
    if mod(n, d * d) == 0, ok = false; end
  end
  c = c + ok;
end
disp(c)
