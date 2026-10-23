% Look-and-say sequence: describe runs of equal digits
s = '1';
for k = 1:7
    disp(s);
    d = diff([0 find(diff(s) ~= 0) numel(s)]);   % run lengths
    starts = cumsum([1 d(1:end-1)]);
    out = '';
    for j = 1:numel(d)
        out = [out num2str(d(j)) s(starts(j))];
    end
    s = out;
end
