% s-gonal number: P(s, n) = ((s - 2) * n^2 - (s - 4) * n) / 2
n = 1:10;
polygonal = @(s) ((s - 2) * n .^ 2 - (s - 4) * n) / 2;
fprintf('Triangular: %s\n', mat2str(polygonal(3)));
fprintf('Pentagonal: %s\n', mat2str(polygonal(5)));
fprintf('Hexagonal: %s\n', mat2str(polygonal(6)));
