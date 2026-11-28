function bit_reversal()
    for v = [1 6 13 128]
        bits = dec2bin(v, 8);
        r = bin2dec(fliplr(bits));
        fprintf('%d %d\n', v, r); % 128 96 176 1
    end
end
