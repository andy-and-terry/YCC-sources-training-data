people(1).name = 'Ann'; people(1).age = 30;
people(2).name = 'Bob'; people(2).age = 25;
disp(mean([people.age]));
fn = fieldnames(people);
for i = 1:numel(fn)
    fprintf('%s\n', fn{i});
end
