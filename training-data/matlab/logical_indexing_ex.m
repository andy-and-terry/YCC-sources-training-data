x = [3 8 1 9 4 7];
mask = x > 4;
disp(x(mask))
x(x < 4) = 0;
disp(x)
disp(find(x == 0))
disp(sum(mask))
