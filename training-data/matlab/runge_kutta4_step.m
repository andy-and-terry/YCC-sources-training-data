function runge_kutta4_step()
    f = @(t, y) y - t^2 + 1;
    h = 0.2;
    t = 0; y = 0.5;
    for i = 1:5
        k1 = f(t, y);
        k2 = f(t + h/2, y + h*k1/2);
        k3 = f(t + h/2, y + h*k2/2);
        k4 = f(t + h, y + h*k3);
        y = y + h * (k1 + 2*k2 + 2*k3 + k4) / 6;
        t = t + h;
        fprintf('t=%.1f y=%.6f\n', t, y);
    end
end
