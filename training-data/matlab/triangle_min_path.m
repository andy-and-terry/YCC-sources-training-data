function best = minimum_total(tri)
  dp = tri{end};
  for r = numel(tri) - 1:-1:1
    dp = tri{r} + min(dp(1:end-1), dp(2:end));
  end
  best = dp(1);
end

disp(minimum_total({2, [3 4], [6 5 7], [4 1 8 3]}))  % 11
