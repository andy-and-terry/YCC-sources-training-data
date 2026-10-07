x = [3 1 4 1 5 9 2 6];

disp(cumsum(x))
disp(cumprod([1 2 3 4]))
disp(cummax(x))
disp(cummin(x))
disp(diff(x))
disp(diff(x, 2))

A = [1 2 3; 4 5 6];
disp(cumsum(A, 1))
disp(cumsum(A, 2))

running_mean = cumsum(x) ./ (1:numel(x));
fprintf('%.3f ', running_mean);
fprintf('\n');

signs = sign(diff(x));
fprintf('direction changes: %d\n', sum(diff(signs) ~= 0));
disp(prod([1 2 3 4 5]))
