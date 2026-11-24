% Hexagonal numbers: n(2n-1).
function hexagonal_numbers()
  n = 1:10;
  disp(num2str(n .* (2 * n - 1)));
end
