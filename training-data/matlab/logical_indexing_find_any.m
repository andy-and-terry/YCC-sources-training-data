v = [4 -1 7 0 -3];
disp(find(v < 0))
disp(any(v == 0))
v(v < 0) = 0;
disp(v)
