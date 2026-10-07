A = 1:12;

B = reshape(A, 3, 4);
disp(B);
disp(reshape(A, [], 2)');
disp(reshape(B, 2, 6));

disp(B(:)');
disp(B');
disp(fliplr(B));
disp(flipud(B));
disp(rot90(B));
disp(circshift(1:6, 2));
disp(circshift(B, 1, 2));

C = reshape(1:24, 2, 3, 4);
disp(size(C));
disp(squeeze(C(1, 2, :))');
P = permute(C, [3 1 2]);
disp(size(P));
disp(size(permute(C, [2 1 3])));

disp(cat(3, [1 2], [3 4]));
disp(size(cat(3, [1 2], [3 4])));
disp(horzcat([1 2], [3]));
disp(vertcat([1 2], [3 4]));
disp(repmat([1 2], 2, 2));
disp(kron(eye(2), [1 2]));

disp(numel(C));
disp(ndims(C));
disp(sum(C, 3));
disp(squeeze(sum(sum(C, 1), 2))');
disp(isrow(A));
disp(iscolumn(A'));
disp(isequal(reshape(B, 1, []), A));
