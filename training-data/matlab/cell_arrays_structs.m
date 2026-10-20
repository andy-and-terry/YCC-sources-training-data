c = {1, 'two', [3 4 5], {6, 'seven'}};
disp(class(c{2})); disp(c{3}(2)); disp(c{4}{2}); disp(numel(c))
c{end + 1} = 'new';
disp(size(c))
s = struct('name', 'Ada', 'age', 36);
s.email = 'ada@x.org';
disp(fieldnames(s)')
disp(isfield(s, 'age'))
s = rmfield(s, 'email');
people = struct('name', {'a', 'b', 'c'}, 'age', {30, 20, 25});
disp([people.age])
[~, i] = sort([people.age]);
disp({people(i).name})
names = arrayfun(@(p) upper(p.name), people, 'UniformOutput', false);
disp(names)
t = cellfun(@numel, {'ab', 'cde', ''});
disp(t)
disp(cellfun(@(x) x * 2, {1, 2}, 'UniformOutput', false))
m = containers.Map({'a', 'b'}, [1 2]);
m('c') = 3;
disp(m.keys()); disp(m.isKey('a')); disp(m('b')); disp(m.Count)
