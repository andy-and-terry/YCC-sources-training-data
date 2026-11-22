% Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
function lah_numbers()
  n = 5;
  for k = 1:n
    fprintf('%d ', nchoosek(n - 1, k - 1) * factorial(n) / factorial(k));
  end
  fprintf('\n');
end
