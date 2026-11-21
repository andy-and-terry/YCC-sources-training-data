% Disarium numbers: digits raised to their 1-based positions sum to n.
function disarium_numbers()
  out = [];
  for n = 1:999
    d = num2str(n) - '0';
    if sum(d .^ (1:numel(d))) == n
      out(end+1) = n;
    end
  end
  disp(num2str(out));
end
