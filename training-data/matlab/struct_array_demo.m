people(1).name = 'Ada';
people(1).age = 34;
people(2).name = 'Bob';
people(2).age = 29;
people(3).name = 'Cleo';
people(3).age = 41;

ages = [people.age];
disp(ages)
disp(mean(ages))

for i = 1:numel(people)
    fprintf('%s is %d\n', people(i).name, people(i).age);
end
