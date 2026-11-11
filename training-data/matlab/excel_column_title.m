function t = column_title(n)
  t = '';
  while n > 0
    n = n - 1;
    t = [char('A' + mod(n, 26)), t];
    n = floor(n / 26);
  end
end

fprintf('%s %s\n', column_title(28), column_title(701))  % AB ZY
