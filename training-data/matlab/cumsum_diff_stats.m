d = [3 1 4 1 5 9 2 6];
disp(cumsum(d))
disp(diff(d))
fprintf('mean=%.2f std=%.2f median=%d\n', mean(d), std(d), median(d));
