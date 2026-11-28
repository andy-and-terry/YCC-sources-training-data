n = 8;
for r = 0:n-1
    line = repmat(' ', 1, n - r - 1);
    for c = 0:r
        if bitand(r, c) == c
            line = [line '* '];
        else
            line = [line '  '];
        end
    end
    disp(line);
end
