% Cumulative operations and diff as their inverse
v = [3 1 4 1 5 9 2 6];
disp(cumsum(v));
disp(cumprod([1 2 3 4 5]));
disp(cummax(v));
disp(cummin(v));
disp(diff(cumsum(v)));   % recovers v(2:end)
M = magic(4);
disp(cumsum(M, 2));
