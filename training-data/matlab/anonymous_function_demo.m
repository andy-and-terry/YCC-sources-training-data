square = @(x) x .^ 2;
add = @(x, y) x + y;

numbers = 1:5;
disp(arrayfun(square, numbers))
disp(add(3, 4))
