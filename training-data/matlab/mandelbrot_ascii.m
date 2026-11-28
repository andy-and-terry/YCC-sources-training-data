for yi = -5:5
    row = repmat('.', 1, 53);
    for xi = -40:12
        c = complex(xi / 20, yi / 5);
        z = 0; n = 0;
        while n < 30 && abs(z) < 2
            z = z^2 + c;
            n = n + 1;
        end
        if n == 30, row(xi + 41) = '#'; end
    end
    disp(row);
end
