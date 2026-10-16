c = {'apple', 'fig', 'banana'};
lens = cellfun(@numel, c);
disp(lens);
up = cellfun(@upper, c, 'UniformOutput', false);
disp(up);
[mx, ix] = cellfun(@max, {[1 5 2], [7 3], [4]});
disp([mx; ix]);
bad = cellfun(@(x) x(10), c, 'ErrorHandler', @(e, x) -1);
disp(bad);
