function s = second_largest(v)
  u = unique(v);           % sorted ascending, duplicates removed
  if numel(u) < 2
    s = NaN;
  else
    s = u(end-1);
  end
end

disp(second_largest([4 9 2 9 7]));
disp(second_largest([3 3]));
