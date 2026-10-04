a = uint8(12);   % 00001100
b = uint8(10);   % 00001010

disp(bitand(a, b));
disp(bitor(a, b));
disp(bitxor(a, b));
disp(bitshift(a, 2));
disp(bitshift(a, -2));
disp(bitcmp(uint8(0)));

disp(dec2bin(a, 8));
disp(dec2bin(bitxor(a, b), 8));
disp(bin2dec('101101'));
disp(dec2hex(255));
disp(hex2dec('FF'));

% Test, set, and clear individual bits
flags = uint8(0);
flags = bitset(flags, 1);
flags = bitset(flags, 4);
disp(dec2bin(flags, 8));
disp(bitget(flags, 4));
flags = bitset(flags, 1, 0);
disp(dec2bin(flags, 8));

% Power of two check
isPow2 = @(n) n > 0 && bitand(n, n - 1) == 0;
disp(arrayfun(isPow2, [1 6 8 100 1024]));

% Population count via a loop
n = uint16(43690);
count = 0;
while n > 0
    count = count + double(bitand(n, 1));
    n = bitshift(n, -1);
end
disp(count);

disp(intmax('uint8') + 1);
disp(swapbytes(uint16(1)));
