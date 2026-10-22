% Farey sequence F_n: reduced fractions in [0,1] with denominator <= n
n = 5;
a = 0; b = 1; c = 1; d = n;
terms = {sprintf('%d/%d', a, b)};
while c <= n
    k = floor((n + b) / d);
    e = k * c - a;
    f = k * d - b;
    a = c; b = d; c = e; d = f;
    terms{end + 1} = sprintf('%d/%d', a, b);
end
disp(strjoin(terms, ' '))
