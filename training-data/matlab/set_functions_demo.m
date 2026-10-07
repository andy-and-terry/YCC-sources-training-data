a = [1 2 3 4 5];
b = [4 5 6 7];

disp(union(a, b))
disp(intersect(a, b))
disp(setdiff(a, b))
disp(setxor(a, b))
disp(ismember(3, a))
disp(ismember([1 9 5], a))

[tf, loc] = ismember([5 1 8], a);
disp(tf)
disp(loc)

[c, ia, ib] = intersect(a, b);
disp(c)
disp(ia')
disp(ib')

words1 = {'apple', 'pear', 'fig'};
words2 = {'fig', 'kiwi'};
disp(union(words1, words2))
disp(intersect(words1, words2))
disp(setdiff(words1, words2))
disp(ismember('pear', words1))

disp(unique([3 1 1 2 3]))
disp(numel(unique({'a', 'b', 'a'})))
disp(isempty(intersect([1 2], [3 4])))
disp(union([3 1], [2 1], 'stable'))
