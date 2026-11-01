% Leyland numbers: x^y + y^x for x >= y >= 2.
vals = [];
for x = 2:4
    for y = 2:x
        vals(end + 1) = x^y + y^x; %#ok<AGROW>
    end
end
disp(num2str(vals));
