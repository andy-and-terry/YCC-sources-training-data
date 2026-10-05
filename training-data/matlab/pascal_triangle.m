% Print the first rows of Pascal's triangle
rows = 6;
row = 1;
for r = 1:rows
    fprintf('%s\n', num2str(row));
    row = [row 0] + [0 row];
end
