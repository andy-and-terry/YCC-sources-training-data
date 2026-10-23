T = toeplitz([1 2 3 4]);
disp(T);

T2 = toeplitz([1 5 6], [1 2 3 4]);
disp(T2);

H = hankel([1 2 3 4]);
disp(H);

V = vander([1 2 3]);
disp(V);

c = polyfit([1 2 3], [1 4 9], 2);
disp(round(c * 1000) / 1000);
disp(V \ [1; 4; 9]);
