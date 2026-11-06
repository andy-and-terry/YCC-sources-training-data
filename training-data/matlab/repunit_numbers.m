% Repunits: numbers made only of the digit 1.
r = 0;
out = zeros(1, 5);
for i = 1:5
    r = r * 10 + 1;
    out(i) = r;
end
disp(out);
