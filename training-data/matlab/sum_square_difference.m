% Square of the sum minus sum of squares for 1..10 (expect 2640)
xs = 1:10;
disp(sum(xs)^2 - sum(xs .^ 2));
