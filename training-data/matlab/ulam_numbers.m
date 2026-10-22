% Next term: smallest value with exactly one representation as a sum of two distinct terms
count = 15;
terms = [1 2];
cand = 2;
while numel(terms) < count
    cand = cand + 1;
    ways = 0;
    for a = 1:numel(terms)
        for b = a + 1:numel(terms)
            if terms(a) + terms(b) == cand
                ways = ways + 1;
            end
        end
    end
    if ways == 1
        terms(end + 1) = cand;
    end
end
disp(strjoin(arrayfun(@num2str, terms, 'UniformOutput', false), ' '))
