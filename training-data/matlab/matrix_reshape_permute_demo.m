A = 1:12;

B = reshape(A, 3, 4);
disp(B)
disp(reshape(B, 2, []))
disp(B(:)')

disp(B')
disp(permute(B, [2 1]))

C = reshape(1:24, 2, 3, 4);
disp(size(C))
D = permute(C, [3 1 2]);
disp(size(D))
disp(squeeze(C(1, 2, :))')

disp(circshift(1:5, 2))
disp(circshift(B, 1, 2))
disp(fliplr(1:4))
disp(flipud([1; 2; 3])')
disp(rot90([1 2; 3 4]))
disp(repmat([1 2], 2, 2))
disp(cat(1, [1 2], [3 4]))
disp(horzcat([1; 2], [3; 4]))
disp(kron([1 2], [1; 1]))
disp(triu(magic(3)))
disp(diag([1 2 3]))
disp(trace(magic(3)))
