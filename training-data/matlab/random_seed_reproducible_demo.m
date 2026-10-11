rng(42);
a = rand(1, 3);
rng(42);
b = rand(1, 3);
disp(isequal(a, b));
r = randi([1 6], 1, 10);
disp(all(r >= 1 & r <= 6));
p = randperm(5);
disp(sort(p));
