% Pentagonal numbers: n(3n-1)/2.
function pentagonal_numbers()
  n = 1:10;
  disp(num2str(n .* (3 * n - 1) / 2));
end
