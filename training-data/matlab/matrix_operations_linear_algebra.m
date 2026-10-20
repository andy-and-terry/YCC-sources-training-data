A = [2 1; 1 3];
b = [1; 2];
x = A \ b;
disp(x')
disp(det(A)); disp(inv(A)); disp(A'); disp(trace(A)); disp(rank(A))
[V, D] = eig(A);
disp(diag(D)')
disp(A * A); disp(A .* A); disp(A .^ 2); disp(A ^ 2)
disp(eye(2)); disp(zeros(2, 3)); disp(ones(1, 3)); disp(size(rand(3, 4)))
B = reshape(1:6, 2, 3);
disp(B); disp(B(:, 2)'); disp(B(end, :)); disp(B(:)')
disp([B; 7 8 9]); disp([B, [0; 0]])
disp(norm([3 4])); disp(dot([1 2 3], [4 5 6])); disp(cross([1 0 0], [0 1 0]))
disp(kron(eye(2), [1 2]))
disp(triu(magic(3))); disp(circshift(1:5, 2))
