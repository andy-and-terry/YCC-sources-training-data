% Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
function carmichael_numbers()
  out = [];
  for n = 3:2:2999
    if is_carmichael(n)
      out(end+1) = n;
    end
  end
  disp(num2str(out));
end

function r = pow_mod(b, e, m)
  r = 1;
  b = mod(b, m);
  while e > 0
    if mod(e, 2) == 1
      r = mod(r * b, m);
    end
    b = mod(b * b, m);
    e = floor(e / 2);
  end
end

function r = is_carmichael(n)
  r = false;
  if isprime(n)
    return;
  end
  for a = 2:n-1
    if gcd(a, n) == 1 && pow_mod(a, n - 1, n) ~= 1
      return;
    end
  end
  r = true;
end
