% Kolakoski over {1, 2}: the run lengths of the sequence describe itself
count = 20;
terms = [1 2 2];
idx = 3;
while numel(terms) < count
    sym = 3 - terms(end);
    terms = [terms, repmat(sym, 1, terms(idx))];
    idx = idx + 1;
end
disp(strjoin(arrayfun(@num2str, terms(1:count), 'UniformOutput', false), ' '))
