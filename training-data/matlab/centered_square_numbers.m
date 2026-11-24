% Centered square numbers: n^2 + (n+1)^2.
function centered_square_numbers()
  n = 0:9;
  disp(num2str(n .^ 2 + (n + 1) .^ 2));
end
