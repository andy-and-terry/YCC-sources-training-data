% Jacobi iterative solver for diagonally dominant linear systems
A = [10 -1 2; -1 11 -1; 2 -1 10];
b = [6; 25; -11];
[x, iters] = jacobi(A, b, 1e-10, 500);
fprintf('Solution: %s after %d iterations\n', mat2str(x', 6), iters);

function [x, k] = jacobi(A, b, tol, maxIter)
    D = diag(A);
    R = A - diag(D);
    x = zeros(size(b));
    for k = 1:maxIter
        xNew = (b - R * x) ./ D;
        if norm(xNew - x, inf) < tol
            x = xNew;
            return;
        end
        x = xNew;
    end
end
