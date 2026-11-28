a = [1 2 3 4]; b = [3 4 5];
j = numel(intersect(a, b)) / numel(union(a, b));
fprintf('%.2f\n', j);
