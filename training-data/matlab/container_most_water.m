function best = max_area(h)
  lo = 1; hi = numel(h); best = 0;
  while lo < hi
    best = max(best, min(h(lo), h(hi)) * (hi - lo));
    if h(lo) < h(hi)
      lo = lo + 1;
    else
      hi = hi - 1;
    end
  end
end

disp(max_area([1 8 6 2 5 4 8 3 7]))  % 49
