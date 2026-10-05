% Binning data with histcounts and discretize
data = [1 2 2 3 3 3 4 4 4 4 5 5 6];
edges = 0:2:6;
counts = histcounts(data, edges);
bins = discretize(data, edges);
for i = 1:numel(counts)
    fprintf('[%d, %d): %d\n', edges(i), edges(i+1), counts(i));
end
disp(bins);
