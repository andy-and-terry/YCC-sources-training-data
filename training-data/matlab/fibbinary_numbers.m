% Fibbinary numbers: no two adjacent 1 bits.
function fibbinary_numbers()
  n = 0:49;
  disp(num2str(n(bitand(n, bitshift(n, -1)) == 0)));
end
