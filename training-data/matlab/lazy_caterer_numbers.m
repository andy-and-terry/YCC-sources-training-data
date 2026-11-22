% Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
function lazy_caterer_numbers()
  n = 0:9;
  fprintf('%d ', n .* (n + 1) / 2 + 1);
  fprintf('\n');
end
