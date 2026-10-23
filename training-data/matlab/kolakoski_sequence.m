% Kolakoski sequence: a sequence of 1s and 2s that describes its own run lengths
count = 20;
seq = [1 2 2];
i = 3;  % index of the term giving the next run length
while numel(seq) < count
    symbol = 2 - mod(i, 2);  % odd runs are 1s, even runs are 2s
    seq = [seq, repmat(symbol, 1, seq(i))];
    i = i + 1;
end
disp(seq(1:count))
