v = 1:12;

A = reshape(v, 3, 4);
disp(A);
disp(reshape(A, 2, []));
disp(reshape(v, [2 3 2]));
disp(size(reshape(v, [2 3 2])));

disp(A(:)');
disp(A');
disp(squeeze(ones(1, 1, 3))');

R = repmat([1 2], 2, 3);
disp(R);

disp(kron(eye(2), [1 2]));
disp(circshift(1:5, 2));
disp(circshift(A, 1, 2));
disp(fliplr(1:4));
disp(flipud([1; 2; 3])');
disp(rot90([1 2; 3 4]));
disp(permute(reshape(1:6, 2, 3), [2 1]));
disp(cat(1, [1 2], [3 4]));
disp(horzcat([1; 2], [3; 4]));
disp(vertcat(1:3, 4:6));
disp(numel(A));
disp(ndims(reshape(v, [2 3 2])));
