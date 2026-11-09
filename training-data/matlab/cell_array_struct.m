people = {'Ann', 31; 'Bob', 25};
for i = 1:size(people, 1)
    fprintf('%s is %d\n', people{i, 1}, people{i, 2});
end
s.name = 'Cy';
s.tags = {'a', 'b'};
disp(s)
