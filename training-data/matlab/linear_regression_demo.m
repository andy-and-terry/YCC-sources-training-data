x = [1 2 3 4 5];
y = [2.1 3.9 6.1 7.8 10.2];

n = numel(x);
slope = (n * sum(x .* y) - sum(x) * sum(y)) / (n * sum(x .^ 2) - sum(x) ^ 2);
intercept = (sum(y) - slope * sum(x)) / n;

fprintf('slope = %.3f\n', slope);
fprintf('intercept = %.3f\n', intercept);

predicted = slope * x + intercept;
disp(predicted)
