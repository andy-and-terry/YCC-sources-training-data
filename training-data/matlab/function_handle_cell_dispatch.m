ops = {@plus, @minus, @times, @(a, b) a ^ b};
names = {'add', 'sub', 'mul', 'pow'};
for i = 1:numel(ops)
    fprintf('%s: %d\n', names{i}, ops{i}(2, 5));
end
disp(func2str(ops{4}));
f = str2func('@(x) x + 1');
disp(f(9));
