function out = insert_interval(iv, nw)
  % iv is an N-by-2 matrix of sorted, disjoint [lo hi] rows
  before = iv(iv(:, 2) < nw(1), :);
  after  = iv(iv(:, 1) > nw(2), :);
  mid    = iv(iv(:, 2) >= nw(1) & iv(:, 1) <= nw(2), :);
  merged = [min([nw(1); mid(:, 1)]), max([nw(2); mid(:, 2)])];
  out = [before; merged; after];
end

disp(insert_interval([1 3; 6 9], [2 5]))  % [1 5; 6 9]
