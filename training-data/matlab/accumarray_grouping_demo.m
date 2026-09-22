groups = [1; 1; 2; 3; 3; 3];
values = [10; 20; 5; 1; 2; 3];

totals = accumarray(groups, values);
disp(totals)

counts = accumarray(groups, 1);
disp(counts)

averages = totals ./ counts;
disp(averages)
