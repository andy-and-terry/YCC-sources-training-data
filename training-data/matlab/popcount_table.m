% Population count (number of set bits) for 0..15
bits = arrayfun(@(n) sum(dec2bin(n) == '1'), 0:15);
disp(num2str(bits));
