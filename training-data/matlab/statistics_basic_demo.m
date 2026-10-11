data = [2 4 4 4 5 5 7 9];
fprintf('mean %.2f\n', mean(data));
fprintf('median %.2f\n', median(data));
fprintf('mode %d\n', mode(data));
fprintf('std %.4f\n', std(data));
fprintf('var %.4f\n', var(data, 1));
fprintf('range %d\n', range(data));
