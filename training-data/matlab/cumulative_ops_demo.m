v = [3 1 4 1 5 9 2 6];

disp(cumsum(v));
disp(cumprod([1 2 3 4 5]));
disp(cummax(v));
disp(cummin(v));
disp(diff(v));
disp(diff(v, 2));

M = [1 2 3; 4 5 6; 7 8 9];
disp(cumsum(M));
disp(cumsum(M, 2));
disp(sum(M(:)));
disp(prod(M(1, :)));

% Moving average via convolution
window = 3;
ma = conv(v, ones(1, window) / window, 'valid');
disp(round(ma * 100) / 100);
disp(movmean(v, 3));

% Running total with reset on negative values
deltas = [5 3 -1 4 -1 2];
running = zeros(size(deltas));
total = 0;
for i = 1:numel(deltas)
    if deltas(i) < 0
        total = 0;
    else
        total = total + deltas(i);
    end
    running(i) = total;
end
disp(running);

disp(mean(v));
disp(median(v));
disp(mode(v));
disp(std(v));
disp(var(v));
disp(range(v));
disp(prctile(v, 50));
