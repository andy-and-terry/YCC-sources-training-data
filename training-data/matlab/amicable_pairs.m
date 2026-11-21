% Amicable pairs below 1500 via sums of proper divisors.
function amicable_pairs()
  for a = 2:1499
    b = s(a);
    if b > a && s(b) == a
      fprintf('%d %d\n', a, b);
    end
  end
end

function t = s(n)
  d = 1:n-1;
  t = sum(d(mod(n, d) == 0));
end
