function out = rot47_cipher(s)
    c = double(s);
    m = c >= 33 & c <= 126;
    c(m) = 33 + mod(c(m) - 33 + 47, 94);
    out = char(c);
end
