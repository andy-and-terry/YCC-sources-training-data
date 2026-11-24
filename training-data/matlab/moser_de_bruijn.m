% Moser-de Bruijn sequence: binary digits of n read in base 4.
function moser_de_bruijn()
  out = zeros(1, 12);
  for n = 0:11
    bits = dec2bin(n) - '0';
    out(n + 1) = sum(bits .* 4 .^ (numel(bits) - 1:-1:0));
  end
  disp(num2str(out));
end
