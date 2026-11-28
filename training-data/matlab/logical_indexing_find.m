A = magic(4);
[r, c] = find(A > 12);
disp([r c]);
A(A < 5) = 0;
disp(A);
