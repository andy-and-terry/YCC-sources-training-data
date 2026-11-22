% Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
function twin_primes()
  p = 2:99;
  fprintf('%d ', p(isprime(p) & isprime(p + 2)));
  fprintf('\n');
end
