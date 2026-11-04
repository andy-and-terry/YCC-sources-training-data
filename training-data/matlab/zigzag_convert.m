function out = zigzag_convert(s, rows)
% ZIGZAG_CONVERT  Read string s in a zigzag over ROWS rows, row by row.
  if rows == 1 || rows >= numel(s)
    out = s; return;
  end
  cycle = [1:rows, rows-1:-1:2];
  rowOf = cycle(mod(0:numel(s)-1, numel(cycle)) + 1);
  [~, idx] = sort(rowOf);   % sort is stable in MATLAB
  out = s(idx);
end

disp(zigzag_convert('PAYPALISHIRING', 3));
