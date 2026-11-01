% Greedy sequence whose pairwise sums are all distinct.
seq = [];
sums = [];
cand = 1;
while numel(seq) < 8
    fresh = [seq, cand] + cand;
    if numel(unique(fresh)) == numel(fresh) && ~any(ismember(fresh, sums))
        seq(end + 1) = cand; %#ok<AGROW>
        sums = [sums, fresh]; %#ok<AGROW>
    end
    cand = cand + 1;
end
disp(num2str(seq));
