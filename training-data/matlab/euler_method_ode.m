function [t, y] = euler_method_ode(f, t0, y0, h, n)
    t = zeros(1, n + 1);
    y = zeros(1, n + 1);
    t(1) = t0;
    y(1) = y0;
    for i = 1:n
        y(i + 1) = y(i) + h * f(t(i), y(i));
        t(i + 1) = t(i) + h;
    end
end
