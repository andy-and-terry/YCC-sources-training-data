% Van Eck's sequence: next term is the distance since the last term
% previously appeared, or 0 if it is new
count = 20;
seq = zeros(1, count);
for n = 2:count
    prev = find(seq(1:n - 2) == seq(n - 1), 1, 'last');
    if ~isempty(prev)
        seq(n) = (n - 1) - prev;
    end
end
disp(seq)
