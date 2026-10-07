col = [1; 2; 3];
row = [10 20 30 40];

sums = col + row;
disp(sums)

scaled = col .* row;
disp(scaled)

normalized = row - mean(row);
disp(normalized)
