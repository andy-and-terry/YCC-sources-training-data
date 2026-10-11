valid = {'red', 'green', 'blue'};
queries = {'green', 'pink', 'red'};
[tf, loc] = ismember(queries, valid);
disp(tf);
disp(loc);
[tf2, loc2] = ismember([5 1 9], [1 5 7]);
disp(tf2);
disp(loc2);
