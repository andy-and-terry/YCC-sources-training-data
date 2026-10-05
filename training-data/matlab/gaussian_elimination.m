% Gaussian elimination with partial pivoting
A = [2 1 -1; -3 -1 2; -2 1 2];
b = [8; -11; -3];
disp(gauss_solve(A, b)');

function x = gauss_solve(A, b)
    n = numel(b);
    M = [A b];
    for k = 1:n-1
        [~, idx] = max(abs(M(k:n, k)));
        p = idx + k - 1;
        M([k p], :) = M([p k], :);
        for i = k+1:n
            M(i, :) = M(i, :) - M(i, k) / M(k, k) * M(k, :);
        end
    end
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (M(i, end) - M(i, i+1:n) * x(i+1:n)) / M(i, i);
    end
end
