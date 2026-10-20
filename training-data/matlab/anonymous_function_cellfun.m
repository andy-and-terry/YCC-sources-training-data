f = @(x) x.^2 + 1;
c = {1, [2 3], 4:6};
disp(cellfun(@numel, c))
disp(f(3))
