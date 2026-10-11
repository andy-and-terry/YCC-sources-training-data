x = [1 2 6 4 5 9 8];
w = ones(1, 3) / 3;
y = conv(x, w, 'valid');
disp(y);
z = conv(x, w, 'same');
disp(z);
