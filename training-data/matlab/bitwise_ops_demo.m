a = uint8(12);   % 00001100
b = uint8(10);   % 00001010

disp(bitand(a, b));
disp(bitor(a, b));
disp(bitxor(a, b));
disp(bitshift(a, 2));
disp(bitshift(a, -2));
disp(dec2bin(bitcmp(a), 8));

n = 37;
disp(dec2bin(n));
disp(bitget(n, 1:6));
disp(bitset(n, 2));
disp(bitset(n, 1, 0));

% count set bits and test power of two
bits = dec2bin(255) == '1';
disp(sum(bits));
is_pow2 = @(x) x > 0 && bitand(x, x - 1) == 0;
disp(arrayfun(is_pow2, [1 6 16 18 64]));

% saturating integer arithmetic
disp(uint8(250) + uint8(10));
disp(int8(-120) - int8(20));
disp(intmax('int16'));
disp(intmin('int16'));
disp(class(a + 1));
