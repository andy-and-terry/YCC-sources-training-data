x = [3 1 4 1 5 9 2 6];
disp(cummax(x));
disp(cummin(x));
[m, idx] = max(x);
fprintf('max %d at %d\n', m, idx);
