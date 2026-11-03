is_perfect_square = @(n) n >= 0 & round(sqrt(n)).^2 == n;

n = 0:29;
disp(n(is_perfect_square(n)));
