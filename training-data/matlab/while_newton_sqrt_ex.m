a = 2; x = a;
iter = 0;
while abs(x^2 - a) > 1e-12 && iter < 50
    x = 0.5 * (x + a / x);
    iter = iter + 1;
end
fprintf('sqrt(2) ~ %.10f after %d iterations\n', x, iter);
