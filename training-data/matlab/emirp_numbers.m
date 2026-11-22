% Emirps: primes whose digit reversal is a different prime.
function emirp_numbers()
  for n = 2:199
    r = str2double(fliplr(num2str(n)));
    if r ~= n && isprime(n) && isprime(r)
      fprintf('%d ', n);
    end
  end
  fprintf('\n');
end
