% n is triangular iff 8n + 1 is a perfect square.
out = [];
for n = 0:20
    s = 8 * n + 1;
    r = round(sqrt(s));
    if r * r == s
        out(end + 1) = n; %#ok<AGROW>
    end
end
disp(num2str(out));
