function n = four_sum_count(a, b, c, d)
  ab = reshape(a(:) + b(:)', [], 1);
  cd = reshape(c(:) + d(:)', [], 1);
  n = 0;
  for s = ab'
    n = n + sum(cd == -s);
  end
end

disp(four_sum_count([1 2], [-2 -1], [-1 2], [0 2]))  % 2
