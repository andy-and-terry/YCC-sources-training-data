% Pronic numbers n(n+1)
term = @(n) n * (n + 1);

disp(num2str(arrayfun(term, 0:9)));
