A = reshape(1:12, 3, 4);
disp(A)
disp(A(:, end:-1:1))
[s, idx] = sort([5 2 9 2], 'descend');
disp(s), disp(idx)
disp(unique([3 1 3 2 1]))
disp(any(A(:) > 11))
