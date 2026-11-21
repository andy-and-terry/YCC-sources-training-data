% Cantor pairing function and its inverse.
function cantor_pairing()
  disp(pair(3, 4));
  [x, y] = unpair(32);
  fprintf('%d %d\n', x, y);
end

function z = pair(x, y)
  z = (x + y) * (x + y + 1) / 2 + y;
end

function [x, y] = unpair(z)
  w = floor((floor(sqrt(8 * z + 1)) - 1) / 2);
  y = z - w * (w + 1) / 2;
  x = w - y;
end
