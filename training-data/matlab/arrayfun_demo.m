values = [1, 2, 3, 4, 5];

squares = arrayfun(@(x) x^2, values);
disp(squares)

is_even = arrayfun(@(x) mod(x, 2) == 0, values);
disp(is_even)

names = {'Ada', 'Bob', 'Cleo'};
lengths = cellfun(@length, names);
initials = arrayfun(@(i) [names{i}(1)], 1:length(names), 'UniformOutput', false);
disp(lengths)
disp(initials)
