sq = magic_square_odd(5);
disp(sq);
fprintf('Row sums: %s\n', mat2str(sum(sq, 2)'));
fprintf('Col sums: %s\n', mat2str(sum(sq, 1)));

function sq = magic_square_odd(n)
    sq = zeros(n);
    r = 1;
    c = (n + 1) / 2;
    for k = 1:n^2
        sq(r, c) = k;
        nr = mod(r - 2, n) + 1;
        nc = mod(c, n) + 1;
        if sq(nr, nc) ~= 0
            nr = mod(r, n) + 1;
            nc = c;
        end
        r = nr;
        c = nc;
    end
end
