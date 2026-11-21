% Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
function bouncy_numbers()
  count = 0;
  for n = 1:999
    d = num2str(n) - '0';
    if ~issorted(d) && ~issorted(d, 'descend')
      count = count + 1;
    end
  end
  disp(count);
end
