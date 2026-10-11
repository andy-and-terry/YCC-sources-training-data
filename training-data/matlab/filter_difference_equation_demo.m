x = [1 zeros(1, 5)];
b = 1;
a = [1 -0.5];
y = filter(b, a, x);
disp(y);
fir = filter([0.5 0.5], 1, [2 4 6 8]);
disp(fir);
