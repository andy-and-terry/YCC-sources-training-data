people(1).name = 'Ann'; people(1).age = 30;
people(2).name = 'Bob'; people(2).age = 25;
for p = people
    fprintf('%s is %d\n', p.name, p.age);
end
