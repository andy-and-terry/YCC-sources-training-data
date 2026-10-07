scores = struct('alice', 90, 'bob', 82, 'carol', 95);

doubled = structfun(@(x) x * 2, scores, 'UniformOutput', false);
disp(doubled)

average = structfun(@(x) x, scores);
disp(mean(average))

names = fieldnames(scores);
for i = 1:numel(names)
    fprintf('%s: %d\n', names{i}, scores.(names{i}));
end
