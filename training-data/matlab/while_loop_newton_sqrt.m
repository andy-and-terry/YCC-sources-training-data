x = 2; g = 1;
while abs(g^2 - x) > 1e-10
    g = (g + x / g) / 2;
end
fprintf('%.8f\n', g);
