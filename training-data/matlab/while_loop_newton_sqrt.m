a = 2; x = a;
while abs(x*x - a) > 1e-12
    x = 0.5 * (x + a / x);
end
fprintf('%.10f\n', x);
