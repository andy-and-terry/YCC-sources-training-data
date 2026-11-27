function fletcher16_checksum()
  data = double('abcde');
  s1 = 0; s2 = 0;
  for b = data
    s1 = mod(s1 + b, 255);
    s2 = mod(s2 + s1, 255);
  end
  fprintf('%x\n', bitor(bitshift(s2, 8), s1));
end
