% Euler zigzag numbers via the Seidel-Entringer boustrophedon.
function euler_zigzag_numbers()
  row = 1;
  out = 1;
  for i = 1:9
    row = cumsum([0, fliplr(row)]);
    out(end + 1) = row(end);
  end
  fprintf('%d ', out);
  fprintf('\n');
end
