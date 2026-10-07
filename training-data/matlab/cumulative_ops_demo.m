x = [3 1 4 1 5 9 2 6];

running_sum = cumsum(x);
running_prod = cumprod([1 2 3 4 5]);
running_max = cummax(x);
running_min = cummin(x);

disp(running_sum);
disp(running_prod);
disp(running_max);
disp(running_min);

% differences are the inverse of cumulative sums
d = diff(running_sum);
disp(isequal(d, x(2:end)));

% cumulative operations along matrix dimensions
M = [1 2 3; 4 5 6];
disp(cumsum(M, 1));
disp(cumsum(M, 2));

% moving average via cumsum
k = 3;
c = cumsum([0 x]);
moving_avg = (c(k+1:end) - c(1:end-k)) / k;
fprintf('%.3f ', moving_avg);
fprintf('\n');
