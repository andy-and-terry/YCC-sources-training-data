x = linspace(0, pi, 101);
y = sin(x);
disp(trapz(x, y))
disp(polyfit([1 2 3], [2 4 6], 1))
