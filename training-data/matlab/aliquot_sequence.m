% Aliquot sequence: replace n by the sum of its proper divisors.
function aliquot_sequence()
  seq = 12;
  while seq(end) > 1 && numel(seq) < 20
    n = seq(end);
    d = 1:floor(n / 2);
    seq(end + 1) = sum(d(mod(n, d) == 0));
  end
  disp(num2str(seq));
end
