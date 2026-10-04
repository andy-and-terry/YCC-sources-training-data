function vectorized_distance_matrix()
    P = [0 0; 3 4; 6 8; 1 1];
    n = size(P, 1);

    D = zeros(n);
    for i = 1:n
        for j = 1:n
            D(i, j) = norm(P(i, :) - P(j, :));
        end
    end

    dx = P(:, 1) - P(:, 1)';
    dy = P(:, 2) - P(:, 2)';
    D2 = sqrt(dx.^2 + dy.^2);
    disp(D);
    disp(max(abs(D(:) - D2(:))) < 1e-12);

    [~, nearest] = min(D + diag(inf(n, 1)), [], 2);
    disp(nearest');
    disp(sum(triu(D, 1), 'all') / 2);
end
