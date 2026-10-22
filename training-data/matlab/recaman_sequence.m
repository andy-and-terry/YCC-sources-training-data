% Recaman sequence: a(n) = a(n-1) - n if positive and unseen, else a(n-1) + n
count = 20;
terms = zeros(1, count);
for i = 2:count
    candidate = terms(i - 1) - (i - 1);
    if candidate < 0 || ismember(candidate, terms(1:i - 1))
        candidate = terms(i - 1) + (i - 1);
    end
    terms(i) = candidate;
end
disp(terms)
