v = 1:6;
disp(circshift(v, 2));
disp(circshift(v, -1));
A = magic(3);
disp(circshift(A, 1, 1));
disp(circshift(A, 1, 2));
