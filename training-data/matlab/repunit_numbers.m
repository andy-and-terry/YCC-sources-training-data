% Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
function repunit_numbers()
  r = 0;
  for i = 1:8
    r = r * 10 + 1;
    fprintf('%d ', r);
  end
  fprintf('\n');
end
