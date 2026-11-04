function s = ordinal(n)
  r100 = mod(n, 100); r10 = mod(n, 10);
  if r100 >= 11 && r100 <= 13
    suffix = 'th';
  elseif r10 == 1, suffix = 'st';
  elseif r10 == 2, suffix = 'nd';
  elseif r10 == 3, suffix = 'rd';
  else, suffix = 'th';
  end
  s = sprintf('%d%s', n, suffix);
end

disp(strjoin(arrayfun(@ordinal, [1 2 3 4 11 12 13 21 101 111], 'UniformOutput', false), ' '));
