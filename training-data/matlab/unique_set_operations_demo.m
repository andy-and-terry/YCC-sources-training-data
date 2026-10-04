function unique_set_operations_demo()
    a = [5 3 1 3 5 7];
    b = [3 4 5 6];

    [u, ia, ic] = unique(a);
    disp(u); disp(ia'); disp(ic');
    disp(unique(a, 'stable'));

    disp(union(a, b));
    disp(intersect(a, b));
    disp(setdiff(a, b));
    disp(setxor(a, b));
    disp(ismember(4, b));
    disp(ismember(a, b));

    words = {'pear', 'apple', 'pear', 'fig'};
    disp(unique(words));
    counts = histc(a, unique(a));
    disp(counts);
end
