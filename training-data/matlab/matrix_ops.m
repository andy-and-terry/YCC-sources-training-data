A = [1 2; 3 4];
B = [5 6; 7 8];

C = A * B;
D = A .* B;
disp(C);
disp(D);
disp(trace(A));
disp(det(A));
disp(inv(A));
