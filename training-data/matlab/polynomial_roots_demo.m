p = [1 -6 11 -6];
r = roots(p);
disp(sort(r)');
disp(poly([1 2 3]));
disp(polyder(p));
disp(polyint([3 2 1]));
disp(conv([1 1], [1 -1]));
[q, rem] = deconv([1 0 -1], [1 1]);
disp(q);
