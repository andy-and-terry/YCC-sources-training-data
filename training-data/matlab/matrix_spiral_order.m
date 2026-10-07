% Traverse a matrix in spiral order
M = reshape(1:12, 4, 3)';
disp(spiral(M));

function out = spiral(M)
    out = [];
    while ~isempty(M)
        out = [out M(1, :)]; %#ok<AGROW>
        M = M(2:end, :);
        M = rot90(M);
    end
end
