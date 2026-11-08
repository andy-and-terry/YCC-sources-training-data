function root = secant_method(f, a, b)
    for k = 1:40
        fa = f(a); fb = f(b);
        if fb == fa, break; end
        c = b - fb * (b - a) / (fb - fa);
        a = b; b = c;
    end
    root = b;
end
