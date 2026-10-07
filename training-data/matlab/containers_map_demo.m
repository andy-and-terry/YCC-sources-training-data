ages = containers.Map();
ages('alice') = 30;
ages('bob') = 25;
ages('carol') = 41;

disp(ages.Count);
disp(ages('bob'));
disp(isKey(ages, 'dave'));

if isKey(ages, 'alice')
    ages('alice') = ages('alice') + 1;
end

names = keys(ages);
vals = values(ages);
for i = 1:numel(names)
    fprintf('%s -> %d\n', names{i}, vals{i});
end

remove(ages, 'bob');
disp(ages.keys());

% Numeric keys and explicit types
squares = containers.Map('KeyType', 'double', 'ValueType', 'double');
for n = 1:5
    squares(n) = n^2;
end
disp(cell2mat(values(squares)));

% Word counting
words = {'the', 'cat', 'the', 'hat', 'the', 'cat'};
counts = containers.Map('KeyType', 'char', 'ValueType', 'double');
for i = 1:numel(words)
    w = words{i};
    if isKey(counts, w)
        counts(w) = counts(w) + 1;
    else
        counts(w) = 1;
    end
end
disp(counts('the'));
