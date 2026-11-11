% Lazy caterer sequence: max pieces from n cuts
term = @(n) ((n * (n + 1))/2) + 1;

disp(num2str(arrayfun(term, 0:9)));
