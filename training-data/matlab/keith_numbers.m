% Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
function keith_numbers()
  out = [];
  for n = 10:1199
    if is_keith(n)
      out(end+1) = n;
    end
  end
  disp(num2str(out));
end

function r = is_keith(n)
  seq = num2str(n) - '0';
  k = numel(seq);
  while seq(end) < n
    seq(end+1) = sum(seq(end-k+1:end));
  end
  r = seq(end) == n;
end
