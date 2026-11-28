function emirp_primes()
  out = [];
  for p = primes(99)
    r = str2double(fliplr(num2str(p)));
    if r ~= p && isprime(r)
      out(end + 1) = p; %#ok<AGROW>
    end
  end
  disp(out);
end
