sq = @(x) x .^ 2;
disp(sq(1:4))
c = {1:3, 1:5, 1:2};
disp(cellfun(@numel, c))
disp(cellfun(@(v) sum(v), c))
