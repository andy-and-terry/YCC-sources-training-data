% Golomb sequence: G(1) = 1, G(n) = 1 + G(n - G(G(n-1)))
count = 20;
g = zeros(1, count);
g(1) = 1;
for n = 2:count
    g(n) = 1 + g(n - g(g(n - 1)));
end
disp(g)
