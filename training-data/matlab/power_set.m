function subsets = power_set(arr)
    n = numel(arr);
    subsets = cell(1, 2^n);
    for mask = 0:(2^n - 1)
        subset = [];
        for bit = 0:n-1
            if bitand(mask, bitshift(1, bit)) ~= 0
                subset(end+1) = arr(bit + 1);
            end
        end
        subsets{mask + 1} = subset;
    end
end

sets = power_set([1 2 3]);
for i = 1:numel(sets)
    disp(sets{i})
end
