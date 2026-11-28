a = [10 9 2 5 3 7 101 18];
tails = [];
for x = a
    i = find(tails >= x, 1);
    if isempty(i)
        tails(end + 1) = x;
    else
        tails(i) = x;
    end
end
disp(numel(tails));
