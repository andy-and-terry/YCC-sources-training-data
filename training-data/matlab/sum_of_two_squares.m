% Positive n expressible as a*a + b*b with a, b >= 0.
out = [];
for n = 1:30
    found = false;
    for a = 0:floor(sqrt(n))
        b = round(sqrt(n - a^2));
        if a^2 + b^2 == n
            found = true;
            break;
        end
    end
    if found
        out(end + 1) = n; %#ok<AGROW>
    end
end
disp(num2str(out));
