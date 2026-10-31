function odd_cubes_identity()
    for n = 1:5
        c = cube_from_odds(n);
        fprintf('%d %d %d\n', n, c, c == n^3);
    end
end

function c = cube_from_odds(n)
    start = n * n - n + 1;
    c = sum(start + 2 * (0:n-1));
end
