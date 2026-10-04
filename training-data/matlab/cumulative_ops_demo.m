function cumulative_ops_demo()
    x = [3 1 4 1 5 9 2 6];
    disp(cumsum(x));
    disp(cumprod([1 2 3 4]));
    disp(cummax(x));
    disp(cummin(x));
    disp(diff(x));
    disp(diff(x, 2));

    window = 3;
    disp(movmean(x, window));
    disp(conv(x, ones(1, window) / window, 'valid'));

    A = magic(4);
    disp(cumsum(A, 2));
    disp(sum(A(:)));
    disp(prod(1:6));
    disp(mean(x)); disp(median(x)); disp(std(x));
end
