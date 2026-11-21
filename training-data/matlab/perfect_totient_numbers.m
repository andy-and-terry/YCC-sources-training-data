% Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
function perfect_totient_numbers()
  out = [];
  for n = 2:199
    total = 0;
    m = n;
    while m > 1
      m = phi(m);
      total = total + m;
    end
    if total == n
      out(end+1) = n;
    end
  end
  disp(num2str(out));
end

function c = phi(n)
  c = sum(gcd(1:n, n) == 1);
end
