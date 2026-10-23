x = [1 0 -1];
y = [1 2 0];

[theta, rho] = cart2pol(x, y);
disp(round(theta * 1000) / 1000);
disp(round(rho * 1000) / 1000);

[x2, y2] = pol2cart(theta, rho);
fprintf('round trip error: %.2e\n', max(abs([x2 - x, y2 - y])));

fprintf('atan2(1, -1) = %.4f rad = %.1f deg\n', atan2(1, -1), rad2deg(atan2(1, -1)));
fprintf('hypot(3, 4) = %g\n', hypot(3, 4));
fprintf('sind(30) = %.4f\n', sind(30));
fprintf('deg2rad(180) = %.4f\n', deg2rad(180));
