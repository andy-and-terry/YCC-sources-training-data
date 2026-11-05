people = struct('name', {'Ann', 'Bob'}, 'age', {30, 25});
names = arrayfun(@(p) p.name, people, 'UniformOutput', false);
disp(names);
lens = cellfun(@numel, names);
disp(lens);
disp(mean([people.age]));
