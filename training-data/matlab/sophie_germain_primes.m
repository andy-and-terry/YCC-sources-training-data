% Sophie Germain primes: p prime and 2p + 1 prime.
function sophie_germain_primes()
  p = 2:99;
  fprintf('%d ', p(isprime(p) & isprime(2 * p + 1)));
  fprintf('\n');
end
