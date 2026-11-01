c = {1, 'two', [3 3 3]};
for i = 1:numel(c)
    disp(class(c{i}))
end
s.name = 'Ann';
s.scores = [90 85];
s.mean = mean(s.scores);
disp(s)
disp(fieldnames(s)')
