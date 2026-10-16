x = [1 4 9 16 25];
d1 = diff(x);
d2 = diff(x, 2);
disp(d1);
disp(d2);
g = gradient(x);
disp(g);
