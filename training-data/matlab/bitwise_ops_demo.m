a = uint8(12);
b = uint8(10);

disp(bitand(a, b))
disp(bitor(a, b))
disp(bitxor(a, b))
disp(bitshift(a, 2))
disp(bitshift(a, -2))
disp(dec2bin(bitcmp(uint8(5))))

disp(bitget(uint8(5), 1:4))
disp(bitset(uint8(0), 3))
disp(bitset(uint8(15), 1, 0))

is_pow2 = @(n) n > 0 && bitand(n, n - 1) == 0;
disp(arrayfun(is_pow2, [1 2 3 4 6 8 10]))

n = 181;
bits = bitget(n, 8:-1:1);
disp(bits)
fprintf('popcount of %d = %d\n', n, sum(bitget(n, 1:8)));

x = 5; y = 9;
x = bitxor(x, y); y = bitxor(x, y); x = bitxor(x, y);
fprintf('swapped: %d %d\n', x, y);
disp(intmax('uint8') + 1)
disp(class(bitshift(uint16(1), 15)))
disp(flintmax)
