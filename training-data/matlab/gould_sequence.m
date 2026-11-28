function gould_sequence()
  n = 0:15;
  g = arrayfun(@(v) 2^sum(dec2bin(v) == '1'), n);
  disp(g);
end
