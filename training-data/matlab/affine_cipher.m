msg = 'AFFINE'; a = 5; b = 8;
x = msg - 'A';
y = mod(a * x + b, 26);
disp(char(y + 'A'));
