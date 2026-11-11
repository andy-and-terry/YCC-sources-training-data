function d = plus_one(d)
  for i = numel(d):-1:1
    if d(i) < 9
      d(i) = d(i) + 1;
      return
    end
    d(i) = 0;
  end
  d = [1 d];
end

disp(plus_one([1 2 9]))  % 1 3 0
disp(plus_one([9 9]))    % 1 0 0
