% Bead (gravity) sort.
nums = [5 3 1 4 2];
cols = arrayfun(@(i) sum(nums >= i), 1:max(nums));
rows = arrayfun(@(r) sum(cols >= r), 1:numel(nums));
disp(fliplr(rows))
