% Moving-window statistics: movmean, movmedian, movsum, movmax
data = [2 4 3 20 5 6 4 7 5];

disp(movmean(data, 3));          % centered window of 3
disp(movmedian(data, 3));        % median is robust to the spike (20)
disp(movsum(data, 3));
disp(movmax(data, 3));

% Window as [back forward]: trailing average over the last 3 samples
disp(movmean(data, [2 0]));

% Edge handling: by default windows shrink at the ends
disp(movmean(data, 5));
disp(movmean(data, 5, 'Endpoints', 'discard'));

% Compare with a manual convolution (valid region only)
manual = conv(data, ones(1, 3) / 3, 'valid');
disp(manual);

% Remove an outlier by comparing against the moving median
med = movmedian(data, 5);
outliers = abs(data - med) > 5;
fprintf('outlier indices: %s\n', mat2str(find(outliers)));
