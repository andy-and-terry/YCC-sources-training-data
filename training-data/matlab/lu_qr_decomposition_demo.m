A = [2 1 1; 4 3 3; 8 7 9];
[L, U, P] = lu(A);
disp(norm(P * A - L * U) < 1e-12);
[Q, R] = qr(A);
disp(norm(Q * R - A) < 1e-12);
disp(abs(round(Q' * Q)));
