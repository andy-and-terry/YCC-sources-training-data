function out = varint_encode(n)
    out = [];
    while n >= 128
        out(end+1) = bitor(mod(n, 128), 128); %#ok<AGROW>
        n = floor(n / 128);
    end
    out(end+1) = n;
end
