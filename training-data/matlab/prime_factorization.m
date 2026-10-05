% Prime factorization by trial division
fprintf('360 = %s\n', strjoin(string(factorize(360)), ' * '));
fprintf('97 = %s\n', strjoin(string(factorize(97)), ' * '));

function f = factorize(n)
    f = [];
    p = 2;
    while p * p <= n
        while mod(n, p) == 0
            f(end+1) = p; %#ok<AGROW>
            n = n / p;
        end
        p = p + 1;
    end
    if n > 1
        f(end+1) = n;
    end
end
