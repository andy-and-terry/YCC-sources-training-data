n = 6;
row = 1;
for i = 1:n
    fprintf('%s%s\n', repmat(' ', 1, 2 * (n - i)), sprintf('%4d', row));
    row = [row 0] + [0 row];
end

disp(nchoosek(5, 2))
disp(factorial(5))

C = zeros(n);
for i = 1:n
    C(i, 1) = 1;
    for j = 2:i
        C(i, j) = C(i-1, j-1) + C(i-1, j);
    end
end
disp(C)
disp(pascal(4))
fprintf('row sums: %s\n', mat2str(sum(C, 2)'));
