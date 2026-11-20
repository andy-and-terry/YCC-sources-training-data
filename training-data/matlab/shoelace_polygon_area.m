% Shoelace polygon area, vectorised.
x = [0 4 4 0]; y = [0 0 3 3];
x2 = circshift(x, -1); y2 = circshift(y, -1);
area = abs(sum(x .* y2 - x2 .* y)) / 2;
disp(area)
