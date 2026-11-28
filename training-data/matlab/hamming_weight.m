n = uint32(183);
c = 0;
while n ~= 0
    n = bitand(n, n - 1);
    c = c + 1;
end
fprintf('%d %d\n', c, sum(dec2bin(183) == '1'));
