% Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
function munchausen_numbers()
  out = [];
  for n = 1:4999
    d = num2str(n) - '0';
    if sum((d > 0) .* (d .^ d)) == n
      out(end+1) = n;
    end
  end
  disp(num2str(out));
end
