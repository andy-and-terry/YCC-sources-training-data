names = {'alice', 'bob', 'carol'};

lengths = cellfun(@length, names);
disp(lengths)

upper_names = cellfun(@upper, names, 'UniformOutput', false);
disp(upper_names)

starts_with_a = cellfun(@(s) s(1) == 'a', names);
disp(starts_with_a)
