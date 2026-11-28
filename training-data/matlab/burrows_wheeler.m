s = 'banana$';
n = numel(s);
rots = cell(n, 1);
for i = 1:n
    rots{i} = [s(i:end) s(1:i-1)];
end
rots = sort(rots);
out = cellfun(@(r) r(end), rots)';
disp(out);
