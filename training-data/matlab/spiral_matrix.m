n = 4;
M = zeros(n);
top = 1; bottom = n; left = 1; right = n;
k = 1;
while top <= bottom && left <= right
    for j = left:right
        M(top, j) = k; k = k + 1;
    end
    top = top + 1;
    for i = top:bottom
        M(i, right) = k; k = k + 1;
    end
    right = right - 1;
    if top <= bottom
        for j = right:-1:left
            M(bottom, j) = k; k = k + 1;
        end
        bottom = bottom - 1;
    end
    if left <= right
        for i = bottom:-1:top
            M(i, left) = k; k = k + 1;
        end
        left = left + 1;
    end
end
disp(M)

% read a matrix in spiral order
A = magic(4);
out = [];
while ~isempty(A)
    out = [out A(1, :)];
    A(1, :) = [];
    A = rot90(A);
end
disp(out)
