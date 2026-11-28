s = 'abcabc'; k = 3; B = 31; M = 1000003;
for i = 1:(numel(s) - k + 1)
    h = 0;
    for c = double(s(i:i+k-1))
        h = mod(h * B + c, M);
    end
    fprintf('%d %d\n', i - 1, h);
end
