v = [5 -2 8 -7 0 3];
neg = v(v < 0);
disp(neg);
disp(find(v > 2));
v(v < 0) = 0;
disp(v);
disp(any(v == 8)); disp(all(v >= 0));
