function cuban_primes()
  out = [];
  y = 1;
  while numel(out) < 8
    p = 3 * y^2 + 3 * y + 1;
    if isprime(p)
      out(end + 1) = p; %#ok<AGROW>
    end
    y = y + 1;
  end
  disp(out);
end
