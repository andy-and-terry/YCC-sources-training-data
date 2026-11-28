x = [1 4 9 16 25];
disp(diff(x));
disp(cumsum(x));
disp(x(x > 5 & mod(x, 2) == 1));
