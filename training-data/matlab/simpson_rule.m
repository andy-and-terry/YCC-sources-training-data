% Composite Simpson's 1/3 rule (n must be even)
f = @(x) exp(-x.^2);
fprintf('Integral ~ %.8f\n', simpson(f, 0, 1, 10));

function area = simpson(f, a, b, n)
    if mod(n, 2) ~= 0
        error('simpson:oddN', 'n must be even');
    end
    h = (b - a) / n;
    x = a:h:b;
    y = f(x);
    area = h / 3 * (y(1) + 4 * sum(y(2:2:end-1)) + 2 * sum(y(3:2:end-2)) + y(end));
end
