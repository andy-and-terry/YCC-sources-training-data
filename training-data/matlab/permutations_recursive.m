function result = permutations_recursive(arr)
    if numel(arr) <= 1
        result = {arr};
        return
    end
    result = {};
    for i = 1:numel(arr)
        rest = arr([1:i-1, i+1:end]);
        sub = permutations_recursive(rest);
        for j = 1:numel(sub)
            result{end+1} = [arr(i), sub{j}];
        end
    end
end

perms_list = permutations_recursive([1 2 3]);
for i = 1:numel(perms_list)
    disp(perms_list{i})
end
