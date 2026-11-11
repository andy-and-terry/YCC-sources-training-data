% Tetrahedral numbers n(n+1)(n+2)/6
term = @(n) ((n * (n + 1)) * (n + 2))/6;

disp(num2str(arrayfun(term, 0:9)));
