% Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
function repunit_numbers()
  r = 0;
  for n = 1:8
    r = r * 10 + 1;
    if mod(r, 3) == 0
      fprintf('%d  (divisible by 3)\n', r);
    else
      fprintf('%d\n', r);
    end
  end
end
