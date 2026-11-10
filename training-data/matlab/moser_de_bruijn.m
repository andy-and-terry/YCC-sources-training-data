function moser_de_bruijn()
    % Read the binary digits of i as base-4 digits.
    out = zeros(1, 10);
    for i = 0:9
        out(i + 1) = base2dec(dec2bin(i), 4);
    end
    disp(out); % 0 1 4 5 16 17 20 21 64 65
end
