names = {'Ada', 'Bob', 'Cleo'};
scores = [88, 72, 95];

for i = 1:length(names)
    fprintf('%s: %d\n', names{i}, scores(i));
end

fprintf('Average: %.2f\n', mean(scores));
