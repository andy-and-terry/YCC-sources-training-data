% Stern's diatomic sequence: s(0) = 0, s(1) = 1, s(2n) = s(n), s(2n+1) = s(n) + s(n+1)
% MATLAB indices are 1-based, so s(n) is stored in s(n + 1)
count = 20;
s = zeros(1, count);
s(2) = 1;
for n = 2:count - 1
    h = floor(n / 2);
    if mod(n, 2) == 0
        s(n + 1) = s(h + 1);
    else
        s(n + 1) = s(h + 1) + s(h + 2);
    end
end
disp(s)
